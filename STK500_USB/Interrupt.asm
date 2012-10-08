

;___________ Внешнее прерывание 0 ______________________________________________________

INterrupt0:	IN	R15,SREG
	PUSH	R29
	PUSH	R28
Int_USB_0:	INC	R28
	SBIS	PIND,3		;Вход -Data
	BRNE	Int_USB_0
Int_USB_1:	SBIS	PIND,3		;Вход -Data
	RJMP	Int_USB_2
	SBIS	PIND,3		;Вход -Data
	RJMP	Int_USB_2
	SBIS	PIND,3		;Вход -Data
	RJMP	Int_USB_2
	SBIS	PIND,3		;Вход -Data
	RJMP	Int_USB_2
	SBIS	PIND,3
	RJMP	Int_USB_2
	RJMP	Int_USB_30
Int_USB_2:	LDS	R28,Buffer_2F0	;Счётчик принятых байт
	CLR	R29
	SUBI	R28,$09
	SBCI	R29,$FD		;R29-R28 = ($02F7 + Buffer2F0)
	SBIC	PIND,3		;Вход -Data
	RJMP	Int_USB_1
Int_USB_3:	SBIW	R29:R28,0
	PUSH	R18
	PUSH	R16
	PUSH	R17
	IN	R16,PIND
	SER	R18
	BST	R16,3
	BLD	R18,0
	PUSH	R20
	PUSH	R19
	IN	R17,PIND
	SER	R20
	EOR	R16,R17
	BST	R16,3
	BLD	R18,1
	LDI	R19,$0B
	RJMP	Int_USB_13
Int_USB_4:	ANDI	R20,$FE
	MOV	R16,R17
	IN	R17,PIND
	ORI	R18,$01
	RJMP	Int_USB_12
Int_USB_5:	MOV	R17,R16
	ANDI	R20,$FD
	ORI	R18,$02
	NOP
	IN	R16,PIND
	RJMP	Int_USB_14
Int_USB_6:	ANDI	R20,$FB
	ORI	R18,$04
	MOV	R16,R17
	NOP
	IN	R17,PIND
	RJMP	Int_USB_15
Int_USB_7:	IN	R17,PIND
	ANDI	R20,$F7
	ORI	R18,$08
	RJMP	Int_USB_16
Int_USB_8:	ANDI	R20,$EF
	IN	R16,PIND
	ORI	R18,$10
	RJMP	Int_USB_17
Int_USB_9:	ANDI	R20,$DF
	IN	R17,PIND
	ORI	R18,$20
	RJMP	Int_USB_19
Int_USB_10:	ANDI	R20,$BF
	IN	R16,PIND
	ORI	R18,$40
	RJMP	Int_USB_21
Int_USB_11:	EOR	R20,R18
	IN	R16,PIND
	ST	Y+,R20
	SER	R20
	NOP
	EOR	R17,R16
	BST	R17,3
	BLD	R18,0
	IN	R17,PIND
	ANDI	R17,$0C
	BREQ	Int_USB_26
	ANDI	R18,$F9
Int_USB_12:	BREQ	Int_USB_4
	EOR	R16,R17
	BST	R16,3
	BLD	R18,1
Int_USB_13:	IN	R16,PIND
	ANDI	R18,$F3
	BREQ	Int_USB_5
Int_USB_14:	SUBI	R19,1
	BRCS	Int_USB_25
	EOR	R17,R16
	BST	R17,3
	BLD	R18,2
	IN	R17,PIND
	ANDI	R18,$E7
	BREQ	Int_USB_6
Int_USB_15:	EOR	R16,R17
	BST	R16,3
	BLD	R18,3
Int_USB_16:	ANDI	R18,$CF
	BREQ	Int_USB_7
	IN	R16,PIND
	EOR	R17,R16
	BST	R17,3
	BLD	R18,4
Int_USB_17:	ANDI	R18,$9F
	BREQ	Int_USB_8
	RJMP	Int_USB_18
Int_USB_18:	IN	R17,PIND
	EOR	R16,R17
	BST	R16,3
	BLD	R18,5
Int_USB_19:	ANDI	R18,$3F
	BREQ	Int_USB_9
	RJMP	Int_USB_20
Int_USB_20:	IN	R16,PIND
	EOR	R17,R16
	BST	R17,3
	BLD	R18,6
Int_USB_21:	CPI	R18,$02
	BRCS	Int_USB_10
	RJMP	Int_USB_22
Int_USB_22:	IN	R17,PIND
	EOR	R16,R17
	BST	R16,3
	BLD	R18,7
Int_USB_23:	CPI	R18,$04
	BRCC	Int_USB_11
	ANDI	R20,$7F
	ORI	R18,$80
	IN	R17,PIND
	NOP
	RJMP	Int_USB_23
