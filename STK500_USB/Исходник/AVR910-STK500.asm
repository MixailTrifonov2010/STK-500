

.DEVICE ATmega8		;С кварцем на 12 Мгц

.equ 	 SREG	 = $3F		; Регистр состояния
.equ 	 SPH	 = $3E		; Старший байт регистра указателя стека
.equ 	 SPL	 = $3D		; Младший байт регистра указателя стека
.equ 	 GICR 	 = $3B		; Общий регистр управления прерываниями
.equ 	 GIFR	 = $3A		; Общий регистр флагов прерывания
.equ 	 TIMSK	 = $39		; Регистр маски прерывания таймеров / счётчиков
.equ 	 TIFR 	 = $38		; Регистр флагов прерывания таймеров / счётчиков
.equ 	 SPMCR	 = $37		; Регистр управления самопрограммированием
.equ 	 TWCR	 = $36		; TWI Регистр Контроля(управления)
.equ 	 MCUCR	 = $35		; Регистр управления и состаяния микроконтроллера
.equ 	 MCUCSR	 = $34		; Регистр состаяния микроконтроллера
.equ 	 TCCR0	 = $33		; Регистр управления таймера / счётчика Т0
.equ 	 TCNT0 	 = $32		; Счётный регистр таймера / счётчика Т0
.equ 	 OSCCAL	 = $31		; Регистр калибровки внутреннего генератора
.equ 	 SFIOR	 = $30		; Регистр специальных функций I/O 
.equ 	 TCCR1A	 = $2F		; Регистр управления A таймера / счётчика Т1
.equ 	 TCCR1B	 = $2E		; Регистр управления B таймера / счётчика Т1
.equ 	 TCNT1H	 = $2D		; Регистр данных таймера / счётчика Т1 ст. байт
.equ 	 TCNT1L	 = $2C		; Регистр данных таймера / счётчика Т1 мл. байт
.equ 	 OCR1AH	 = $2B		; Регистр сравнения А таймера / счётчика Т1 ст. байт
.equ 	 OCR1AL	 = $2A		; Регистр сравнения А таймера / счётчика Т1 мл. байт
.equ 	 OCR1BH	 = $29		; Регистр сравнения В таймера / счётчика Т1 ст. байт
.equ 	 OCR1BL	 = $28		; Регистр сравнения В таймера / счётчика Т1 мл. байт
.equ 	 ICR1H 	 = $27		; Регистр захвата таймера / счётчика Т1 ст. байт
.equ 	 ICR1L 	 = $26		; Регистр захвата таймера / счётчика Т1 мл. байт
.equ 	 TCCR2	 = $25		; Регистр управления таймера / счётчика Т2
.equ 	 TCNT2	 = $24		; Счётный регистр таймера / счётчика Т2
.equ 	 OCR2 	 = $23		; Регистра сравнения таймера / счётчика Т2
.equ 	 ASSR 	 = $22		; Регистр асинхронного режима
.equ 	 WDTCR 	 = $21		; Регистр сторожевого таймера
.equ 	 UBRRH	 = $20		; USART ст. байт регистра скорости в бодах ?
.equ 	 UCSRC 	 = $20		; USART Контроль(управление) и C Регистра Состояния
.equ 	 EEARH	 = $1F		; Регистр адреса EEPROM ст. байт
.equ 	 EEARL	 = $1E		; Регистр адреса EEPROM мл. байт
.equ 	 EEDR 	 = $1D		; Регистр данных EEPROM
.equ 	 EECR 	 = $1C		; Регистр управления EEPROM
.equ 	 PORTB	 = $18		; Регистр данных порт B (выход)
.equ 	 DDRB 	 = $17		; Регистр направления порт B
.equ 	 PINB 	 = $16		; Выводы порт B (вход)
.equ 	 PORTC	 = $15		; Регистр данных порт C (выход)
.equ 	 DDRC 	 = $14		; Регистр направления порт C
.equ 	 PINC 	 = $13		; Выводы порт C (вход)
.equ 	 PORTD	 = $12		; Регистр данных порт D (выход)
.equ 	 DDRD 	 = $11		; Регистр направления порт D
.equ 	 PIND 	 = $10		; Выводы порт D (вход)
.equ 	 SPDR 	 = $0F		; SPI Регистр Данных
.equ 	 SPSR	 = $0E		; SPI Регистр состояния
.equ 	 SPCR 	 = $0D		; SPI Регистр управления
.equ 	 UDR 	 = $0C		; USART Регистр Данных Ввода - вывода
.equ 	 UCSRA 	 = $0B		; USART Регистр состояния и управления A
.equ 	 UCSRB	 = $0A		; USART Регистр состояния и управления B
.equ 	 UBRRL	 = $09		; USART мл. байт регистра скорости в бодах
.equ 	 ACSR 	 = $08		; Регистр управления и состояния аналоговым компаратором
.equ 	 ADMUX	 = $07		; Регистр управления мультиплексором АЦП
.equ 	 ADCSRA	 = $06		; Регистр управления и состояния АЦП 
.equ 	 ADCH 	 = $05		; Ст. байт регистра данных АЦП
.equ 	 ADCL 	 = $04		; Мл. байт регистра данных АЦП
.equ 	 TWDR 	 = $03		; TWI регистр данных
.equ 	 TWAR 	 = $02		; TWI (Подчиненный) регистр адреса
.equ 	 TWSR 	 = $01		; TWI регистр состояния
.equ 	 TWBR 	 = $00		; TWI регистр скорости передачи в битах
.equ 	 RAMEND	 = $045F

.CSEG
.ORG $000	

Reset:	RJMP	Start	;Обработка сброса
	RJMP	INterrupt0	;Внешнее прерывание 0
	RJMP	SPM_RDY	;Внешнее прерывание 1
	RJMP	SPM_RDY	;Совпадение таймера/счётчика Т2
	RJMP	SPM_RDY	;Переполнение таймера/счётчика Т2
	RJMP	SPM_RDY	;Захват таймера/счётчика Т1
	RJMP	SPM_RDY	;Совпадение А таймера/счётчика Т1
	RJMP	SPM_RDY	;Совпадение В таймера/счётчика Т1
	RJMP	SPM_RDY	;Переполнение таймера/счётчика Т1
	RJMP	TIMER0_OVF	;Переполнение таймера/счётчика Т0
	RJMP	SPM_RDY	;Передача по SPI завершена
	RJMP	SPM_RDY	;USART,приём завершен
	RJMP	SPM_RDY	;Регистр данных USART пуст
	RJMP	SPM_RDY	;USART,передача завершена
	RJMP	SPM_RDY	;Преобразование АЦП завершено
	RJMP	SPM_RDY	;EEPROM готово
	RJMP	SPM_RDY	;Аналоговый компаратор
	RJMP	SPM_RDY	;Прерывание от модуля TWI
	RJMP	SPM_RDY	;Готовность SPM
;_______________________________________________________________________________________

loc_13:	RJMP	loc_6DB
	RJMP	loc_6E2
	RJMP	loc_6F9
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_70E
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_71F
	RJMP	loc_723
	RJMP	loc_727
	RJMP	loc_72B
	RJMP	loc_72F
	RJMP	loc_735
	RJMP	loc_73A
	RJMP	loc_74A
	RJMP	loc_741
	RJMP	loc_74A
	RJMP	loc_741
	RJMP	loc_741
	RJMP	loc_741
	RJMP	loc_74E
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_756
	RJMP	loc_759
;_______________________________________________________________________________________


