		AREA RESET,DATA,READONLY
		EXPORT __Vectors
__Vectors
		DCD 0x40001000
		DCD Reset_Handler
		ALIGN
		AREA mycode,CODE,READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
		LDR R0, =V1
		LDR R1, =V2
		LDR R6, =DST
		MOV R2, #4
		LDR R3, [R0], #4
		LDR R4, [R1], #4
L1		SUBS R5, R3, R4
		STR R5, [R6], #4
		LDR R3, [R0], #4
		LDR R4, [R1], #4
		SBC R3, R3, #0
		SUB R2, R2, #1
		CMP R2, #0
		BNE L1
STOP 
		B STOP
V1 DCD 8,9,6,7
V2 DCD 7,4,9,5
		AREA MYDATA, DATA, READWRITE
DST DCD 0
			END			
			