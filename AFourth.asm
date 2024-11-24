; works CRUD DONE  


.MODEL SMALL
.STACK 100H
.DATA
    ; Constants
    MAX_TASKS    EQU 10
    TASK_SIZE    EQU 52  ; 50 chars for task + 1 for status + 1 for '$'
    
    ; Messages
    MENU_MSG     DB 10,13,'=== TODO List ===',10,13
                 DB '1. Create Task',10,13
                 DB '2. View Tasks',10,13
                 DB '3. Delete Task',10,13
                 DB '4. Update Task',10,13
                 DB '5. Exit',10,13
                 DB 'Choose option: $'
    INPUT_TASK   DB 10,13,'Enter task: $'
    TASK_NUM     DB 10,13,'Enter task number: $'
    STATUS_MSG   DB 10,13,'Status (1=Done, 0=Not Done): $'
    FULL_MSG     DB 10,13,'Task list is full!$'
    EMPTY_MSG    DB 10,13,'No tasks found!$'
    SUCCESS_MSG  DB 10,13,'Operation successful!$'
    NEWLINE      DB 10,13,'$'
    
    ; Data structures
    TASKS        DB MAX_TASKS * TASK_SIZE DUP(0)  ; Array of tasks
    TASK_COUNT   DB 0                             ; Current number of tasks
    TEMP_STR     DB TASK_SIZE DUP(0)             ; Temporary string buffer
    JUMP_TABLE   DW OFFSET CREATE_TASK
                 DW OFFSET VIEW_TASKS
                 DW OFFSET DELETE_TASK
                 DW OFFSET UPDATE_TASK
                 DW OFFSET EXIT_PROG

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

GOTO_MENU:
    JMP MENU

MENU:
    ; Display menu
    LEA DX, MENU_MSG
    MOV AH, 09H
    INT 21H
    
    ; Get choice
    MOV AH, 01H
    INT 21H
    
    ; Convert choice to index
    SUB AL, '1'
    CALL CHECK_MENU_CHOICE
    
    ; Calculate jump address
    XOR AH, AH
    SHL AX, 1      ; Multiply by 2 for word offset
    MOV SI, AX
    JMP WORD PTR [JUMP_TABLE + SI]

; Utility procedures
CHECK_RANGE PROC
    CMP AL, 0
    JL INVALID_CHECK
    CMP AL, TASK_COUNT
    JAE INVALID_CHECK
    RET
INVALID_CHECK:
    MOV AL, 0FFH   ; Set error flag
    RET
CHECK_RANGE ENDP

CHECK_MENU_CHOICE PROC
    CMP AL, 4
    JAE MENU_INVALID
    RET
MENU_INVALID:
    POP AX      ; Remove return address
    JMP MENU
CHECK_MENU_CHOICE ENDP

; Fixed DELETE_TASK procedure
DELETE_TASK PROC
    CMP TASK_COUNT, 0
    JE EMPTY_DEL
    
    ; Display prompt
    LEA DX, TASK_NUM
    MOV AH, 09H
    INT 21H
    
    ; Get task number
    MOV AH, 01H
    INT 21H
    SUB AL, '1'
    
    ; Validate input
    CMP AL, 0
    JL INVALID_DEL
    
    MOV BL, TASK_COUNT
    DEC BL
    CMP AL, BL
    JG INVALID_DEL
    
    ; Calculate source and destination addresses
    XOR AH, AH
    MOV BX, TASK_SIZE
    MUL BX          ; AX = task_number * TASK_SIZE
    LEA SI, TASKS
    ADD SI, AX      ; SI points to task to delete
    MOV DI, SI      ; DI = destination
    ADD SI, TASK_SIZE  ; SI = source
    
    ; Calculate number of bytes to move
    MOV AL, TASK_COUNT
    SUB AL, 1       ; Convert to 0-based index
    SUB AL, [BP-1]  ; Subtract task number
    MOV CL, AL      ; CL = number of tasks to move
    
    ; If this is the last task, no need to move
    CMP CL, 0
    JLE DEL_LAST
    
    ; Move remaining tasks
    MOV CH, 0       ; Clear high byte of CX
    MOV BX, TASK_SIZE
DEL_LOOP:
    PUSH CX
    MOV CX, TASK_SIZE
    REP MOVSB
    POP CX
    LOOP DEL_LOOP
    
DEL_LAST:
    DEC TASK_COUNT
    LEA DX, SUCCESS_MSG
    JMP SHOW_DEL

INVALID_DEL:
    LEA DX, EMPTY_MSG
    JMP SHOW_DEL

EMPTY_DEL:
    LEA DX, EMPTY_MSG
SHOW_DEL:
    CALL SHOW_MESSAGE
    RET
DELETE_TASK ENDP