Data_0:	.DB $04,$03,$09,$04
Data_1:	.DB $12,$03,'o',$00,'b',$00,'d',$00,'e',$00,'v',$00,'.',$00,'a',$00,'t',$00
Data_2:	.DB $14,$03,'A',$00,'V',$00,'R',$00,'-',$00,'D',$00,'o',$00,'p',$00,'e',$00,'r',$00
Data_3:	.DB $12,$03,'a',$00,'v',$00,'r',$00,'d',$00,'o',$00,'p',$00,'e',$00,'r',$00
Data_4:	.DB $08,'S','T','K','5','0','0','_','2',$00
Data_5:	.DB $12,$01,$10,$01,$02,$00,$00,$08,$C0,$16,$E1,$05,$00,$01,$01,$02,$03,$01
Data_6:	.DB $09,$02,$43,$00,$02,$01,$00,$80,$64,	/*Configuration*/\
	    $09,$04,$00,$00,$01,$02,$02,$01,$00,	/*Configuration*/\
	    $05,$24,$00,$10,$01,		/*CDC Header Functional*/\
	    $04,$24,$02,$02,			/*CDC Abstract Control Management Functional*/\
	    $05,$24,$06,$00,$01,		/*CDC Union Functional*/\
	    $05,$24,$01,$03,$01,		/*Interface*/\
	    $07,$05,$83,$03,$08,$00,$64,		/*In-Endpoint*/\
	    $09,$04,$01,$00,$02,$0A,$00,$00,$00,	/*Configuration*/\
	    $07,$05,$01,$02,$08,$00,$00,		/*Endpoint-Out*/\
	    $07,$05,$81,$02,$08,$00,$00,$00		/*Endpoint-In*/\

;_______________________________________________________________________________________

Start:	CLR	R1
	OUT	SREG,R1
	LDI	R28,LOW(RAMEND)
	LDI	R29,HIGH(RAMEND)
	OUT	SPH,R29
	OUT	SPL,R28
	LDI	R17,$00
	LDI	R26,LOW(Buffer_060)
	LDI	R27,HIGH(Buffer_060)
	LDI	R30,LOW(Data_c*2)
	LDI	R31,HIGH(Data_c*2)
	RJMP	loc_9C

loc_9A:	LPM	R0,Z+
	ST	X+,R0
loc_9C:	CPI	R26,$8C
	CPC	R27,R17
	BRNE	loc_9A
	LDI	R17,$03
	LDI	R26,LOW(Buffer_08C)
	LDI	R27,HIGH(Buffer_08C)
	RJMP	loc_A4

loc_A3:	ST	X+,R1
loc_A4:	CPI	R26,$1F
	CPC	R27,R17
	BRNE	loc_A3
	RCALL	SUB_7E1
	RJMP	loc_86F
SPM_RDY:	RJMP	Reset

; =============== S U B	R O U T	I N E =======================================

SUB_AA:	IN	R24,MCUCR
	ORI	R24,3
	OUT	MCUCR,R24
	IN	R24,GICR
	ORI	R24,$40
	OUT	GICR,R24
	LDI	R24,$4B
	STS	$2E3,R24
	STS	$30E,R24
	LDI	R24,$5A
	STS	$2E2,R24
	STS	$30D,R24
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_BB:	PUSH	R17
	PUSH	R28
	PUSH	R29
	MOVW	R27:R26,R25:R24
	MOV	R17,R22
	MOVW	R29:R28,R21:R20
	LD	R24,Y
	SBRS	R24,4
	RJMP	loc_C9
	LDD	R24,Y+1
	LDI	R25,$88
	EOR	R24,R25
	STd	Y+1,R24
	RJMP	loc_CB

loc_C9:	LDI	R24,$5A
	ST	Y,R24
loc_CB:	MOVW	R21:R20,R29:R28
	SUBI	R20,$FE
	SBCI	R21,$FF
	MOV	R18,R17
	MOVW	R31:R30,R21:R20
loc_D0:	LD	R24,X+
	ST	Z+,R24
	SUBI	R18,1
	CP	R1,R18
	BRLT	loc_D0
	MOVW	R25:R24,R21:R20
	MOV	R22,R17
	RCALL	SUB_219
	SUBI	R17,$FC
	ST	Y,R17
	POP	R29
	POP	R28
	POP	R17
	RET

;_______________________________________________________________________________________

SUB_DE:	LDI	R20,$0D
	LDI	R21,3
	RCALL	SUB_BB
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_E2:	LDI	R20,$E2
	LDI	R21,$02
	RCALL	SUB_BB
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_E6:	PUSH	R17
	PUSH	R28
	PUSH	R29
	LDS	R22,$2F3
	SUBI	R22,3
	SBRC	R22,7
	RJMP	loc_19A
	LDS	R24,$2F0
	LDI	R28,$C
	LDI	R29,0
	SUB	R28,R24
	SBC	R29,R1
	SUBI	R28,9
	SBCI	R29,$FD
	LDS	R24,$2EF
	CPI	R24,$10
	BRCC	loc_FD
	MOVW	R25:R24,R29:R28
	RCALL	SUB_83B
	RJMP	loc_198

loc_FD:	CPI	R24,$2D
	BREQ	loc_100
	RJMP	loc_188

loc_100:	CPI	R22,8
	BREQ	loc_103
	RJMP	loc_198

loc_103:	LDI	R24,$C3
	STS	$2D7,R24
	LDI	R24,$5A
	STS	Buffer_060,R24
	STS	Buffer_08C,R1
	LD	R24,Y
	ANDI	R24,$60
	BREQ	loc_112
	MOVW	R25:R24,R29:R28
	RCALL	SUB_7CE
	MOV	R18,R24
	RJMP	loc_175

loc_112:	LDD	R25,Y+2
	STS	$2E0,R1
	LDD	R24,Y+1
	TST	R24
	BRNE	loc_11C
	STS	$2E1,R1
	LDI	R18,2
	RJMP	loc_16E

loc_11C:	CPI	R24,5
	BRNE	loc_121
	STS	$2F4,R25
	RJMP	loc_16D

loc_121:	CPI	R24,6
	BRNE	loc_157
	LDD	R24,Y+3
	CPI	R24,1
	BREQ	loc_128
	CPI	R24,2
	BRNE	loc_12C

loc_128:	MOVW	R25:R24,R29:R28
	RCALL	SUB_7B6
	MOV	R18,R24
	RJMP	loc_153

loc_12C:	CPI	R24,3
	BRNE	loc_152
	LDD	R24,Y+2
	TST	R24
	BRNE	loc_139
	LDI	R24,LOW(Data_0*2)
	LDI	R25,HIGH(Data_0*2)	;Get Descriptor(String)
	STS	$2F2,R25
	STS	$2F1,R24
	LDI	R18,$04
	RJMP	loc_153

loc_139:	CPI	R24,1
	BRNE	loc_13E
	LDI	R24,LOW(Data_1*2)
	LDI	R25,HIGH(Data_1*2)	;obdev.at
	RJMP	loc_14C

loc_13E:	CPI	R24,2
	BRNE	loc_148
	LDI	R24,LOW(Data_2*2)
	LDI	R25,HIGH(Data_2*2)	;AVR-Doper
	STS	$2F2,R25
	STS	$2F1,R24
	LDI	R18,$14
	RJMP	loc_153

loc_148:	CPI	R24,3
	BRNE	loc_152
	LDI	R24,LOW(Data_3*2)
	LDI	R25,HIGH(Data_3*2)	;avrdoper
loc_14C:	STS	$2F2,R25
	STS	$2F1,R24
	LDI	R18,$12
	RJMP	loc_153

loc_152:	LDI	R18,$00
loc_153:	LDI	R24,$40
	STS	Buffer_08C,R24
	RJMP	loc_175

loc_157:	CPI	R24,8
	BRNE	loc_15D
	LDI	R18,$01
	LDI	R24,$F6
	LDI	R25,$02
	RJMP	loc_170

loc_15D:	CPI	R24,9
	BRNE	loc_162
	STS	$2F6,R25
	RJMP	loc_16D

loc_162:	CPI	R24,$0A
	BRNE	loc_166
	LDI	R18,$01
	RJMP	loc_16E

loc_166:	CPI	R24,$B
	BRNE	loc_16D
	LDI	R24,$4B
	STS	$2E3,R24
	STS	$30E,R24
loc_16D:	LDI	R18,$00
loc_16E:	LDI	R24,$E0
	LDI	R25,$02