Int_USB_25:	CLR	R16
	RJMP	Int_USB_28
Int_USB_26:	SUBI	R19,$0B
	NEG	R19
	SUB	R28,R19
	SBCI	R29,$00
	LD	R16,Y
	CPI	R16,$C3
	BREQ	Int_USB_31		;Пакет Data0 ?
	CPI	R16,$4B
	BREQ	Int_USB_31		;Пакет Data1 ?
	LDS	R18,Buffer_2EE	;Собственный адрес на шине USB
	LDD	R17,Y+1
	LSL	R17
	CPSE	R17,R18
	RJMP	Int_USB_25
	LDD	R20,Y+2
	ROL	R20
	CPI	R16,$69
	BREQ	Int_USB_32		;Принят токен Input ?
	CPI	R16,$2D
	BREQ	Int_USB_27		;Принят пакет Setup ?
	CPI	R16,$E1
	BRNE	Int_USB_25		;Принят токен Output ?
Int_USB_27:	ANDI	R20,$0F
	BREQ	Int_USB_28
	MOV	R16,R20
Int_USB_28:	STS	Buffer_2F5,R16	;$00, $E1 - токен Output или $2D - пакет Setup
Int_USB_29:	POP	R19
	POP	R20
	POP	R17
	POP	R16
	POP	R18
Int_USB_30:	POP	R28
	POP	R29
	OUT	SREG,R15
	RETI

Int_USB_31:	LDS	R18,Buffer_2F5	;$00, $E1 - токен Output или $2D - пакет Setup
	TST	R18
	BREQ	Int_USB_29
	LDS	R17,Buffer_2F3	;Счётчик принятых байт 2 ???
	TST	R17
	BRNE	Int_USB_36
	CPI	R19,$04
	BRMI	Int_USB_37
	STS	Buffer_2F3,R19	;Счётчик принятых байт 2 ???
	STS	Buffer_2EF,R18	;Идентификатор принятого пакета PID ($00, $E1 или $2D)
	LDS	R17,Buffer_2F0	;Счётчик принятых байт
	LDI	R19,$0B
	SUB	R19,R17
	STS	Buffer_2F0,R19	;Счётчик принятых байт
	RJMP	Int_USB_37
Int_USB_32:	LDS	R16,Buffer_2F3	;Счётчик принятых байт 2 ???
	CPI	R16,$01
	BRGE	Int_USB_36		;Переход если R16 больше $00 но меньше $80
	LDI	R16,$5A		;NAK = $5A
	ANDI	R20,$0F
	BRNE	Int_USB_33
	LDS	R19,Buffer_060	;ACK = $D2 или NAK = $5A
	SBRC	R19,4
	RJMP	Int_USB_38
	STS	Buffer_060,R16	;ACK = $D2 или NAK = $5A
	LDI	R28,LOW(Buffer_2D7)
	LDI	R29,HIGH(Buffer_2D7)	;Адрес - Data0 = $C3 или Data1 = $4B
	RJMP	Int_USB_40
Int_USB_33:	CPI	R20,$03
	BREQ	Int_USB_34
	LDS	R19,Buffer_2E2	;NAK = $5A или количество передаваемых байт до $0C
	SBRC	R19,4
	RJMP	Int_USB_38
	STS	Buffer_2E2,R16	;NAK = $5A или количество передаваемых байт до $0C
	LDI	R28,LOW(Buffer_2E3)
	LDI	R29,HIGH(Buffer_2E3)	;Адрес - Data0 = $C3 или Data1 = $4B
	RJMP	Int_USB_40
Int_USB_34:	LDS	R19,Buffer_30D	;ACK = $D2 или NAK = $5A
	SBRC	R19,4
	RJMP	Int_USB_38
	STS	Buffer_30D,R16	;ACK = $D2 или NAK = $5A
	LDI	R28,LOW(Buffer_30E)
	LDI	R29,HIGH(Buffer_30E)	;Адрес - $030E
	RJMP	Int_USB_40
Int_USB_35:	ROR	R18
	BRCC	Int_USB_41
	SUBI	R21,1
	BRNE	Int_USB_42
	LSL	R18
	NOP
	RJMP	Int_USB_35
Int_USB_36:	LDI	R20,$5A		;Ответ NAK
	RJMP	Int_USB_39
Int_USB_37:	LDI	R20,$D2		;Ответ ACK
	RJMP	Int_USB_39
Int_USB_38:	MOV	R20,R19
Int_USB_39:	LDI	R28,$14
	LDI	R29,$00
	LDI	R19,$02
Int_USB_40:	IN	R17,DDRD
	ORI	R17,$0C
	SBI	PORTD,3
	OUT	DDRD,R17
	IN	R16,PORTD
	LDI	R18,$40
	LDI	R17,$0C
	PUSH	R21