UPDATE_TASK PROC
    CMP TASK_COUNT, 0
    JE EMPTY_UPD
    
    ; Display prompt for task number
    LEA DX, TASK_NUM
    MOV AH, 09H
    INT 21H
    
    ; Get task number
    MOV AH, 01H
    INT 21H
    SUB AL, '1'     ; Convert to 0-based index
    
    ; Validate task number
    CMP AL, 0
    JL INVALID_UPD
    
    MOV BL, TASK_COUNT
    DEC BL          ; Convert count to 0-based for comparison
    CMP AL, BL
    JG INVALID_UPD
    
    ; Calculate task address
    XOR AH, AH      ; Clear high byte of AX
    MOV BX, TASK_SIZE
    MUL BX          ; AX = task_number * TASK_SIZE
    LEA DI, TASKS
    ADD DI, AX      ; DI now points to the task
    
    ; Show status prompt
    LEA DX, STATUS_MSG
    MOV AH, 09H
    INT 21H
    
    ; Get new status
    MOV AH, 01H
    INT 21H
    
    ; Validate status input (must be 0 or 1)
    CMP AL, '0'
    JB INVALID_UPD
    CMP AL, '1'
    JA INVALID_UPD
    
    ; Update status
    MOV [DI + 50], AL
    
    ; Show success message
    LEA DX, SUCCESS_MSG
    JMP SHOW_UPD

INVALID_UPD:
    LEA DX, EMPTY_MSG    ; Use EMPTY_MSG for invalid input
    JMP SHOW_UPD

EMPTY_UPD:
    LEA DX, EMPTY_MSG
SHOW_UPD:
    CALL SHOW_MESSAGE
    RET
UPDATE_TASK ENDP

PRINT_NEWLINE PROC
    PUSH AX
    PUSH DX
    LEA DX, NEWLINE
    MOV AH, 09H
    INT 21H
    POP DX
    POP AX
    RET
PRINT_NEWLINE ENDP

GET_STRING PROC
    PUSH CX
    XOR CX, CX
    
GET_CHAR:
    MOV AH, 01H
    INT 21H
    
    CMP AL, 13
    JE GET_DONE
    
    MOV [DI], AL
    INC DI
    INC CX
    CMP CX, 49
    JNE GET_CHAR
    
GET_DONE:
    MOV BYTE PTR [DI], '$'    ; Add string terminator right after input
    POP CX
    RET
GET_STRING ENDP

SHOW_MESSAGE PROC
    MOV AH, 09H
    INT 21H
    JMP MENU
SHOW_MESSAGE ENDP

CREATE_TASK PROC
    MOV AL, TASK_COUNT
    CMP AL, MAX_TASKS
    JE FULL
    
    LEA DX, INPUT_TASK
    MOV AH, 09H
    INT 21H
    
    XOR AX, AX
    MOV AL, TASK_COUNT
    MOV BX, TASK_SIZE
    MUL BX
    LEA DI, TASKS
    ADD DI, AX
    
    CALL GET_STRING
    
    MOV AL, '0'
    MOV [DI + 50], AL
    MOV AL, '$'
    MOV [DI + 51], AL
    
    INC TASK_COUNT
    JMP SUCCESS

FULL:
    LEA DX, FULL_MSG
    JMP SHORT SHOW_AND_RETURN

SUCCESS:
    LEA DX, SUCCESS_MSG

SHOW_AND_RETURN:
    CALL SHOW_MESSAGE
CREATE_TASK ENDP

; Modified VIEW_TASKS procedure - Status display removed
VIEW_TASKS PROC
    CMP TASK_COUNT, 0
    JE EMPTY
    
    CALL PRINT_NEWLINE
    
    XOR CX, CX
    MOV CL, TASK_COUNT
    LEA SI, TASKS
    
NEXT_TASK:
    PUSH CX
    
    ; Display task number
    MOV DL, '['
    MOV AH, 02H
    INT 21H
    
    MOV DL, TASK_COUNT
    SUB DL, CL
    ADD DL, '1'
    INT 21H
    
    MOV DL, ']'
    INT 21H
    MOV DL, ' '
    INT 21H
    
    ; Display task text
    MOV DX, SI
    MOV AH, 09H
    INT 21H
    
    ; Display status
    MOV DL, ' '
    MOV AH, 02H
    INT 21H
    MOV DL, '['
    INT 21H
    
    ; Check status and display 'D' if done
    CMP BYTE PTR [SI + 50], '1'
    JNE NOT_DONE
    MOV DL, 'D'
    JMP SHOW_STATUS
NOT_DONE:
    MOV DL, ' '
SHOW_STATUS:
    INT 21H
    
    MOV DL, ']'
    INT 21H
    
    CALL PRINT_NEWLINE
    
    ADD SI, TASK_SIZE  ; Move to next task
    POP CX
    LOOP NEXT_TASK
    JMP MENU

EMPTY:
    LEA DX, EMPTY_MSG
    CALL SHOW_MESSAGE
VIEW_TASKS ENDP

EXIT_PROG PROC
    MOV AH, 4CH
    INT 21H
EXIT_PROG ENDP

MAIN ENDP
END MAIN