loc_170:	STS	$2F2,R25
	STS	$2F1,R24
	RJMP	loc_17E

loc_175:	CPI	R18,$FF
	BRNE	loc_17E
	LD	R24,Y
	SBRC	R24,7
	LDD	R18,Y+6
	LDI	R24,$80
	STS	Buffer_08C,R24
	RJMP	loc_184

loc_17E:	LDD	R24,Y+7
	TST	R24
	BRNE	loc_184
	LDD	R24,Y+6
	CP	R24,R18
	BRCS	loc_185
loc_184:	MOV	R24,R18
loc_185:	STS	Buffer_061,R24
	RJMP	loc_198

loc_188:	LDS	R24,Buffer_08C
	SBRS	R24,7
	RJMP	loc_198
	MOVW	R25:R24,R29:R28
	RCALL	SUB_848
	CPI	R24,$FF
	BRNE	loc_194
	LDI	R24,$1E
	STS	Buffer_060,R24
	RJMP	loc_198

loc_194:	TST	R24
	BREQ	loc_198
	STS	Buffer_061,R1
loc_198:	STS	$2F3,R1
loc_19A:	LDS	R24,Buffer_060
	SBRS	R24,4
	RJMP	loc_1F6
	LDS	R24,Buffer_061
	CPI	R24,$FF
	BRNE	loc_1A3
	RJMP	loc_1F6

loc_1A3:	MOV	R17,R24
	CPI	R24,9
	BRCS	loc_1A7
	LDI	R17,8
loc_1A7:	SUB	R24,R17
	STS	Buffer_061,R24
	LDS	R24,$2D7
	LDI	R25,$88
	EOR	R24,R25
	STS	$2D7,R24
	TST	R17
	BREQ	loc_1E4
	LDS	R24,Buffer_08C
	SBRS	R24,7
	RJMP	loc_1BE
	LDI	R24,$D8
	LDI	R25,$02
	MOV	R22,R17
	RCALL	SUB_857
	MOV	R17,R24
	CPI	R24,9
	BRCC	loc_1F0
	RJMP	loc_1E4

loc_1BE:	LDS	R18,$2F1
	LDS	R19,$2F2
	SBRS	R24,6
	RJMP	loc_1D1
	LDI	R26,$D8
	LDI	R27,$02
	LDI	R24,0
	LDI	R25,0
loc_1C8:	MOVW	R31:R30,R19:R18
	ADD	R30,R24
	ADC	R31,R25
	LPM	R30,Z
	ST	X+,R30
	ADIW	R25:R24,1
	CP	R17,R24
	BRNE	loc_1C8
	RJMP	loc_1D9

loc_1D1:	MOV	R25,R17
	MOVW	R27:R26,R19:R18
	LDI	R30,$D8
	LDI	R31,2
loc_1D5:	LD	R24,X+
	ST	Z+,R24
	SUBI	R25,1
	BRNE	loc_1D5
loc_1D9:	SUBI	R17,1
	MOV	R24,R17
	LDI	R25,0
	SUBI	R17,$FF
	ADIW	R25:R24,1
	ADD	R24,R18
	ADC	R25,R19
	STS	$2F2,R25
	STS	$2F1,R24
loc_1E4:	LDI	R24,$D8
	LDI	R25,2
	MOV	R22,R17
	RCALL	SUB_219
	MOV	R22,R17
	SUBI	R22,$FC
	CPI	R22,$0C
	BREQ	loc_1F4
	SER	R24
	STS	Buffer_061,R24
	RJMP	loc_1F4

loc_1F0:	SER	R24
	STS	Buffer_061,R24
	LDI	R22,$1E
loc_1F4:	STS	Buffer_060,R22
loc_1F6:	LDI	R25,$14
loc_1F7:	IN	R24,PIND
	ANDI	R24,$0C
	BRNE	loc_200
	SUBI	R25,1
	BRNE	loc_1F7
	STS	$2F4,R1
	STS	$2EE,R1
loc_200:	POP	R29
	POP	R28
	POP	R17
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_204:	MOV	R26,R24
	MOV	R27,R25
	LDI	R24,0
	LDI	R25,0
	LDI	R20,1
	LDI	R21,$A0
	COM	R22
loc_20B:	SUBI	R22,$FF
	BRCC	locRET_218
	LD	R18,X+
	LDI	R19,$F8
	EOR	R24,R18
loc_210:	ROR	R25
	ROR	R24
	BRCS	loc_215
	EOR	R24,R20
	EOR	R25,R21
loc_215:	SUBI	R19,$FF
	BRCS	loc_210
	RJMP	loc_20B
locRET_218:	RET

; =============== S U B	R O U T	I N E =======================================

SUB_219:	RCALL	SUB_204
	ST	X+,R24
	ST	X+,R25
	RET

; =============== S U B	R O U T	I N E =======================================

INterrupt0:	PUSH	R28
	IN	R28,SREG
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
Int_USB_2:	PUSH	R29
	LDS	R28,$2F0		;Счётчик принятых байт
	CLR	R29
	SUBI	R28,$09
	SBCI	R29,$FD		;R29-R28 = ($02F7 + Buffer2F0)
	SBIS	PIND,3		;Вход -Data
	RJMP	Int_USB_3
	POP	R29
	RJMP	Int_USB_1
Int_USB_3:	PUSH	R18
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
	LDI	R19,$B
	RJMP	Int_USB_13
Int_USB_4:	ANDI	R20,$FE
	MOV	R16,R17
	IN	R17,PIND
	ORI	R18,1
	RJMP	Int_USB_12
Int_USB_5:	MOV	R17,R16
	ANDI	R20,$FD
	ORI	R18,2
	NOP
	IN	R16,PIND
	RJMP	Int_USB_14
Int_USB_6:	ANDI	R20,$FB
	ORI	R18,4
	MOV	R16,R17
	NOP
	IN	R17,PIND
	RJMP	Int_USB_15
Int_USB_7:	IN	R17,PIND
	ANDI	R20,$F7
	ORI	R18,8
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
	ANDI	R17,$C
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
	BRCS	Int_USB_24
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
Int_USB_21:	CPI	R18,2
	BRCS	Int_USB_10
	RJMP	Int_USB_22
Int_USB_22:	IN	R17,PIND
	EOR	R16,R17
	BST	R16,3
	BLD	R18,7
Int_USB_23:	CPI	R18,4
	BRCC	Int_USB_11
	ANDI	R20,$7F
	ORI	R18,$80
	IN	R17,PIND
	NOP
	RJMP	Int_USB_23
Int_USB_24:	LDI	R17,$40
	OUT	GIFR,R17
Int_USB_25:	CLR	R16
	RJMP	Int_USB_28
Int_USB_26:	SUBI	R19,$0B
	NEG	R19
	SUB	R28,R19
	SBCI	R29,0
	LDI	R17,$40
	OUT	GIFR,R17
	LD	R16,Y
	CPI	R16,$C3
	BREQ	Int_USB_31		;Пакет Data0 ?
	CPI	R16,$4B
	BREQ	Int_USB_31		;Пакет Data1 ?
	LDS	R18,$2EE		;Собственный адрес на шине USB
	LDD	R17,Y+1
	LSL	R17
	CPSE	R17,R18
	RJMP	Int_USB_25
	LDD	R20,Y+2
	Rol	R20
	CPI	R16,$69
	BREQ	Int_USB_32		;Принят токен Input ?
	CPI	R16,$2D
	BREQ	Int_USB_27		;Принят пакет Setup ?
	CPI	R16,$E1
	BRNE	Int_USB_25		;Принят токен Output ?
Int_USB_27:	ANDI	R20,$0F
	BREQ	Int_USB_28
	MOV	R16,R20
Int_USB_28:	STS	$2F5,R16		;$00, $E1 - токен Output или $2D - пакет Setup
Int_USB_29:	POP	R19
	POP	R20
	POP	R17
	POP	R16
	POP	R18
	POP	R29
	IN	R28,GIFR
	SBRC	R28,6
	RJMP	Int_USB_0