Int_USB_41:	EOR	R16,R17
	LDI	R21,$06
Int_USB_42:	OUT	PORTD,R16
	ROR	R18
	BRCC	Int_USB_43
	SUBI	R21,1
	BRNE	Int_USB_44
	LSL	R18
	RJMP	Int_USB_42
Int_USB_43:	EOR	R16,R17
	LDI	R21,$06
Int_USB_44:	NOP
	SUBI	R19,$AB
	OUT	PORTD,R16
	BRCS	Int_USB_35
Int_USB_45:	ROR	R18
	BRCC	Int_USB_46
	SUBI	R21,1
	BRNE	Int_USB_47
	LSL	R18
	NOP
	RJMP	Int_USB_45
Int_USB_46:	EOR	R16,R17
	LDI	R21,$06
Int_USB_47:	ROR	R18
	OUT	PORTD,R16
	BRCC	Int_USB_48
	SUBI	R21,1
	BRNE	Int_USB_49
	LSL	R18
	RJMP	Int_USB_47
Int_USB_48:	EOR	R16,R17
	LDI	R21,$06
Int_USB_49:	LD	R18,Y+
	TST	R19
	OUT	PORTD,R16
	BRNE	Int_USB_35
	ANDI	R16,$F3
	LDS	R17,Buffer_2F4	;Собственный адрес на шине USB
	LSL	R17
	SUBI	R28,$16
	SBCI	R29,$00
	OUT	PORTD,R16
	BREQ	Int_USB_50
	STS	Buffer_2EE,R17	;Собственный адрес на шине USB
Int_USB_50:	IN	R17,DDRD
	ANDI	R17,$F3
	OUT	DDRD,R17
	POP	R21
	RJMP	Int_USB_29

;___________ Совпадение таймера/счётчика Т0 ____________________________________________

MatchT0:	SEI			;Разрешить глобальное прерывание
	IN	R14,SREG
	TST	R13		;Счётчик таймера Т0 - 1 мс
	BREQ	MatchT0_1
	DEC	R13		;Счётчик таймера Т0 - 1 мс
MatchT0_1:	TST	R12		;Счётчик таймера Т0 - 63 мс
	BRNE	MatchT0_2
	TST	R11		;Счётчик таймера Т0 - 63 мс * R11
	BREQ	MatchT0_3
	CLR	R12
	COM	R12
	LSR	R12
	LSR	R12
MatchT0_2:	DEC	R12		;Счётчик таймера Т0 - 63 мс
MatchT0_3:	OUT	SREG,R14
	RETI

;___________ Пауза длительностью 1 мс * R24 ____________________________________________

Delay:	MOV	R13,R24
Delay_1:	MOV	R24,R13		;Счётчик таймера Т0 - 1 мс * R13
	TST	R24
	BRNE	Delay_1
	RET

;___________ Пауза 1 мкс * R1 __________________________________________________________

Latency:	LPM	R0,Z
	LPM	R0,Z
	LPM	R0,Z
	DEC	R1
	BRNE	Latency
	RET

;___________ Чтение из ОЗУ N байт в R2-Rn ______________________________________________

Read_N_byt:	LDI	R26,$02
	LDI	R27,$00
Copy_N:	LDI	R30,LOW(Spool_Inp)
	LDI	R31,HIGH(Spool_Inp)	;Первый байт данных от ПК
Read_N:	LD	R24,Z+		;Чтение из ОЗУ байта в R24
	ST	X+,R24
	DEC	R19
	BRNE	Read_N
	RET

;___________ Инкрементирование текущего адреса FLASH или Eeprom памяти _________________

Addr_Inc:	LDS	R24,Cur_addr0	;Текущий адрес Flash или Eeprom памяти мл. байт
	OUT	PORTB,R24
Addr_Inc1:	LDS	R16,Cur_addr0	;Текущий адрес Flash или Eeprom памяти мл. байт
	LDS	R17,Cur_addr1	;Текущий адрес Flash или Eeprom памяти ст. байт
	LDS	R18,Cur_addr2	;Текущий адрес Flash или Eeprom памяти доп. байт
	SUBI	R16,$FF
	SBCI	R17,$FF
	SBCI	R18,$FF		;R18-R16 + 1
	STS	Cur_addr0,R16	;Текущий адрес Flash или Eeprom памяти мл. байт
	STS	Cur_addr1,R17	;Текущий адрес Flash или Eeprom памяти ст. байт
	STS	Cur_addr2,R18	;Текущий адрес Flash или Eeprom памяти доп. байт
	RET
;_______________________________________________________________________________________

.INCLUDE "LVSP-spi.asm"
