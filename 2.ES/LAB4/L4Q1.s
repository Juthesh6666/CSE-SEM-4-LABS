		AREA RESET, DATA, READONLY
		EXPORT __Vectors
__Vectors
		DCD 0x40001000
		DCD Reset_Handler
		ALIGN
		AREA mycode, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
		LDR R0, PACKED
		LDR R1, =DST
		MOV R2, #10
		MOV R3, #1
		MOV R5, #0
LOOP 
		AND R4, R0, #0X0000000F
		MLA R5, R4, R3, R5
		MUL R3, R3, R2
		LSR R0, #4
		CMP R0, #0
		BNE LOOP
		
		STR R5, [R1]
HERE
		B HERE
PACKED DCD 0X999	

		AREA mydata, DATA, READWRITE
DST 	DCD 0
		END