Int_USB_30:	POP	R28
	OUT	SREG,R28
	POP	R28
	RETI
Int_USB_31:	LDS	R18,$2F5		;$00, $E1 - токен Output или $2D - пакет Setup
	TST	R18
	BREQ	Int_USB_29
	LDS	R17,$2F3		;Счётчик принятых байт 2 ???
	TST	R17
	BRNE	Int_USB_36
	CPI	R19,4
	BRMI	Int_USB_37
	STS	$2F3,R19		;Счётчик принятых байт 2 ???
	STS	$2EF,R18		;Идентификатор принятого пакета PID ($00, $E1 или $2D)
	LDS	R17,$2F0		;Счётчик принятых байт
	LDI	R19,$B
	SUB	R19,R17
	STS	$2F0,R19		;Счётчик принятых байт
	RJMP	Int_USB_37
Int_USB_32:	LDS	R16,$2F3		;Счётчик принятых байт 2 ???
	CPI	R16,1
	BRGE	Int_USB_36		;Переход если R16 больше $00 но меньше $80
	LDI	R16,$5A
	ANDI	R20,$0F
	BRNE	Int_USB_33
	LDS	R19,Buffer_060	;ACK = $D2 или NAK = $5A
	SBRC	R19,4
	RJMP	Int_USB_38
	STS	Buffer_060,R16	;ACK = $D2 или NAK = $5A
	LDI	R28,$D7
	LDI	R29,$02		;Адрес - Data0 = $C3 или Data1 = $4B
	RJMP	Int_USB_40
Int_USB_33:	CPI	R20,3
	BREQ	Int_USB_34
	LDS	R19,$2E2		;?????
	SBRC	R19,4
	RJMP	Int_USB_38
	STS	$2E2,R16
	LDI	R28,$E3
	LDI	R29,$02		;Адрес - Data0 = $C3 или Data1 = $4B
	RJMP	Int_USB_40
Int_USB_34:	LDS	R19,$30D		;?????
	SBRC	R19,4
	RJMP	Int_USB_38
	STS	$30D,R16		;?????
	LDI	R28,$0E
	LDI	R29,$03		;Адрес - 
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
	LDI	R29,0
	LDI	R19,2
Int_USB_40:	IN	R17,DDRD
	ORI	R17,$C
	SBI	PORTD,3
	OUT	DDRD,R17
	IN	R16,PORTD
	LDI	R18,$40
	LDI	R17,$C
	PUSH	R21
Int_USB_41:	EOR	R16,R17
	LDI	R21,6
Int_USB_42:	OUT	PORTD,R16
	ROR	R18
	BRCC	Int_USB_43
	SUBI	R21,1
	BRNE	Int_USB_44
	LSL	R18
	RJMP	Int_USB_42
Int_USB_43:	EOR	R16,R17
	LDI	R21,6
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
	LDI	R21,6
Int_USB_47:	ROR	R18
	OUT	PORTD,R16
	BRCC	Int_USB_48
	SUBI	R21,1
	BRNE	Int_USB_49
	LSL	R18
	RJMP	Int_USB_47
Int_USB_48:	EOR	R16,R17
	LDI	R21,6
Int_USB_49:	LD	R18,Y+
	TST	R19
	OUT	PORTD,R16
	BRNE	Int_USB_35
	ANDI	R16,$F3
	LDS	R17,$2F4		;Собственный адрес на шине USB
	LSL	R17
	SUBI	R28,$16
	SBCI	R29,0
	OUT	PORTD,R16
	BREQ	Int_USB_50
	STS	$2EE,R17		;Собственный адрес на шине USB
Int_USB_50:	LDI	R17,$40
	OUT	GIFR,R17
	ORI	R16,8
	IN	R17,DDRD
	ANDI	R17,$F3
	MOV	R20,R16
	ANDI	R20,$F3
	POP	R21
	RJMP	Int_USB_51
Int_USB_51:	RJMP	Int_USB_52
Int_USB_52:	OUT	PORTD,R16
	OUT	DDRD,R17
	OUT	PORTD,R20
	RJMP	Int_USB_29

; =============== S U B	R O U T	I N E =======================================

SUB_365:	CBI	DDRB,5		;
	CBI	DDRB,3		;
	CBI	DDRB,1		;
	CBI	DDRB,2		;
	CBI	PORTB,5		;Сигнал SCK = 0 - B7
	CBI	PORTB,3		;Сигнал MOSI = 0 - B5
	IN	R24,PORTC
	ANDI	R24,$E7
	OUT	PORTC,R24
	CBI	PORTD,6		;Выключить светодиод RD
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_370:	PUSH	R13
	PUSH	R14
	PUSH	R15
	PUSH	R16
	PUSH	R17
	PUSH	R28
	PUSH	R29
	MOVW	R29:R28,R25:R24
	MOV	R14,R22
	LDS	R13,Buffer_08D
	CLI
	IN	R16,PORTB
	ANDI	R16,$F7		;Маска на сигнал MOSI - B5
	LDI	R17,0
	RJMP	loc_398

loc_380:	LD	R17,Y
	LDI	R24,8
	MOV	R15,R24
loc_383:	SBRC	R17,7
	ORI	R16,8
	OUT	PORTB,R16		;Сигнал MOSI = 0/1 - B5
	SEI
	MOV	R24,R13
	RCALL	SUB_772
	CLI
	SBI	PORTB,5		;Сигнал SCK = 1 - B7
	LSL	R17
	ANDI	R16,$F7
	SBIC	PINB,4		;Сигнал MISO - B6
	ORI	R17,1
	SEI
	MOV	R24,R13
	RCALL	SUB_772
	CLI
	CBI	PORTB,5		;Сигнал SCK = 1 - B7
	DEC	R15
	BRNE	loc_383
	ADIW	R29:R28,1
	DEC	R14
loc_398:	TST	R14
	BRNE	loc_380
	SEI
	MOV	R24,R17
	POP	R29
	POP	R28
	POP	R17
	POP	R16
	POP	R15
	POP	R14
	POP	R13
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_3A4:	PUSH	R10
	PUSH	R11
	PUSH	R12
	PUSH	R13
	PUSH	R14
	PUSH	R15
	PUSH	R16
	PUSH	R17
	PUSH	R28
	PUSH	R29
	MOVW	R29:R28,R25:R24
	MOVW	R11:R10,R23:R22
	LD	R24,Y
	LDD	R17,Y+2
	CP	R24,R17
	BRCC	loc_3B5
	MOV	R17,R24
loc_3B5:	MOVW	R25:R24,R29:R28
	ADIW	R25:R24,3
	MOV	R22,R17
	RCALL	SUB_370
	MOVW	R15:R14,R11:R10
	SEC
	ADC	R14,R1
	ADC	R15,R1
	LDI	R16,0
	MOV	R12,R17
	CLR	R13
	RJMP	loc_3D3

loc_3C1:	ADD	R18,R12
	ADC	R19,R13
	SUBI	R18,$FD
	SBCI	R19,$FF
	MOVW	R25:R24,R29:R28
	ADD	R24,R18
	ADC	R25,R19
	LDI	R22,1
	RCALL	SUB_370
	MOV	R25,R24
	LDD	R24,Y+1
	CP	R16,R24
	BRCC	loc_3D1
	MOVW	R31:R30,R15:R14
	ST	Z+,R25
	MOVW	R15:R14,R31:R30
loc_3D1:	WDR
	SUBI	R16,$FF
loc_3D3:	MOV	R18,R16
	LDI	R19,0
	LD	R24,Y
	LDI	R25,0
	SUB	R24,R12
	SBC	R25,R13
	CP	R18,R24
	CPC	R19,R25
	BRLT	loc_3C1
	RJMP	loc_3E8

loc_3DD:	STS	Buffer_08E,R1
	LDI	R24,$8E
	LDI	R25,0
	LDI	R22,1
	RCALL	SUB_370
	MOVW	R31:R30,R15:R14
	ST	Z+,R24
	MOVW	R15:R14,R31:R30
	WDR
	SUBI	R16,$FF
