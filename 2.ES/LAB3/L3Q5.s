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
		LDR R0, =0x010203 ;unpacked
		LDR R1, =0x000007 ;max
		LDR R5,=DST
		MOV R4, #4
UP 		AND R2, R0, R1
		LSL R1, #4
		LSR R0, #4
		ORR R3, R2
		SUBS R4, #1
		BNE UP
		STR R3,[R5]
STOP
		B STOP
		AREA MYDATA, DATA, READWRITE
DST DCD 0
		END