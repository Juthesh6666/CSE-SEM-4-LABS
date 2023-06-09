	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,HEX
	LDR R5,=DST
	ADD R5,#3
	LDR R6,=2
	LDR R4,=0
LOOP
	CMP R0,#10
	BCC DIGIT
	SUB R0,#10
	ADD R4,#1
	B LOOP
DIGIT
	SUBS R6,#1
	LSLEQ R0,#4
	ORREQ R0,R7
	STRBEQ R0,[R5],#-1
	LDREQ R6,=2
	MOVNE R7,R0
	MOV R0,R4
	LDR R4,=0
	CMP R0,#0
	BNE LOOP
	CMP R6,#0
	STRBNE R7,[R5],#-1
HERE 
	B HERE
HEX DCD 0xFF
	AREA mydata,DATA,READWRITE
DST DCD 0
	END