loc_3E8:	LDD	R24,Y+1
	CP	R16,R24
	BRCS	loc_3DD
	MOVW	R31:R30,R11:R10
	ST	Z,R1
	MOVW	R31:R30,R15:R14
	ST	Z,R1
	LDD	R18,Y+1
	LDI	R19,0
	SUBI	R18,$FE
	SBCI	R19,$FF
	MOVW	R25:R24,R19:R18
	POP	R29
	POP	R28
	POP	R17
	POP	R16
	POP	R15
	POP	R14
	POP	R13
	POP	R12
	POP	R11
	POP	R10
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_3FF:	PUSH	R17
	PUSH	R28
	PUSH	R29
	MOVW	R29:R28,R25:R24
	ADIW	R25:R24,1
	LD	R22,Y
	RCALL	SUB_370
	MOV	R17,R24
	LD	R18,Y
	CPI	R18,4
	BRCC	loc_412
	MOV	R24,R18
	LDI	R25,0
	ADIW	R25:R24,1
	LDI	R22,4
	SUB	R22,R18
	ADD	R24,R28
	ADC	R25,R29
	RCALL	SUB_370
loc_412:	MOV	R24,R17
	POP	R29
	POP	R28
	POP	R17
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_417:	SBI	PORTD,7		;Включить светодиод WR
	LDI	R22,4
	RCALL	SUB_370
	CBI	PORTD,7		;Выключить светодиод WR
	LDI	R24,0
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_41D:	PUSH	R10
	PUSH	R11
	PUSH	R12
	PUSH	R13
	PUSH	R14
	PUSH	R15
	PUSH	R16
	PUSH	R17
	PUSH	R28
	PUSH	R29
	MOVW	R29:R28,R25:R24
	MOVW	R15:R14,R23:R22
	MOV	R12,R20
	STS	Buffer_091,R1
	TST	R20
	BRNE	loc_43F
	LDS	R24,$31C
	SBRS	R24,7
	RJMP	loc_43F
	LDI	R24,$4D
	STS	Buffer_08E,R24
	STS	Buffer_08F,R1
	LDS	R24,$31B
	STS	Buffer_090,R24
	LDI	R24,$8E
	LDI	R25,0
	LDI	R22,4
	RCALL	SUB_370
loc_43F:	LD	R25,Y
	LDD	R24,Y+1
	MOVW	R11:R10,R15:R14
	SEC
	ADC	R10,R1
	ADC	R11,R1
	MOVW	R31:R30,R15:R14
	ST	Z,R1
	LDD	R13,Y+2
	MOVW	R29:R28,R25:R24
	LDI	R16,0
	LDI	R17,0
	RJMP	loc_46B

loc_44C:	WDR
	LDS	R24,$31A
	STS	Buffer_08F,R24
	LDS	R24,$319
	STS	Buffer_090,R24
	TST	R12
	BRNE	loc_45F
	SBRS	R16,0
	RJMP	loc_45C
	LDI	R31,8
	OR	R13,R31
	RJMP	loc_45F

loc_45C:	LDI	R24,$F7
	AND	R13,R24
	RJMP	loc_460

loc_45F:	RCALL	SUB_5E5
loc_460:	STS	Buffer_08E,R13
	LDI	R24,$8E
	LDI	R25,0
	LDI	R22,4
	RCALL	SUB_370
	MOVW	R31:R30,R11:R10
	ST	Z+,R24
	MOVW	R11:R10,R31:R30
	SUBI	R16,$FF
	SBCI	R17,$FF
loc_46B:	CP	R16,R28
	CPC	R17,R29
	BRCS	loc_44C
	ADD	R14,R28
	ADC	R15,R29
	MOVW	R31:R30,R15:R14
	STd	Z+1,R1
	MOVW	R19:R18,R29:R28
	SUBI	R18,$FE
	SBCI	R19,$FF
	MOVW	R25:R24,R19:R18
	POP	R29
	POP	R28
	POP	R17
	POP	R16
	POP	R15
	POP	R14
	POP	R13
	POP	R12
	POP	R11
	POP	R10
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_481:	PUSH	R16
	PUSH	R17
	MOVW	R17:R16,R25:R24
	MOVW	R31:R30,R25:R24
	LD	R24,Z
	RCALL	SUB_365
	MOVW	R31:R30,R17:R16
	LDD	R24,Z+1
	RCALL	SUB_766
	POP	R17
	POP	R16
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_48D:	PUSH	R13
	PUSH	R14
	PUSH	R15
	PUSH	R16
	PUSH	R17
	PUSH	R28
	PUSH	R29
	MOVW	R29:R28,R25:R24
	LDS	R24,Buffer_07A
	LDD	R17,Y+1
	SBIC	PINB,0		;Джампер LOW SCK замкнут ?
	RJMP	loc_49C
	LDI	R24,$D
	RJMP	loc_4B8

loc_49C:	TST	R24
	BREQ	loc_4A0
	CPI	R24,1
	BRNE	loc_4A3
loc_4A0:	STS	Buffer_08D,R1
	RJMP	loc_4BA

loc_4A3:	CPI	R24,2
	BRNE	loc_4A7
	LDI	R24,1
	RJMP	loc_4B8

loc_4A7:	CPI	R24,3
	BRNE	loc_4AB
	LDI	R24,2
	RJMP	loc_4B8

loc_4AB:	LDI	R25,0
	ADIW	R25:R24,1
	MOVW	R19:R18,R25:R24
	ASR	R19
	ROR	R18
	ASR	R19
	ROR	R18
	LDI	R19,4
loc_4B3:	ASR	R25
	ROR	R24
	DEC	R19
	BRNE	loc_4B3
	ADD	R24,R18
loc_4B8:	STS	Buffer_08D,R24
loc_4BA:	SBI	PORTD,6		;Включить светодиод RD
	IN	R24,PORTC
	ORI	R24,$18
	OUT	PORTC,R24
	SBI	DDRB,1
	SBI	DDRB,5
	SBI	DDRB,3
	LDI	R24,$C8
	RCALL	SUB_766
	SBI	DDRB,2		;Сигнал Reset = 1
	MOV	R24,R17
	RCALL	SUB_766
	LDS	R24,Buffer_08D
	RCALL	SUB_772
	SBI	PORTB,2		;Сигнал Reset = 1 - D5
	LDS	R24,Buffer_08D
	RCALL	SUB_772
	CBI	PORTB,2		;Сигнал Reset = 0 - D5
	LDD	R24,Y+2
	RCALL	SUB_766
	LDI	R18,7
	MOV	R14,R18
	MOV	R15,R1
	ADD	R14,R28
	ADC	R15,R29
	LDI	R17,$20
	LDI	R25,4
	MOV	R13,R25
	RJMP	loc_4F6

loc_4D9:	WDR
	MOVW	R25:R24,R15:R14
	LDD	R22,Y+6
	RCALL	SUB_370
	MOV	R16,R24
	LDD	R18,Y+6
	CPI	R18,4
	BRCC	loc_4E9
	MOV	R24,R18
	LDI	R25,0
	ADIW	R25:R24,7
	MOV	R22,R13
	SUB	R22,R18
	ADD	R24,R28
	ADC	R25,R29
	RCALL	SUB_370
loc_4E9:	LDD	R24,Y+5
	CP	R16,R24
	BRNE	loc_4EE
	LDI	R24,0
	RJMP	loc_4FB

loc_4EE:	SBI	PORTB,5		;Сигнал SCK = 1 - B7
	LDS	R24,Buffer_08D
	RCALL	SUB_772
	CBI	PORTB,5		;Сигнал SCK = 0 - B7
	LDS	R24,Buffer_08D
	RCALL	SUB_772
loc_4F6:	SUBI	R17,1
	BRCC	loc_4D9
	LDI	R24,0
	RCALL	SUB_365
	LDI	R24,$C0 
loc_4FB:	POP	R29
	POP	R28
	POP	R17
	POP	R16
	POP	R15
	POP	R14
	POP	R13
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_503:	PUSH	R17
	RCALL	SUB_7AD
	LDI	R17,$F0
	RJMP	loc_50D

loc_507:	LDS	R24,$31D
	TST	R24
	BRNE	loc_50D
	LDI	R24,$81
	RJMP	loc_518

loc_50D:	STS	Buffer_08E,R17
	STS	Buffer_08F,R1
	LDI	R24,$8E
	LDI	R25,0
	LDI	R22,4
	RCALL	SUB_370
	SBRC	R24,0
	RJMP	loc_507
	LDI	R24,0
loc_518:	POP	R17
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_51A:	PUSH	R15
	PUSH	R16
	PUSH	R17
	MOVW	R17:R16,R25:R24
	MOVW	R31:R30,R25:R24
	LD	R15,Z
	SBI	PORTD,7		;Включить светодиод WR
	ADIW	R25:R24,2
	LDI	R22,4
	RCALL	SUB_370
	MOVW	R31:R30,R17:R16
	LDD	R24,Z+1
	TST	R24
	BREQ	loc_530
	LDI	R31,9
	CP	R31,R15
	BRCS	loc_52D
	LDI	R21,$A
	MOV	R15,R21
loc_52D:	MOV	R24,R15
	RCALL	SUB_503
	RJMP	loc_533

loc_530:	MOV	R24,R15
	RCALL	SUB_766
	LDI	R24,0
loc_533:	CBI	PORTD,7		;Выключить светодиод WR
	POP	R17
	POP	R16
	POP	R15
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_538:	PUSH	R6
	PUSH	R7
	PUSH	R8
	PUSH	R9
	PUSH	R10
	PUSH	R11
	PUSH	R12
	PUSH	R13
	PUSH	R14
	PUSH	R15
	PUSH	R16
	PUSH	R17
	PUSH	R28
	PUSH	R29
	MOVW	R29:R28,R25:R24
	MOV	R6,R22
	SBI	PORTD,7		;Включить светодиод WR
	LD	R15,Y
	LDD	R17,Y+1
	LDD	R24,Y+2
	SBRC	R24,0
	RJMP	loc_552
	LDI	R23,4
	MOV	R7,R23
	LDI	R16,8
	RJMP	loc_555

loc_552:	LDI	R22,$20
	MOV	R7,R22
	LDI	R16,$40
loc_555:	TST	R6
	BRNE	loc_56A
	LDS	R24,$31C
	SBRS	R24,7
	RJMP	loc_56A
	LDI	R24,$4D
	STS	Buffer_08E,R24
	STS	Buffer_08F,R1
	LDS	R24,$31B
	STS	Buffer_090,R24
	STS	Buffer_091,R1
	LDI	R24,$8E
	LDI	R25,0
	LDI	R22,4
	RCALL	SUB_370
loc_56A:	MOV	R12,R17
	MOV	R13,R15
	MOVW	R9:R8,R13:R12
	SEC
	SBC	R8,R1
	SBC	R9,R1
	MOVW	R11:R10,R29:R28
	CLR	R14
	CLR	R15
	RJMP	loc_5D0

loc_574:	WDR
	LDS	R24,$31A
	STS	Buffer_08F,R24
	LDS	R24,$319
	STS	Buffer_090,R24
	MOVW	R31:R30,R11:R10
	LDD	R24,Z+9
	STS	Buffer_091,R24
	LDD	R17,Y+4
	TST	R6
	BRNE	loc_588
	ANDI	R17,$F7
	SBRS	R14,0
	RJMP	loc_589
	ORI	R17,8
loc_588:	RCALL	SUB_5E5
loc_589:	STS	Buffer_08E,R17
	LDI	R24,$8E
	LDI	R25,0
	LDI	R22,4
	RCALL	SUB_370
	LDD	R24,Y+2
	SBRS	R24,0
	RJMP	loc_59E
	CP	R14,R8
	CPC	R15,R9
	BRCS	loc_5C7
	SBRS	R24,7
	RJMP	loc_5C7
	LDD	R24,Y+5
	STS	Buffer_08E,R24
	LDI	R24,$8E
	LDI	R25,0
	LDI	R22,4
	RCALL	SUB_370
loc_59E:	LDD	R25,Y+2
	MOV	R24,R7
	AND	R24,R25
	BREQ	loc_5C0
	MOVW	R31:R30,R11:R10
	LDD	R17,Z+9
	LDD	R24,Y+7
	CP	R17,R24
	BREQ	loc_5C5
	LDD	R24,Y+8
	CP	R17,R24
	BREQ	loc_5C5
	LDD	R24,Y+6
	ANDI	R24,$F7
	SBRC	R14,0
	ORI	R24,8
	STS	Buffer_08E,R24
	LDD	R24,Y+3
	RCALL	SUB_7AD
	RJMP	loc_5B9

loc_5B3:	LDS	R24,$31D
	TST	R24
	BRNE	loc_5B9
	LDI	R24,$80
	RJMP	loc_5C8

loc_5B9:	LDI	R24,$8E
	LDI	R25,0
	LDI	R22,4
	RCALL	SUB_370
	CP	R24,R17
	BRNE	loc_5B3
	RJMP	loc_5C7

loc_5C0:	AND	R25,R16
	BREQ	loc_5C5
	LDD	R24,Y+3
	RCALL	SUB_503
	RJMP	loc_5C8

loc_5C5:	LDD	R24,Y+3
	RCALL	SUB_766
loc_5C7:	LDI	R24,0
loc_5C8:	SEC
	ADC	R10,R1
	ADC	R11,R1
	TST	R24
	BRNE	loc_5D5
	SEC
	ADC	R14,R1
	ADC	R15,R1
loc_5D0:	CP	R14,R12
	CPC	R15,R13
	BRCC	loc_5D4
	RJMP	loc_574

loc_5D4:	LDI	R24,0
loc_5D5:	CBI	PORTD,7		;Выключить светодиод WR
	POP	R29
	POP	R28
	POP	R17
	POP	R16
	POP	R15
	POP	R14
	POP	R13
	POP	R12
	POP	R11
	POP	R10
	POP	R9
	POP	R8
	POP	R7
	POP	R6
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_5E5:	LDS	R24,$319
	LDS	R25,$31A
	LDS	R26,$31B
	LDS	R27,$31C
	ADIW	R25:R24,1
	ADC	R26,R1
	ADC	R27,R1
	STS	$319,R24
	STS	$31A,R25
	STS	$31B,R26
	STS	$31C,R27
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_5F9:	LDI	R18,$1B
	STS	Buffer_1B0,R18
	LDS	R18,Buffer_093
	STS	Buffer_1B1,R18
	STS	Buffer_1B2,R25
	STS	Buffer_1B3,R24
	LDI	R18,$0E
	STS	Buffer_1B4,R18
	STS	$2CA,R1
	STS	$2C9,R1
	ADIW	R25:R24,6
	STS	$2CC,R25
	STS	$2CB,R24
	MOVW	R19:R18,R25:R24
	SUBI	R18,1
	SBCI	R19,0
	LDI	R30,$B0
	LDI	R31,1
	LDI	R25,0
	RJMP	loc_61B

loc_617:	LD	R24,Z+
	EOR	R25,R24
	SUBI	R18,1
	SBCI	R19,0
loc_61B:	CP	R18,R1
	CPC	R19,R1
	BRNE	loc_617
	ST	Z,R25
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_620:	MOV	R18,R24
	LDS	R24,$31E
	TST	R24
	BRNE	loc_629
	STS	Buffer_1AC,R1
	STS	Buffer_1AB,R1
loc_629:	LDS	R24,Buffer_1AB
	LDS	R25,Buffer_1AC
	SBIW	R25:R24,0
	BRNE	loc_63B
	CPI	R18,$1B
	BREQ	loc_632
	RJMP	loc_692

loc_632:	STS	Buffer_092,R18
	LDI	R24,1
	LDI	R25,0
	STS	Buffer_1AC,R25
	STS	Buffer_1AB,R24
	RJMP	loc_692

loc_63B:	LDI	R19,1
	CPI	R24,$19
	CPC	R25,R19
	BRCS	loc_640
	RJMP	loc_68E

loc_640:	MOVW	R31:R30,R25:R24
	SUBI	R30,$6E
	SBCI	R31,$FF
	ST	Z,R18
	MOVW	R31:R30,R25:R24
	ADIW	R31:R30,1
	STS	Buffer_1AC,R31
	STS	Buffer_1AB,R30
	CPI	R30,4
	CPC	R31,R1
	BRNE	loc_662
	LDS	R24,Buffer_095
	STS	Buffer_1AD,R24
	LDS	R24,Buffer_094
	STS	Buffer_1AE,R24
	LDS	R24,Buffer_1AD
	LDS	R25,Buffer_1AE
	ADIW	R25:R24,6
	STS	Buffer_1AE,R25
	STS	Buffer_1AD,R24
	SUBI	R24,$1A
	SBCI	R25,1
	BRCS	loc_692
	RJMP	loc_68E

loc_662:	CPI	R30,5
	CPC	R31,R1
	BRNE	loc_668
	CPI	R18,$E
	BRNE	loc_68E
	RJMP	loc_692

loc_668:	CPI	R30,5
	CPC	R31,R1
	BRCS	loc_692
	LDS	R24,Buffer_1AD
	LDS	R25,Buffer_1AE
	CP	R30,R24
	CPC	R31,R25
	BRNE	loc_692
	LDI	R25,0
	LDI	R26,$92
	LDI	R27,0
	RJMP	loc_679

loc_676:	LD	R24,X+
	EOR	R25,R24
	SBIW	R31:R30,1
loc_679:	SBIW	R31:R30,0
	BRNE	loc_676
	STS	Buffer_1AC,R1
	STS	Buffer_1AB,R1
	TST	R25
	BRNE	loc_685
	LDI	R24,1
	STS	Buffer_1AF,R24
	RJMP	loc_692

loc_685:	LDI	R24,$B0
	STS	Buffer_1B5,R24
	STS	Buffer_1B6,R24
	LDI	R24,2
	LDI	R25,0
	RCALL	SUB_5F9
	RJMP	loc_692

loc_68E:	STS	Buffer_1AC,R1
	STS	Buffer_1AB,R1
loc_692:	LDI	R24,$C8
	STS	$31E,R24
	RET

	LDS	R18,$2CB
	LDS	R19,$2CC
	LDS	R24,$2C9
	LDS	R25,$2CA
	SUB	R18,R24
	SBC	R19,R25
	MOVW	R25:R24,R19:R18
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_6A2:	LDS	R18,$2CB
	LDS	R19,$2CC
	CP	R18,R1
	CPC	R19,R1
	BRNE	loc_6AC
	SER	R30
	SER	R31
	RJMP	loc_6C5

loc_6AC:	LDS	R24,$2C9
	LDS	R25,$2CA
	MOVW	R31:R30,R25:R24
	SUBI	R30,$50
	SBCI	R31,$FE
	LD	R30,Z
	ADIW	R25:R24,1
	STS	$2CA,R25
	STS	$2C9,R24
	CP	R24,R18
	CPC	R25,R19
	BRCS	loc_6C4
	STS	$2CC,R1
	STS	$2CB,R1
	STS	$2CA,R1
	STS	$2C9,R1
loc_6C4:	LDI	R31,0
loc_6C5:	MOVW	R25:R24,R31:R30
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_6C7:	PUSH	R28
	PUSH	R29
	LDI	R28,2
	LDI	R29,0
	LDS	R24,Buffer_097
	STS	Buffer_1B5,R24
	STS	Buffer_1B6,R1
	LDI	R25,0
	MOVW	R31:R30,R25:R24
	SBIW	R31:R30,1
	CPI	R30,$2D
	CPC	R31,R1
	BRCS	loc_6D8
	RJMP	loc_756

loc_6D8:	SUBI	R30,$ED
	SBCI	R31,$FF
	IJMP


loc_6DB:	LDI	R24,$B7
	LDI	R25,$01
	LDI	R22,LOW(Data_4*2)
	LDI	R23,HIGH(Data_4*2)	;STK500_2
	RCALL	SUB_868
	LDI	R28,$0B
	RJMP	loc_759

loc_6E2:	LDS	R30,Buffer_098
	LDS	R18,Buffer_099
	CPI	R30,$96
	BRNE	loc_6EF
	IN	R24,TCCR2
	MOV	R25,R18
	ANDI	R25,7
	ANDI	R24,$F8
	OR	R25,R24
	OUT	TCCR2,R25
	RJMP	loc_6F2

loc_6EF:	CPI	R30,$97
	BRNE	loc_6F2
	OUT	OCR2,R18
loc_6F2:	LDI	R31,0
	ANDI	R30,$1F
	ANDI	R31,0
	SUBI	R30,$9E
	SBCI	R31,$FF
	ST	Z,R18
	RJMP	loc_759

loc_6F9:	LDS	R30,Buffer_098
	CPI	R30,$96
	BRNE	loc_700
	IN	R30,TCCR2
	ANDI	R30,7
	RJMP	loc_70A

loc_700:	CPI	R30,$97
	BRNE	loc_704
	IN	R30,OCR2
	RJMP	loc_70A

loc_704:	LDI	R31,0
	ANDI	R30,$1F
	ANDI	R31,0
	SUBI	R30,$9E
	SBCI	R31,$FF
	LD	R30,Z
loc_70A:	STS	Buffer_1B7,R30
	LDI	R28,3
	RJMP	loc_759

loc_70E:	LDS	R24,Buffer_098
	STS	$31C,R24
	LDS	R24,Buffer_099
	STS	$31B,R24
	LDS	R24,Buffer_09A
	STS	$31A,R24
	LDS	R24,Buffer_09B
	STS	$319,R24
	RJMP	loc_759

loc_71F:	LDI	R24,$98
	LDI	R25,0
	RCALL	SUB_48D
	RJMP	loc_757

loc_723:	LDI	R24,$98
	LDI	R25,0
	RCALL	SUB_481
	RJMP	loc_759

loc_727:	LDI	R24,$98
	LDI	R25,0
	RCALL	SUB_51A
	RJMP	loc_757

loc_72B:	LDI	R24,$98
	LDI	R25,0
	LDI	R22,0
	RJMP	loc_738

loc_72F:	LDI	R24,$98
	LDI	R25,0
	LDI	R22,$B6
	LDI	R23,1
	LDI	R20,0
	RJMP	loc_73F

loc_735:	LDI	R24,$98
	LDI	R25,0
	LDI	R22,1
loc_738:	RCALL	SUB_538
	RJMP	loc_757

loc_73A:	LDI	R24,$98
	LDI	R25,0
	LDI	R22,$B6
	LDI	R23,1
	LDI	R20,1
loc_73F:	RCALL	SUB_41D
	RJMP	loc_753

loc_741:	LDI	R24,$98
	LDI	R25,0
	RCALL	SUB_3FF
	STS	Buffer_1B7,R24
	STS	Buffer_1B8,R1
	LDI	R28,4
	RJMP	loc_759

loc_74A:	LDI	R24,$98
	LDI	R25,0
	RCALL	SUB_417
	RJMP	loc_757

loc_74E:	LDI	R24,$98
	LDI	R25,0
	LDI	R22,$B6
	LDI	R23,1
	RCALL	SUB_3A4
loc_753:	MOVW	R29:R28,R25:R24
	ADIW	R29:R28,1
	RJMP	loc_759

loc_756:	LDI	R24,$C0
loc_757:	STS	Buffer_1B6,R24
loc_759:	MOVW	R25:R24,R29:R28
	RCALL	SUB_5F9
	POP	R29
	POP	R28
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_75E:	LDS	R24,Buffer_1AF
	TST	R24
	BREQ	locRET_765
	STS	Buffer_1AF,R1
	RCALL	SUB_6C7
locRET_765:	RET

; =============== S U B	R O U T	I N E =======================================

SUB_766:	MOV	R25,R24
	LSR	R25
	LSR	R25
	SUBI	R24,$FF
	SUB	R24,R25
	STS	$31D,R24
loc_76D:	LDS	R24,$31D
	TST	R24
	BRNE	loc_76D
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_772:	MOV	R25,R24
	CLI
	LDI	R24,1
	OUT	SFIOR,R24
	IN	R24,TCNT0
	ADD	R25,R24
	SEI
loc_779:	IN	R24,TCNT0
	SUB	R24,R25
	SBRC	R24,7
	RJMP	loc_779
	RET

; =============== S U B	R O U T	I N E =======================================

TIMER0_OVF:	SEI
	PUSH	R1
	PUSH	R0
	IN	R0,SREG
	PUSH	R0
	CLR	R1
	PUSH	R24
	CLI
	LDS	R24,$31D
	TST	R24
	BREQ	loc_78F
	LDS	R24,$31D
	SUBI	R24,1
	STS	$31D,R24
loc_78F:	SEI
	CLI
	LDS	R24,Buffer_082
	SUBI	R24,1
	STS	Buffer_082,R24
	TST	R24
	BRNE	loc_7A6
	LDI	R24,$49
	STS	Buffer_082,R24
	SEI
	LDS	R24,$31E
	TST	R24
	BREQ	loc_7A7
	LDS	R24,$31E
	SUBI	R24,1
	STS	$31E,R24
	RJMP	loc_7A7

loc_7A6:	SEI
loc_7A7:	POP	R24
	POP	R0
	OUT	SREG,R0
	POP	R0
	POP	R1
	RETi

; =============== S U B	R O U T	I N E =======================================

SUB_7AD:	MOV	R25,R24
	SUBI	R25,$FF
	LSR	R24
	LSR	R24
	SUB	R25,R24
	STS	$31D,R25
	RET
SUB_7B5:	RET

; =============== S U B	R O U T	I N E =======================================

SUB_7B6:	MOVW	R31:R30,R25:R24
	LDS	R24,$2D6
	TST	R24
	BREQ	loc_7BF
	LDI	R18,0
	LDI	R19,0
	LDI	R24,0
	RJMP	loc_7C9

loc_7BF:	LDD	R24,Z+3
	CPI	R24,1
	BRNE	loc_7C6
	LDI	R18,LOW(Data_5*2)
	LDI	R19,HIGH(Data_5*2)	;Device Descriptor
	LDI	R24,$12
	RJMP	loc_7C9

loc_7C6:	LDI	R18,LOW(Data_6*2)
	LDI	R19,HIGH(Data_6*2)	;Configuration
	LDI	R24,$43
loc_7C9:	STS	$2F2,R19
	STS	$2F1,R18
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_7CE:	MOVW	R31:R30,R25:R24
	LD	R24,Z
	ANDI	R24,$60
	CPI	R24,$20
	BRNE	loc_7DF
	LDS	R24,$2D6
	TST	R24
	BRNE	loc_7DF
	LDD	R24,Z+1
	SUBI	R24,$20
	CPI	R24,2
	BRCC	loc_7DF
	STS	$2D5,R1
	SER	R24
	RET

loc_7DF:	LDI	R24,0
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_7E1:	PUSH	R16
	PUSH	R17
	PUSH	R28
	PUSH	R29
	LDI	R18,$E
	LDI	R24,$18
	LDI	R25,0
	IN	R0,SREG
	CLI
	WDR
	OUT	WDTCR,R24
	OUT	SREG,R0
	OUT	WDTCR,R18
	LDI	R24,1
	OUT	PORTB,R24		;Подтяжка на джампер LOV SCK
	LDI	R24,2
	OUT	DDRB,R24
	OUT	PORTC,R1
	LDI	R24,$18
	OUT	DDRC,R24
	LDI	R24,3
	OUT	PORTD,R24
	LDI	R24,$C1
	OUT	DDRD,R24
	SBI	DDRD,3
	LDI	R18,0
	LDI	R20,$B8
	LDI	R21,$0B
	RJMP	loc_802

loc_7FE:	WDR
	MOVW	R25:R24,R21:R20
loc_800:	SBIW	R25:R24,1
	BRNE	loc_800
loc_802:	SUBI	R18,1
	BRNE	loc_7FE
	CBI	DDRD,3
	LDI	R24,3
	OUT	TCCR0,R24
	LDI	R24,1
	OUT	TIMSK,R24
	LDI	R24,$82
	OUT	TCCR1A,R24
	LDI	R24,$19
	OUT	TCCR1B,R24
	LDI	R24,$B
	LDI	R25,0
	OUT	ICR1H,R25
	OUT	ICR1L,R24
	LDI	R24,5
	LDI	R25,0
	OUT	OCR1AH,R25
	OUT	OCR1AL,R24
	RCALL	SUB_7B5
	RCALL	SUB_AA
	SEI
	LDS	R16,$2D6
loc_81A:	WDR
	RCALL	SUB_E6
	RCALL	SUB_75E
	TST	R16
	BRNE	loc_81A
	LDS	R24,$2E2
	SBRS	R24,4
	RJMP	loc_81A
	LDI	R28,$CD
	LDI	R29,2
	LDI	R17,0
	RJMP	loc_82B

loc_827:	ST	Y+,R24
	SUBI	R17,$FF
	CPI	R17,8
	BREQ	loc_834
loc_82B:	RCALL	SUB_6A2
	SBRS	R25,7
	RJMP	loc_827
	TST	R17
	BRNE	loc_834
	LDS	R24,Buffer_083
	TST	R24
	BREQ	loc_81A
loc_834:	STS	Buffer_083,R17
	LDI	R24,$CD
	LDI	R25,2
	MOV	R22,R17
	RCALL	SUB_E2
	RJMP	loc_81A

; =============== S U B	R O U T	I N E =======================================

SUB_83B:	PUSH	R17
	PUSH	R28
	PUSH	R29
	MOVW	R29:R28,R25:R24
	MOV	R17,R22
loc_840:	LD	R24,Y+
	RCALL	SUB_620
	SUBI	R17,1
	BRNE	loc_840
	POP	R29
	POP	R28
	POP	R17
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_848:	MOVW	R19:R18,R25:R24
	LDS	R24,$2D5
	TST	R24
	BRNE	loc_855
	LDI	R26,$84
	LDI	R27,0
	MOVW	R31:R30,R19:R18
	LDI	R24,7
loc_851:	LD	R0,Z+
	ST	X+,R0
	SUBI	R24,1
	BRNE	loc_851
loc_855:	LDI	R24,1
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_857:	MOVW	R19:R18,R25:R24
	LDS	R24,$2D5
	TST	R24
	BREQ	loc_85E
	LDI	R24,0
	RET

loc_85E:	MOVW	R27:R26,R19:R18
	LDI	R30,$84
	LDI	R31,0
	LDI	R24,7

loc_862:	LD	R0,Z+
	ST	X+,R0
	SUBI	R24,1
	BRNE	loc_862
	LDI	R24,7
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_868:	MOVW	R31:R30,R23:R22
	MOVW	R27:R26,R25:R24
loc_86A:	LPM	R0,Z+
	ST	X+,R0
	TST	R0
	BRNE	loc_86A
	RET

loc_86F:	CLI
loc_870:	RJMP	loc_870

;_______________________________________________________________________________________

Data_c:	.DB $5A,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.DB $00,$00,$01,$02,$04,$00,$32,$00,$01,$80,$02,$00,$AA,$00,$00,$00
	.DB $00,$00,$00,$01,$01,$80,$25,$00,$00,$00,$00,$08,$00,$00
;_______________________________________________________________________________________

.INCLUDE "MemORy.asm"
