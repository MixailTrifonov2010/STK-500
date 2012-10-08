
.INCLUDE "m8535def.inc"
.DEVICE ATmega8535			;С кварцем на 7,3728 Мгц

;.equ 	 SREG	 =$3f		; Регистр состояния
;.equ 	 SPL	 =$3d		; Старший байт регистра указателя стека
;.equ 	 SPH	 =$3e		; Младший байт регистра указателя стека
;.equ 	 OCR0	 =$3c		; Регистра сравнения таймера / счётчика Т0
;.equ 	 GICR 	 =$3b		; Общий регистр управления прерываниями
;.equ 	 GIFR	 =$3a		; Общий регистр флагов прерывания
;.equ 	 TIMSK	 =$39		; Регистр маски прерывания таймеров / счётчиков
;.equ 	 TIFR 	 =$38		; Регистр флагов прерывания таймеров / счётчиков
;.equ 	 SPMCR	 =$37		; Регистр управления самопрограммированием
;.equ 	 TWCR	 =$36		; TWI Регистр управления
;.equ 	 MCUCR	 =$35		; Регистр управления микроконтроллера
;.equ 	 MCUCSR	 =$34		; Регистр управления и состояния микроконтроллера
;.equ 	 TCCR0	 =$33		; Регистр управления таймера / счётчика Т0
;.equ 	 TCNT0 	 =$32		; Счётный регистр таймера / счётчика Т0
;.equ 	 OSCCAL	 =$31		; Регистр калибровки внутреннего генератора
;.equ 	 SFIOR	 =$30		; Регистр специальных функций I/O 
;.equ 	 TCCR1A	 =$2f		; Регистр управления A таймера / счётчика Т1
;.equ 	 TCCR1B	 =$2e		; Регистр управления B таймера / счётчика Т1
;.equ 	 TCNT1H	 =$2d		; Регистр данных таймера / счётчика Т1 ст. байт
;.equ 	 TCNT1L	 =$2c		; Регистр данных таймера / счётчика Т1 мл. байт
;.equ 	 OCR1AH	 =$2b		; Регистр сравнения А таймера / счётчика Т1 ст. байт
;.equ 	 OCR1AL	 =$2a		; Регистр сравнения А таймера / счётчика Т1 мл. байт
;.equ 	 OCR1BH	 =$29		; Регистр сравнения В таймера / счётчика Т1 ст. байт
;.equ 	 OCR1BL	 =$28		; Регистр сравнения В таймера / счётчика Т1 мл. байт
;.equ 	 ICR1H 	 =$27		; Регистр захвата таймера / счётчика Т1 ст. байт
;.equ 	 ICR1L 	 =$26		; Регистр захвата таймера / счётчика Т1 мл. байт
;.equ 	 TCCR2	 =$25		; Регистр управления таймера / счётчика Т2
;.equ 	 TCNT2	 =$24		; Счётный регистр таймера / счётчика Т2
;.equ 	 OCR2 	 =$23		; Регистра сравнения таймера / счётчика Т2
;.equ 	 ASSR 	 =$22		; Регистр асинхронного режима
;.equ 	 WDTCR 	 =$21		; Регистр сторожевого таймера
;.equ 	 UBRRH	 =$20		; USART ст. байт регистра скорости в бодах ?
;.equ 	 UCSRC 	 =$20		; USART Контроль(управление) и C Регистра Состояния
;.equ 	 EEARH	 =$1f		; Регистр адреса EEPROM ст. байт
;.equ 	 EEARL	 =$1e		; Регистр адреса EEPROM мл. байт
;.equ 	 EEDR 	 =$1d		; Регистр данных EEPROM
;.equ 	 EECR 	 =$1c		; Регистр управления EEPROM
;.equ 	 PORTA	 =$1b		; Регистр данных порт A (выход)
;.equ 	 DDRA 	 =$1a		; Регистр направления порт A
;.equ 	 PINA 	 =$19		; Выводы порт A (вход)
;.equ 	 PORTB	 =$18		; Регистр данных порт B (выход)
;.equ 	 DDRB 	 =$17		; Регистр направления порт B
;.equ 	 PINB 	 =$16		; Выводы порт B (вход)
;.equ 	 PORTC	 =$15		; Регистр данных порт C (выход)
;.equ 	 DDRC 	 =$14		; Регистр направления порт C
;.equ 	 PINC 	 =$13		; Выводы порт C (вход)
;.equ 	 PORTD	 =$12		; Регистр данных порт D (выход)
;.equ 	 DDRD 	 =$11		; Регистр направления порт D
;.equ 	 PIND 	 =$10		; Выводы порт D (вход)
;.equ 	 SPDR 	 =$0f		; SPI Регистр Данных
;.equ 	 SPSR	 =$0e		; SPI Регистр состояния
;.equ 	 SPCR 	 =$0d		; SPI Регистр управления
;.equ 	 UDR 	 =$0c		; USART Регистр Данных Ввода - вывода
;.equ 	 UCSRA 	 =$0b		; USART Регистр A состояния и управления
;.equ 	 UCSRB	 =$0a		; USART Регистр B состояния и управления
;.equ 	 UBRRL	 =$09		; USART мл. байт регистра скорости в бодах
;.equ 	 ACSR 	 =$08		; Регистр управления и состояния аналоговым компаратором
;.equ 	 ADMUX	 =$07		; Регистр управления мультиплексором АЦП
;.equ 	 ADCSRA	 =$06		; Регистр A управления и состояния АЦП 
;.equ 	 ADCH 	 =$05		; Ст. байт регистра данных АЦП
;.equ 	 ADCL 	 =$04		; Мл. байт регистра данных АЦП
;.equ 	 TWDR 	 =$03		; TWI регистр данных
;.equ 	 TWAR 	 =$02		; TWI (Подчиненный) регистр адреса
;.equ 	 TWSR 	 =$01		; TWI регистр состояния
;.equ 	 TWBR 	 =$00		; TWI регистр скорости передачи в битах
;.equ 	 RAMEND	 =$025F		; Верхняя граница области ОЗУ

.CSEG
.ORG $0000

Start:	RJMP	RESET		; Обработка сброса
	RETI			; Внешнее прерывание 0
	RETI			; Внешнее прерывание 1
	RETI	  		; Совпадение таймера/счётчика Т2
	RETI			; Переполнение таймера/счётчика Т2
	RETI			; Захват таймера/счётчика Т1
	RETI			; Совпадение А таймера/счётчика Т1
	RETI			; Совпадение В таймера/счётчика Т1
	RETI	  		; Переполнение таймера/счётчика Т1
	RJMP	TIMER0_OVF		; Переполнение таймера/счётчика Т0
	RETI			; Передача по SPI завершена
	RJMP	USART_RXC		; USART, приём завершен
	RJMP	USART_UDRE		; Регистр данных USART пуст
	RETI			; USART, передача завершена
	RETI			; Преобразование АЦП завершено
 	RETI	  		; EEPROM готово
	RETI	            	; Аналоговый компаратор

;***************************************************************************************
.ORG $0011

Data_1:	.DB $51,$0C,$77,$0C,$79,$0C,$CC,$0C,$7B,$0C,$7D,$0C,$81,$0C,$CC,$0C
	.DB $CC,$0C,$CC,$0C,$CC,$0C,$CC,$0C,$CC,$0C,$CC,$0C,$CC,$0C,$83,$0C
	.DB $85,$0C,$87,$0C,$89,$0C,$8B,$0C,$8E,$0C,$90,$0C,$92,$0C,$94,$0C
	.DB $92,$0C,$94,$0C,$94,$0C,$94,$0C,$96,$0C,$CC,$0C,$CC,$0C,$98,$0C
	.DB $9A,$0C,$9C,$0C,$9E,$0C,$A0,$0C,$A2,$0C,$A4,$0C,$A6,$0C,$A8,$0C
	.DB $AA,$0C,$AC,$0C,$AE,$0C,$B0,$0C,$7F,$0C,$CC,$0C,$CC,$0C,$B2,$0C
	.DB $B4,$0C,$B6,$0C,$B8,$0C,$BA,$0C,$BC,$0C,$BE,$0C,$C0,$0C,$C2,$0C
	.DB $C4,$0C,$C6,$0C,$C8,$0C,$CA,$0C

.ORG $004D

Data_2:	.DB $7C,$01,$64,$00,$00,$00,$04,$00,$60,$00,$E6,$1F	; 1FE6 адрес Data_4

;***************************************************************************************

SUB_53:	LDI	R16,7
	OUT	ADMUX,R16		;8 канал АЦП, опрное напряжение внешнее =Vcc (5v)
	LDI	R16,$83
	OUT	ADCSRA,R16
	SBI	ADCSRA,6		;Запуск преоброзавания частотой 7,3728/8 Мгц
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_59:	IN	R20,ADMUX
	LDI	R16,7
	OUT	ADMUX,R16		;8 канал АЦП, опрное напряжение внешнее =Vcc (5v)
	LDI	R16,0
	LDI	R17,0
	SBI	ADCSRA,6		;Запуск преоброзавания частотой 7,3728/8 Мгц
	LDI	R19,4
loc_60:	LDI	R18,$20
loc_61:	SBIC	ADCSRA,4		;Преобразование АЦП завершено ?
	RJMP	loc_65
	DEC	R18
	BRNE	loc_61
loc_65:	IN	R22,ADCL
	IN	R23,ADCH
	ADD	R16,R22
	ADC	R17,R23
	DEC	R19
	BRNE	loc_60
	OUT	ADMUX,R20		;8 канал АЦП, опрное напряжение внешнее =Vcc (5v)
	LDI	R20,6
	RJMP	loc_F9A

; =============== S U B	R O U T	I N E =======================================

SUB_6E:	LDI	R16,$20 
	SBI	ADCSRA,6		;Запуск преоброзавания частотой 7,3728/8 Мгц
loc_70:	SBIC	ADCSRA,4		;Преобразование АЦП завершено ?
	RJMP	loc_74
	DEC	R16
	BRNE	loc_70
loc_74:	RCALL	SUB_8E
	LD	R18,Z
	LDD	R19,Z+1
	ADD	R18,R16
	ADC	R19,R17
	ST	Z,R18
	STD	Z+1,R19
	LDD	R16,Z+4
	INC	R16
	STD	Z+4,R16
	CPI	R16,$0F
	BRNE	loc_86
	RCALL	SUB_89
	STS	Buffer_1D5,R16	;Результат АЦП преобразований
	LDI	R16,0
	ST	Z,R16
	STD	Z+1,R16
loc_86:	LDI	R16,6
	OUT	ADMUX,R16		;7 канал АЦП, опрное напряжение внешнее =Vcc (5v)
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_89:	MOV	R16,R18
	LSL	R16
	MOV	R16,R19
	ROL	R16
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_8E:	IN	R16,ADCL
	IN	R17,ADCH
	LDI	R30,$64
	LDI	R31,0
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_93:	LDI	R16,$20 
	SBI	ADCSRA,6		;Запуск преоброзавания частотой 7,3728/8 Мгц
loc_95:	SBIC	ADCSRA,4		;Преобразование АЦП завершено ?
	RJMP	loc_99
	DEC	R16
	BRNE	loc_95
loc_99:	RCALL	SUB_8E
	LDD	R18,Z+2
	LDD	R19,Z+3
	ADD	R18,R16
	ADC	R19,R17
	STD	Z+2,R18
	STD	Z+3,R19
	LDD	R16,Z+4
	INC	R16
	STD	Z+4,R16
	CPI	R16,$10
	BRNE	loc_AC
	RCALL	SUB_89
	STS	Buffer_1D7,R16
	LDI	R16,0
	STD	Z+2,R16
	STD	Z+3,R16
	STD	Z+4,R16
loc_AC:	LDI	R16,7
	OUT	ADMUX,R16		;8 канал АЦП, опрное напряжение внешнее =Vcc (5v)
	RET

;*********** Засись или чтение в/из EEPROM *********************************************

loc_AF:	SBIC	EECR,1
	RJMP	loc_AF
	RCALL	SUB_BD
	CP	R16,R18
	BREQ	locRET_BC
	OUT	EEDR,R18
	CLI
	SBI	EECR,2
	SBI	EECR,1
	LDI	R16,0
	OUT	EEARH,R16
	OUT	EEARL,R16
	SEI
locRET_BC:	RET

SUB_BD:	OUT	EEARH,R17
	OUT	EEARL,R16
	SBI	EECR,0
	IN	R16,EEDR
	RET

loc_C2:	SBIC	EECR,1
	RJMP	loc_C2
	RJMP	SUB_BD

;***************************************************************************************

SUB_C5:	RCALL	SUB_12F
	SBIW	R28,3
	RCALL	SUB_BEC
	MOV	R24,R16
	RCALL	SUB_BEC
	ST	Y,R16
	RCALL	SUB_BEC
	MOV	R25,R16
	RCALL	SUB_BEC
	STS	Buffer_069,R16
	RCALL	SUB_BEC
	MOV	R26,R16
	RCALL	SUB_BEC
	STD	Y+1,R16
	RCALL	SUB_BEC
	STD	Y+2,R16
	RCALL	SUB_BEC
	MOV	R27,R16
	LDS	R16,Buffer_1D5	;Результат АЦП преобразований
	CPI	R16,$2D
	BRCS	loc_E0
	LDS	R16,Buffer_1D5	;Результат АЦП преобразований
	CPI	R16,$38
	BRCS	loc_E4
loc_E0:	RCALL	SUB_12A
	LDI	R16,$C0
	RCALL	SUB_C07
	RJMP	loc_11B
loc_E4:	SBI	PORTD,2		;Cигнал Reset = 1 (на базу VT5)
	CBI	PORTD,3		;Выключить +12v (на базу VT1)
	MOV	R16,R24
	RCALL	SUB_AF1
	IN	R16,TCCR2
	ANDI	R16,$EF
	OUT	TCCR2,R16
	SBI	PORTD,7		;Cигнал Xtpl1 = 1 (на базы VT3,VT4)
	LDI	R16,$07
	OUT	DDRB,R16
	LDS	R16,Buffer_1D3
	OUT	DDRC,R16
	LDI	R16,0
	OUT	PORTC,R16		;Cигналы-Pagel,Xa1,Xa0,BS1,~WR,~OE,R/B,BS2 = 0
	CBI	PORTB,0
	CBI	PORTB,2
	CBI	PORTB,1
	MOV	R16, R24
	RCALL	SUB_AF1
	TST	R26
	BRNE	loc_100
	RJMP	loc_FC
loc_FB:	RCALL	SUB_120
loc_FC:	MOV	R16,R25
	DEC	R25
	TST	R16
	BRNE	loc_FB
loc_100:	CLI
	TST	R26
	BREQ	loc_109
	MOV	R19,R25
	MOV	R18,R27
	LDD	R17,Y+2
	LDD	R16,Y+1
	RCALL	SUB_98C
	RJMP	loc_10B
loc_109:	MOV	R16,R24
	RCALL	SUB_AF1
loc_10B:	SBI	PORTD,3		;Включить +12v (на базу VT1)
	CBI	PORTD,2		;Cигнал Reset = 0 (на базу VT5)
	LD	R16,Y
	RCALL	SUB_B13
	LDI	R16,$64
	RCALL	SUB_B13
	SEI
	LDI	R16,0
	OUT	DDRC,R16		;Порт С на ввод
	OUT	PORTC,R16		;Cигналы-Pagel,Xa1,Xa0,BS1,~WR,~OE,R/B,BS2 = 0
	LDI	R16,3
	OUT	DDRB,R16
	LD	R16,Y
	RCALL	SUB_B13
	RCALL	SUB_DE8
	RCALL	SUB_ED6
loc_11B:	ADIW	R28,3
loc_11C:	RCALL	SUB_125
	LD	R26,Y+
	LD	R27,Y+
	RET

;***************************************************************************************

SUB_120:	CBI	PORTD,7		;Cигнал Xtpl1 = 0 (на базы VT3,VT4)
	NOP
	NOP
	SBI	PORTD,7		;Cигнал Xtpl1 = 1 (на базы VT3,VT4)
	RET

;***************************************************************************************

SUB_125:	LD	R24,Y+
	LD	R25,Y+
	RET

SUB_128:	LDI	R16,5
loc_129:	RCALL	SUB_32F

SUB_12A:	LDI	R16,2
	LDI	R17,0
	RCALL	SUB_CEE
	MOV	R16, R9
	RJMP	SUB_C07

SUB_12F:	ST	-Y,R27
	ST	-Y,R26
	ST	-Y,R25
	ST	-Y,R24
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_134:	RCALL	SUB_151
	RCALL	SUB_BEC
	MOV	R24, R16
	RCALL	SUB_BEC
	MOV	R25,R16
	SBI	PORTD,2		;Cигнал Reset = 1 (на базу VT5)
	CBI	PORTD,3		;Выключить +12v (на базу VT1)
	MOV	R16,R24
	RCALL	SUB_B13
	LDI	R16,0
	OUT	DDRB,R16		;Порт B на ввод
	OUT	PORTB,R16		;Cигналы-Data 7...0 = 0
	OUT	DDRC,R16		;Порт С на ввод
	OUT	PORTC,R16		;Cигналы-Pagel,Xa1,Xa0,BS1,~WR,~OE,R/B,BS2 = 0
	IN	R16,TCCR2
	ORI	R16,$10
	OUT	TCCR2,R16
	MOV	R16,R25
	RCALL	SUB_B13
	BST	R11,6
	BRTS	loc_14D
	CBI	PORTD,3		;Выключить +12v (на базу VT1)
	CBI	PORTD,2		;Cигнал Reset = 0 (на базу VT5)
	MOV	R16,R24
	RCALL	SUB_B13
loc_14D:	RCALL	SUB_DE8
	RCALL	SUB_EDD
	RJMP	SUB_125

;***************************************************************************************

SUB_150:	ST	-Y,R26
SUB_151:	ST	-Y,R25
	ST	-Y,R24
	RET

SUB_154:	LDS	R17,Buffer_1B4
	LDS	R16,Buffer_1CD
	RCALL	SUB_15D
	LDS	R16,Buffer_1BE
	RCALL	SUB_368
	RJMP	SUB_DE1

SUB_15D:	RCALL	SUB_342
	RCALL	SUB_BEC
	LDS	R17,Buffer_1B5
	RJMP	SUB_342

SUB_162:	LDS	R17,Buffer_1B4
	LDS	R16,Buffer_1D1
	RCALL	SUB_15D
	LDS	R16,Buffer_1C3
	RCALL	SUB_368
	RJMP	SUB_DE1

; =============== S U B	R O U T	I N E =======================================

SUB_16B:	RCALL	SUB_151
	RCALL	SUB_BEC
	MOV	R25,R16
	RCALL	SUB_BEC
	MOV	R24,R16
	LDS	R17,Buffer_1B4
	LDS	R16,Buffer_1C8
	RCALL	SUB_342
	RCALL	SUB_128
	TST	R24
	BREQ	loc_17C
	MOV	R16,R24
	RCALL	SUB_B13
	RCALL	SUB_189
	RJMP	loc_182
loc_17C:	RCALL	SUB_189
	MOV	R16, R25
	RCALL	SUB_186
	BRNE	loc_182
	LDI	R16,$81
	RJMP	loc_183
loc_182:	LDI	R16, 0
loc_183:	RJMP	loc_18E

; =============== S U B	R O U T	I N E =======================================

SUB_184:	RCALL	SUB_32F
SUB_185:	LDD	R16,Y+2
SUB_186:	RCALL	SUB_393
	TST	R16
	RET

SUB_189:	LDS	R17,Buffer_1B4
SUB_18B:	LDI	R16,0
	RJMP	SUB_342

SUB_18D:	LDI	R16,0
loc_18E:	RCALL	SUB_C07
	LD	R24,Y+
	LD	R25,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_192:	RCALL	SUB_150
	RCALL	SUB_1E2
	LDS	R16, Buffer_1CF
	RCALL	SUB_1D8
	RCALL	SUB_C07
	RJMP	loc_1B0
loc_199:	LDS	R16,Buffer_069
	DEC	R16
	MOV	R17,R16
	LSL	R16
	LSL	R16
	ADD	R16,R17
	RCALL	SUB_B00
	RCALL	SUB_1CE
	RCALL	SUB_342
	TST	R26
	BRNE	loc_1A7
	RCALL	SUB_1CB
	LDI	R26,1
loc_1A7:	LDS	R16,Buffer_1BC
	RCALL	SUB_368
	RCALL	SUB_C07
	LDS	R16,Buffer_1BD
	RCALL	SUB_368
	RCALL	SUB_C07
	RCALL	SUB_1B8
loc_1B0:	MOV	R16,R24
	MOV	R17,R25
	SBIW	R24,2
	OR	R16,R17
	BRNE	loc_199
	RCALL	SUB_18D
	LD	R26,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_1B8:	RCALL	SUB_1C8
	LD	R16,Z
	LDD	R17,Z+1
	LDD	R18,Z+2
	LDD	R19,Z+3
loc_1BD:	SUBI	R16,$FF		;-1
	SBCI	R17,$FF		;-1
	SBCI	R18,$FF		;-1
	SBCI	R19,$FF		;-1
	ST	Z,R16
	STD	Z+1,R17
	STD	Z+2,R18
	STD	Z+3,R19
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_1C6:	LDS	R17,Buffer_1B6
SUB_1C8:	LDI	R30,$60 
	LDI	R31,0
	RET

SUB_1CB:	RCALL	SUB_1C6
	LDD	R16,Z+1
	RJMP	SUB_342

SUB_1CE:	LDS	R17,Buffer_1B5
	RCALL	SUB_1C8
	LD	R16,Z
	RET

SUB_1D3:	MOV	R16,R24
	MOV	R17,R25
	SBIW	R24,1
	OR	R16,R17
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_1D8:	RCALL	SUB_342
	MOV	R16,R24
	MOV	R17,R25
	SUBI	R16,$FD		;-3
	SBCI	R17,$FF		;-1
	RCALL	SUB_CEE
	MOV	R16,R9
	RCALL	SUB_C07
	LDI	R16,0
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_1E2:	LDI	R26,0
	RCALL	SUB_C1C
	MOV	R24,R16
	MOV	R25,R17
	LDS	R17,Buffer_1B4
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_1E9:	RCALL	SUB_12F
	SBIW	R28,6
	LDI	R16,0
	STD	Y+1,R16
	LDI	R16,1
	STD	Y+3,R16
	RCALL	SUB_C1C
	STD	Y+4,R16
	STD	Y+5,R17
	RCALL	SUB_BEC
	ST	Y, R16
	RCALL	SUB_BEC
	STD	Y+2,R16
	LDS	R17,Buffer_1B4
	LDS	R16,Buffer_1CB
	RCALL	SUB_342
	LDD	R24,Y+4
	LDD	R25,Y+5
	LSR	R25
	ROR	R24
	LD	R16,Y
	SBRS	R16,0
	RJMP	loc_229
	ANDI	R16,$0E
	BRNE	loc_205
	RJMP	loc_246
loc_205:	LDI	R16,1
	LDI	R17,0
	LD	R20,Y
	LSR	R20
	ANDI	R20,7
	RCALL	SUB_F94
	MOV	R26,R16
	MOV	R27,R17
	LDD	R16,Y+4
	LDD	R17,Y+5
	MOV	R20,R26
	MOV	R21,R27
	RCALL	SUB_FA0
	STD	Y+3,R16
	MOV	R24,R26
	MOV	R25,R27
	LSR	R25
	ROR	R24
	RJMP	loc_246
loc_218:	RCALL	SUB_270
	LDI	R16,6
	RCALL	SUB_184
	BRNE	loc_21E
loc_21C:	LDI	R16,$81
	STD	Y+1,R16
loc_21E:	LDD	R16,Y+4
	LDD	R17,Y+5
	SUBI	R16,2
	SBCI	R17,0
	STD	Y+4,R16
	STD	Y+5,R17
	RCALL	SUB_1B8
	LDD	R16,Y+4
	LDD	R17,Y+5
	OR	R16,R17
	BREQ	loc_25A
loc_229:	RCALL	SUB_1CB
	RCALL	SUB_1CE
	RCALL	SUB_26B
	LDI	R16,5
	RCALL	SUB_184
	BRNE	loc_218
	RJMP	loc_21C
loc_230:	RCALL	SUB_25F
	RCALL	SUB_267
	RCALL	SUB_270
	LDI	R16,$11
	RCALL	SUB_32F
loc_235:	MOV	R16,R26
	MOV	R17,R27
	SBIW	R26,1
	OR	R16,R17
	BRNE	loc_230
	LD	R16,Y
	SBRS	R16,7
	RJMP	loc_246
	RCALL	SUB_1C6
	LD	R20,Z
	LDD	R21,Z+1
	SUBI	R20,1
	SBCI	R21,0
	MOV	R16,R21
	RCALL	SUB_342
	LDI	R16,5
	RCALL	SUB_32F
loc_246:	LDD	R16,Y+3
	MOV	R17,R16
	DEC	R17
	STD	Y+3,R17
	TST	R16
	BREQ	loc_253
	MOV	R26,R24
	MOV	R27,R25
	RCALL	SUB_185
	BRNE	loc_235
	LDI	R16,$81
	STD	Y+1,R16
	RJMP	loc_235
loc_253:	LD	R16,Y
	SBRS	R16,6
	RJMP	loc_25A
	RCALL	SUB_185
	BRNE	loc_25A
	LDI	R16,$81
	STD	Y+1,R16
loc_25A:	RCALL	SUB_12A
	LDD	R16,Y+1
	RCALL	SUB_C07
	ADIW	R28,6
	RJMP	loc_11C

; =============== S U B	R O U T	I N E =======================================

SUB_25F:	RCALL	SUB_1C8
	LD	R20,Z
	LDD	R21,Z+1
	LDD	R18,Z+2
	LDD	R19,Z+3
	MOV	R16,R20
	MOV	R17,R21
	RET

SUB_267:	RCALL	loc_1BD
	LDS	R17,Buffer_1B5
	MOV	R16,R20
SUB_26B:	RCALL	SUB_342
	RCALL	SUB_BEC
	LDS	R17,Buffer_1B7
	RJMP	SUB_342

SUB_270:	RCALL	SUB_BEC
	LDS	R17,Buffer_1B8
	RJMP	SUB_342

; =============== S U B	R O U T	I N E =======================================

SUB_274:	RCALL	SUB_12F
	SBIW	R28,4
	LDI	R16,0
	ST	Y, R16
	LDI	R26,1
	RCALL	SUB_C1C
	STD	Y+2,R16
	STD	Y+3,R17
	RCALL	SUB_BEC
	MOV	R27,R16
	RCALL	SUB_BEC
	STD	Y+1,R16
	MOV	R16,R27
	ANDI	R16,$E
	BREQ	loc_298
	LDI	R16,1
	LDI	R17,0
	MOV	R20,R27
	LSR	R20
	ANDI	R20,7
	RCALL	SUB_F94
	MOV	R24, R16
	MOV	R25,R17
	LDD	R16,Y+2
	LDD	R17,Y+3
	MOV	R20,R24
	MOV	R21,R25
	RCALL	SUB_FA0
	MOV	R26,R16
	STD	Y+2,R24
	STD	Y+3,R25
	RJMP	loc_298
loc_294:	BST	R27,7
	BRTC	loc_298
	LDI	R16,5
	RCALL	SUB_32F
loc_298:	MOV	R16,R26
	DEC	R26
	TST	R16
	BREQ	loc_2C2
	RCALL	SUB_2CD
	BRNE	loc_2A0
	LDI	R16,$81
	ST	Y,R16
loc_2A0:	LDS	R17,Buffer_1B4
	LDS	R16,Buffer_1CC
	RCALL	SUB_342
	LDD	R24,Y+2
	LDD	R25,Y+3
	RJMP	loc_2AA
loc_2A8:	LDI	R16,$12
	RCALL	SUB_32F
loc_2AA:	RCALL	SUB_1D3
	BREQ	loc_294
	LDS	R20,Buffer_1B6
	RCALL	SUB_1C8
	LDD	R16,Z+1
	MOV	R17,R20
	RCALL	SUB_342
	RCALL	SUB_1C8
	LD	R20,Z
	LDD	R17,Z+1
	LDD	R18,Z+2
	LDD	R19,Z+3
	MOV	R16,R20
	RCALL	SUB_267
	BST	R27,0
	BRTS	loc_2A8
	LDI	R16,5
	RCALL	SUB_32F
	RCALL	SUB_2CD
	BRNE	loc_2AA
	LDI	R16,$81
	ST	Y,R16
	RJMP	loc_2AA
loc_2C2:	BST	R27,6
	BRTC	loc_2C8
	RCALL	SUB_2CD
	BRNE	loc_2C8
	LDI	R16,$81
	ST	Y,R16
loc_2C8:	RCALL	SUB_12A
	LD	R16,Y
	RCALL	SUB_C07
	ADIW	R28,4
	RJMP	loc_11C

; =============== S U B	R O U T	I N E =======================================

SUB_2CD:	LDD	R16,Y+1
	RCALL	SUB_393
	TST	R16
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_2D1:	RCALL	SUB_150
	RCALL	SUB_1E2
	LDS	R16,Buffer_1D0
	RCALL	SUB_1D8
	RJMP	loc_2E4
loc_2D7:	RCALL	SUB_25F
	RCALL	loc_1BD
	LDS	R17,Buffer_1B5
	MOV	R16,R20
	RCALL	SUB_342
	TST	R26
	BRNE	loc_2E1
	RCALL	SUB_1CB
	LDI	R26,1
loc_2E1:	LDS	R16,Buffer_1C2
	RCALL	SUB_368
loc_2E4:	RCALL	SUB_C07
	RCALL	SUB_1D3
	BRNE	loc_2D7
	RCALL	SUB_18D
	LD	R26,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_2EA:	ST	-Y,R24
	RCALL	SUB_BEC
	TST	R16
	BRNE	loc_2F0
	LDI	R24,5
	RJMP	loc_2F5
loc_2F0:	CPI	R16,1
	BRNE	loc_2F4
	LDI	R24,6
	RJMP	loc_2F5
loc_2F4:	LDI	R24,7
loc_2F5:	LDS	R17,Buffer_1B4
	LDS	R16,Buffer_1C9
	RCALL	SUB_26B
	MOV	R16,R24
	RCALL	loc_129
	RCALL	SUB_BEC
	RCALL	SUB_186
	BRNE	loc_301
	LDI	R16,$81
	RJMP	loc_302
loc_301:	LDI	R16,0
loc_302:	RCALL	SUB_C07
	LD	R24,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_305:	RCALL	SUB_151
	RCALL	SUB_BEC
	MOV	R24,R16
	LDS	R17,Buffer_1B4
	LDS	R16,Buffer_1CE
	RCALL	SUB_342
	LDI	R25,0
	ADIW	R24,$B
	MOV	R30,R24
	MOV	R31,R25
	SUBI	R30,$4C
	SBCI	R31,$FE		;-2
	LD	R16,Z
	RCALL	SUB_368
	RCALL	SUB_DE1
	RJMP	SUB_125

; =============== S U B	R O U T	I N E =======================================

SUB_317:	RCALL	SUB_BEC
	LDS	R17,Buffer_1B4
	LDS	R16,Buffer_1CA
	RCALL	SUB_26B
	RCALL	SUB_128
	RCALL	SUB_BEC
	RCALL	SUB_186
	BRNE	loc_323
	LDI	R16,$81
	RJMP	SUB_C07
loc_323:	LDI	R16,0
	RJMP	SUB_C07

; =============== S U B	R O U T	I N E =======================================

SUB_325:	RCALL	SUB_BEC
	LDS	R17,Buffer_1B4
	LDS	R16,Buffer_1D2
	RCALL	SUB_342
	LDS	R16,Buffer_1C4
	RCALL	SUB_368
	RJMP	SUB_DE1

; =============== S U B	R O U T	I N E =======================================

SUB_32F:	ST	-Y,R24
	MOV	R24,R16
	MOV	R30,R16
	LDI	R31,0
	SUBI	R30,$4C
	SBCI	R31,$FE		;-2
	LD	R17,Z
	RCALL	SUB_18B
	MOV	R30,R24
	LDI	R31,0
	SUBI	R30,$4C
	SBCI	R31,$FE		;-2
	LD	R16,Z
	LDS	R17,Buffer_1C7
	OR	R17,R16
	RCALL	SUB_18B
	LD	R24,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_342:	LDI	R19,8
	LDS	R18,Buffer_069
	RJMP	loc_347
loc_346:	RCALL	SUB_365
loc_347:	TST	R18
	BRNE	loc_346
loc_349:	BST	R17,7
	BRTC	loc_34D
	SBI	PORTB,1
	RJMP	loc_34E
loc_34D:	CBI	PORTB,1
loc_34E:	BST	R16,7
	BRTC	loc_352
	SBI	PORTB,0
	RJMP	loc_353
loc_352:	CBI	PORTB,0
loc_353:	LSL	R16
	LSL	R17
	LDS	R18,Buffer_069
	RJMP	loc_359
loc_358:	RCALL	SUB_365
loc_359:	TST	R18
	BRNE	loc_358
	DEC	R19
	BRNE	loc_349
	LDS	R18,Buffer_069
	LSL	R18
	RJMP	loc_362
loc_361:	RCALL	SUB_365
loc_362:	TST	R18
	BRNE	loc_361
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_365:	RCALL	SUB_120
	DEC	R18
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_368:	RCALL	SUB_151
	MOV	R25,R16
	LDI	R24,8
	CBI	PORTB,0
	MOV	R17,R16
	RCALL	SUB_18B
	LDS	R19,Buffer_1C7
	OR	R19,R25
	LDI	R16,0
	SBIC	PINB,2
	LDI	R16,1
	LDS	R18,Buffer_069
	RJMP	loc_378
loc_377:	RCALL	SUB_365
loc_378:	TST	R18
	BRNE	loc_377
loc_37A:	BST	R19,7
	BRTC	loc_37E
	SBI	PORTB,1
	RJMP	loc_37F
loc_37E:	CBI	PORTB,1
loc_37F:	LSL	R16
	SBIC	PINB,2
	INC	R16
	LSL	R19
	LDS	R18,Buffer_069
	RJMP	loc_387
loc_386:	RCALL	SUB_365
loc_387:	TST	R18
	BRNE	loc_386
	DEC	R24
	BRNE	loc_37A
	LDS	R18,Buffer_069
	LSL	R18
	RJMP	loc_390
loc_38F:	RCALL	SUB_365
loc_390:	TST	R18
	BRNE	loc_38F
	RJMP	SUB_125

; =============== S U B	R O U T	I N E =======================================

SUB_393:	RCALL	SUB_151
	MOV	R25,R16
	MOV	R20,R16
	LDI	R16,$A
	RCALL	SUB_F7C
	MOV	R24,R16
	TST	R25
	BRNE	loc_3A0
loc_39B:	LDI	R16,1
	RJMP	loc_3A7
loc_39D:	LDI	R16,$64
	RCALL	SUB_AF1
	DEC	R24
loc_3A0:	SBIC	PINB,2
	RJMP	loc_3A4
	TST	R24
	BRNE	loc_39D
loc_3A4:	SBIC	PINB,2
	RJMP	loc_39B
	LDI	R16,0
loc_3A7:	RJMP	SUB_125

; =============== S U B	R O U T	I N E =======================================

SUB_3A8:	LDS	R17,Buffer_06A
	TST	R17
	BREQ	loc_3B3
	IN	R17,SPSR
	IN	R17,SPDR
	OUT	SPDR,R16
loc_3AF:	SBIS	SPSR,7
	RJMP	loc_3AF
	IN	R16,SPDR
	RET
loc_3B3:	LDI	R18,0
	LDI	R17,8
loc_3B5:	LSL	R18
	BST	R16,7
	BRTC	loc_3BA
	SBI	PORTB,5
	RJMP	loc_3BB
loc_3BA:	CBI	PORTB,5
loc_3BB:	LSL	R16
	LDS	R20,Buffer_1D9
	RJMP	loc_3C3
loc_3BF:	RJMP	loc_3C0
loc_3C0:	RJMP	loc_3C1
loc_3C1:	RJMP	loc_3C2
loc_3C2:	NOP
loc_3C3:	MOV	R19,R20
	DEC	R20
	TST	R19
	BRNE	loc_3BF
	SBIC	PINB,6
	INC	R18
	SBI	PORTB,7
	LDS	R20,Buffer_1D9
	RJMP	loc_3D1
loc_3CD:	RJMP	loc_3CE
loc_3CE:	RJMP	loc_3CF
loc_3CF:	RJMP	loc_3D0
loc_3D0:	NOP
loc_3D1:	MOV	R19,R20
	DEC	R20
	TST	R19
	BRNE	loc_3CD
	CBI	PORTB,7
	DEC	R17
	BRNE	loc_3B5
	MOV	R16,R18
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_3DA:	TST	R16
	BREQ	loc_3E2
	SBI	PORTB,4
	SBI	DDRB,4
	IN	R16,SPCR
	ANDI	R16,3
	ORI	R16,$50
	RJMP	loc_3E3
loc_3E2:	LDI	R16,0
loc_3E3:	OUT	SPCR,R16
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_3E5:	LDS	R17,Buffer_1D9
	CPI	R17,4
	BRCC	loc_3EF
	IN	R16,SPCR
	ANDI	R16,$FC
	OR	R16,R17
	OUT	SPCR,R16
	LDI	R16,1
	RJMP	loc_3F0
loc_3EF:	LDI	R16,0
loc_3F0:	STS	Buffer_06A,R16
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_3F3:	RCALL	SUB_48A
	SBIW	R28,3
	RCALL	SUB_ED6
loc_3F6:	TST	R13
	BRNE	loc_3F6
	RCALL	SUB_BEC
	RCALL	SUB_487
	RCALL	SUB_484
	RCALL	SUB_BEC
	MOV	R27,R16
	RCALL	SUB_BEC
	MOV	R24,R16
	RCALL	SUB_BEC
	STD	Y+1,R16
	RCALL	SUB_BEC
	STD	Y+2,R16
	RCALL	SUB_47D
	MOV	R7,R16
	LDI	R16,0
	STS	Buffer_06A,R16
	RCALL	SUB_3DA
	LDS	R16,Buffer_1D9
	ST	Y, R16
	CPI	R16,3
	BRNE	loc_411
	LDI	R16,5
	STS	Buffer_1D9,R16
loc_411:	LDI	R16,1
	RCALL	SUB_A6C
	MOV	R16,R25
	RCALL	SUB_AF1
	CBI	PORTB,7
	CBI	PORTB,5
	IN	R16,DDRB
	ORI	R16,$A0
	OUT	DDRB,R16
	MOV	R16,R25
	RCALL	SUB_AF1
	LDI	R16,0
	RCALL	SUB_A6C
	MOV	R16,R25
	RCALL	SUB_AF1
	LDI	R16,1
	RCALL	SUB_A6C
	MOV	R16,R26
	RCALL	SUB_B13
	RJMP	loc_42B
loc_425:	DEC	R27
	RCALL	SUB_474
	SBI	PORTB,7
	RCALL	SUB_474
	CBI	PORTB,7
	RCALL	SUB_474
loc_42B:	TST	R27
	BREQ	loc_451
	MOV	R16,R4
	RCALL	SUB_469
	MOV	R16,R5
	RCALL	SUB_469
	MOV	R16,R6
	RCALL	SUB_3A8
	MOV	R25,R16
	RCALL	SUB_46A
	MOV	R16,R7
	RCALL	SUB_3A8
	MOV	R26,R16
	RCALL	SUB_46A
	LDD	R16,Y+2
	CPI	R16,3
	BRNE	loc_43E
	MOV	R26,R25
	RJMP	loc_441
loc_43E:	TST	R16
	BRNE	loc_441
	LDD	R26,Y+1
loc_441:	LDD	R16,Y+1
	CP	R26,R16
	BRNE	loc_425
	CLR	R13
	LD	R16,Y
	STS	Buffer_1D9,R16
	RCALL	SUB_3E5
	LDS	R16,Buffer_06A
	RCALL	SUB_3DA
	LDI	R16, 0
	STS	Buffer_06B,R16
	RCALL	SUB_DE8
	RJMP	loc_45C
loc_451:	CLR	R13
	RCALL	SUB_464
	LDI	R16,$C0
	RCALL	SUB_C07
	LD	R16,Y
	STS	Buffer_1D9,R16
	RCALL	SUB_477
	BRTS	loc_45B
	RCALL	SUB_A6C
loc_45B:	RCALL	SUB_EDD
loc_45C:	ADIW	R28,3
	RCALL	SUB_460
	LD	R27,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_460:	LD	R24,Y+
	LD	R25,Y+
	LD	R26,Y+
	RET

SUB_464:	LDI	R16,2
	LDI	R17,0
	RCALL	SUB_CEE
	MOV	R16,R9
	RJMP	SUB_C07

SUB_469:	RCALL	SUB_3A8
SUB_46A:	MOV	R16,R24
	RJMP	SUB_B13
SUB_46C:	MOV	R16,R4
SUB_46D:	RCALL	SUB_3A8
	LDS	R16,Buffer_061
	RCALL	SUB_3A8
	LDS	R16,Buffer_060
	RJMP	SUB_3A8

SUB_474:	LDS	R16,Buffer_1D9
	RJMP	SUB_AF1

SUB_477:	LDI	R16,0
	RCALL	SUB_3DA
	LDI	R16,0
	OUT	DDRB,R16
	BST	R11,6
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_47D:	RCALL	SUB_BEC
	MOV	R4, R16
	RCALL	SUB_BEC
	MOV	R5, R16
	RCALL	SUB_BEC
	MOV	R6, R16
	RJMP	SUB_BEC

SUB_484:	RCALL	SUB_BEC
	MOV	R26,R16
	RET

SUB_487:	RCALL	SUB_BEC
	MOV	R25,R16
	RET

SUB_48A:	ST	-Y,R27
	ST	-Y,R26
	ST	-Y,R25
	ST	-Y,R24
	RET

SUB_48F:	TST	R13
	BRNE	SUB_48F
	RCALL	SUB_BEC
	RCALL	SUB_B13
	RCALL	SUB_477
	BRTS	loc_498
	RCALL	SUB_A6C
	RCALL	SUB_BEC
	RCALL	SUB_B13
loc_498:	RCALL	SUB_DE8
	RJMP	SUB_EDD

; =============== S U B	R O U T	I N E =======================================

SUB_49A:	RCALL	SUB_4C5
	RCALL	SUB_BEC
	MOV	R24, R16
	RCALL	SUB_487
loc_49E:	TST	R13
	BRNE	loc_49E
	RCALL	SUB_4C0
	BREQ	loc_4A3
	RCALL	SUB_4C8
loc_4A3:	RCALL	SUB_BEC
	RCALL	SUB_3A8
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	TST	R25
	BREQ	loc_4B4
	MOV	R16,R24
	RCALL	SUB_4BD
	BREQ	loc_4B5
	RCALL	SUB_464
	LDI	R16,$80
	RCALL	SUB_C07
	RJMP	loc_4B6
loc_4B4:	MOV	R13,R24
loc_4B5:	RCALL	SUB_DE8
loc_4B6:	LD	R24,Y+
	LD	R25,Y+
	RET
loc_4B9:	RCALL	SUB_460
	LD	R27,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_4BC:	MOV	R16,R26
SUB_4BD:	RCALL	SUB_699
	TST	R16
	RET

SUB_4C0:	LDS	R16,Buffer_06B
	TST	R16
	RET

SUB_4C4:	ST	-Y,R26
SUB_4C5:	ST	-Y,R25
	ST	-Y,R24
	RET

SUB_4C8:	LDI	R16,0
	STS	Buffer_06B,R16
	LDI	R16,$64
	RJMP	SUB_699

; =============== S U B	R O U T	I N E =======================================

SUB_4CD:	RCALL	SUB_48A
	SBIW	R28,7
	RCALL	SUB_588
	STD	Y+1,R16
	LDI	R16,0
	ST	Y, R16
	LDD	R16,Y+1
	STD	Y+2,R16
	LDI	R16,0
	STD	Y+4,R16
	RCALL	SUB_C1C
	STD	Y+5,R16
	STD	Y+6,R17
	RCALL	SUB_47D
	MOV	R7,R16
	RCALL	SUB_487
	RCALL	SUB_484
	RCALL	SUB_BEC
loc_4DF:	TST	R13
	BRNE	loc_4DF
	RCALL	SUB_4C0
	BREQ	loc_4EB
	LDI	R16,0
	STS	Buffer_06B,R16
	MOV	R16,R5
	RCALL	SUB_4BD
	BREQ	loc_4EB
	LDI	R16,$81
	ST	Y,R16
loc_4EB:	LDI	R30,$60
	LDI	R31,0
	LDD	R16,Z+3
	SBRC	R16,7
	RCALL	SUB_570
loc_4F0:	RCALL	SUB_BEC
	MOV	R24, R16
	RCALL	SUB_BEC
	MOV	R27, R16
	BST	R4,0
	CPI	R24,$FF
	BRTC	loc_4FB
	BRNE	loc_4FC
	CPI	R16,$FF
	BRNE	loc_4FC
	RJMP	loc_50F
loc_4FB:	BREQ	loc_50F
loc_4FC:	MOV	R16, R6
	RCALL	SUB_58F
	MOV	R16,R24
	RCALL	SUB_3A8
	BST	R4,1
	BRTC	loc_504
	MOV	R16,R5
	RCALL	SUB_B2C
loc_504:	BST	R4,2
	BRTC	loc_50F
	MOV	R21,R5
	MOV	R20,R26
	MOV	R19,R24
	RCALL	SUB_56B
	MOV	R16,R25
	RCALL	SUB_63C
	TST	R16
	BREQ	loc_50F
	RCALL	SUB_590
loc_50F:	BST	R4,0
	BRTC	loc_515
	CPI	R24,$FF
	BRNE	loc_518
	CPI	R27,$FF
	BRNE	loc_518
loc_515:	BRTS	loc_534
	CPI	R27,$FF
	BREQ	loc_534
loc_518:	MOV	R16,R6
	RCALL	SUB_58E
	MOV	R16,R27
	RCALL	SUB_3A8
	BST	R4,0
	BRTC	loc_524
	CP	R24,R26
	BREQ	loc_524
	LDS	R16,Buffer_060
	STD	Y+2,R16
	STD	Y+4,R24
loc_524:	BST	R4,1
	BRTC	loc_528
	MOV	R16,R5
	RCALL	SUB_B2C
loc_528:	BST	R4,2
	BRTC	loc_535
	MOV	R21,R5
	MOV	R20,R26
	RCALL	SUB_56A
	MOV	R16,R25
	ORI	R16,8
	RCALL	SUB_63C
	TST	R16
	BREQ	loc_535
	RCALL	SUB_590
	RJMP	loc_535
loc_534:	NOP
loc_535:	LDD	R16,Y+5
	LDD	R17,Y+6
	SUBI	R16,2
	SBCI	R17,0
	STD	Y+5,R16
	STD	Y+6,R17
	RCALL	SUB_579
	LDD	R16,Y+5
	LDD	R17,Y+6
	OR	R16,R17
	BREQ	loc_541
	RJMP	loc_4F0
loc_541:	BST	R4,7
	BRTC	loc_565
	MOV	R16,R7
	RCALL	SUB_3A8
	LDD	R16,Y+3
	RCALL	SUB_3A8
	LDD	R16,Y+1
	RCALL	SUB_3A8
	LDI	R16,0
	RCALL	SUB_3A8
	BST	R4,4
	BRTC	loc_54E
	MOV	R13,R5
loc_54E:	BST	R4,5
	BRTC	loc_560
	LDD	R16,Y+2
	LDD	R17,Y+1
	CP	R16,R17
	BREQ	loc_55F
	MOV	R21,R5
	MOV	R20,R26
	LDD	R19,Y+4
	MOV	R18,R16
	LDD	R17,Y+3
	MOV	R16,R25
	RCALL	SUB_63C
	TST	R16
	BREQ	loc_560
	RCALL	SUB_590
	RJMP	loc_560
loc_55F:	MOV	R13, R5
loc_560:	BST	R4,6
	BRTC	loc_565
	LDI	R16,1
	STS	Buffer_06B, R16
loc_565:	RCALL	SUB_464
	LD	R16,Y
	RCALL	SUB_C07
	ADIW	R28,7
	RJMP	loc_4B9

; =============== S U B	R O U T	I N E =======================================

SUB_56A:	MOV	R19,R27
SUB_56B:	LDS	R18,Buffer_060
	LDS	R17,Buffer_061
	RET

SUB_570:	LDI	R16,$4D
	RCALL	SUB_3A8
	LDI	R16,0
	RCALL	SUB_3A8
	LDS	R16,Buffer_062
	RCALL	SUB_3A8
	LDI	R16,0
	RJMP	SUB_3A8

; =============== S U B	R O U T	I N E =======================================

SUB_579:	LDI	R30,$60 
	LDI	R31,0
	LD	R16,Z
	LDD	R17,Z+1
	LDD	R18,Z+2
	LDD	R19,Z+3
	SUBI	R16,$FF		;-1
	SBCI	R17,$FF		;-1
	SBCI	R18,$FF		;-1
	SBCI	R19,$FF		;-1
	ST	Z, R16
	STD	Z+1,R17
	STD	Z+2,R18
	STD	Z+3,R19
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_588:	LDS	R16,Buffer_061
	STD	Y+3,R16
	LDS	R16,Buffer_060
	RET

SUB_58E:	ORI	R16,8
SUB_58F:	RJMP	SUB_46D

SUB_590:	LDI	R16,$80
	ST	Y,R16
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_593:	RCALL	SUB_4C4
	MOV	R26, R16
	RCALL	SUB_5C0
	MOV	R4, R16
loc_597:	TST	R13
	BRNE	loc_597
	RCALL	SUB_4C0
	BREQ	loc_59C
	RCALL	SUB_4C8
loc_59C:	LDI	R30,$60
	LDI	R31,0
	LDD	R16,Z+3
	SBRC	R16,7
	RCALL	SUB_570
	MOV	R16,R24
	MOV	R17,R25
	RCALL	SUB_5C4
	RCALL	SUB_C07
	RJMP	loc_5BC
loc_5A6:	RCALL	SUB_46C
	LDI	R16,0
	RCALL	SUB_3A8
	RCALL	SUB_C07
	SBIW	R24,1
	TST	R26
	BREQ	loc_5B3
	MOV	R16,R4
	RCALL	SUB_58E
	LDI	R16,0
	RCALL	SUB_3A8
	RCALL	SUB_C07
	SBIW	R24,1
loc_5B3:	RCALL	SUB_579
	SBRS	R19,7
	RJMP	loc_5BC
	TST	R17
	BRNE	loc_5BC
	LD	R16,Z
	TST	R16
	BRNE	loc_5BC
	RCALL	SUB_570
loc_5BC:	MOV	R16,R24
	OR	R16,R25
	BRNE	loc_5A6
	RJMP	loc_5CB

; =============== S U B	R O U T	I N E =======================================

SUB_5C0:	RCALL	SUB_C1C
	MOV	R24,R16
	MOV	R25,R17
	RJMP	SUB_BEC

SUB_5C4:	SUBI	R16,$FD		;-3
	SBCI	R17,$FF		;-1
loc_5C6:	RCALL	SUB_CEE
	MOV	R16,R9
loc_5C8:	RCALL	SUB_C07
	LDI	R16,0
	RET
loc_5CB:	LDI	R16,0
loc_5CC:	RCALL	SUB_C07
	RJMP	SUB_460

; =============== S U B	R O U T	I N E =======================================

SUB_5CE:	RCALL	SUB_48A
	SBIW	R28,5
	RCALL	SUB_588
	STD	Y+4,R16
	LDI	R16,0
	ST	Y,R16
	RCALL	SUB_5C0
	MOV	R7,R16
	RCALL	SUB_484
	RCALL	SUB_47D
	STD	Y+1,R16
	RCALL	SUB_BEC
	STD	Y+2,R16
loc_5DB:	TST	R13
	BRNE	loc_5DB
	RCALL	SUB_4C0
	BREQ	loc_600
	LDI	R16,0
	STS	Buffer_06B,R16
	RCALL	SUB_4BC
	BREQ	loc_600
	RCALL	SUB_590
	RJMP	loc_600
loc_5E6:	RCALL	SUB_BEC
	MOV	R27,R16
	RCALL	SUB_46C
	MOV	R16,R27
	RCALL	SUB_3A8
	BST	R7,1
	BRTC	loc_5EF
	MOV	R16,R26
	RCALL	SUB_B2C
loc_5EF:	BST	R7,2
	BRTC	loc_5FA
	MOV	R22,R26
	LDD	R21,Y+2
	LDD	R20,Y+1
	RCALL	SUB_56A
	MOV	R16,R6
	RCALL	SUB_667
	TST	R16
	BREQ	loc_5FA
	RCALL	SUB_590
loc_5FA:	BST	R7,3
	BRTC	loc_5FF
	RCALL	SUB_4BC
	BREQ	loc_5FF
	RCALL	SUB_590
loc_5FF:	RCALL	SUB_579
loc_600:	MOV	R16,R24
	MOV	R17,R25
	SBIW	R24,1
	OR	R16,R17
	BRNE	loc_5E6
	BST	R7,7
	BRTC	loc_618
	MOV	R16,R5
	RCALL	SUB_3A8
	LDD	R16,Y+3
	RCALL	SUB_3A8
	LDD	R16,Y+4
	RCALL	SUB_3A8
	LDI	R16,0
	RCALL	SUB_3A8
	BST	R7,4
	BRTC	loc_613
	MOV	R16,R26
	RCALL	SUB_B2C
loc_613:	BST	R7,6
	BRTC	loc_618
	LDI	R16,1
	STS	Buffer_06B,R16
loc_618:	RCALL	SUB_464
	LD	R16,Y
	RCALL	SUB_C07
	ADIW	R28,5
	RJMP	loc_4B9

; =============== S U B	R O U T	I N E =======================================

SUB_61D:	RCALL	SUB_4C4
	RCALL	SUB_487
	RCALL	SUB_484
	RCALL	SUB_BEC
	MOV	R24,R16
	MOV	R16,R26
	LDI	R17,0
	RCALL	SUB_5C4
	RCALL	SUB_C07
loc_626:	TST	R13
	BRNE	loc_626
loc_628:	TST	R25
	BRNE	loc_62E
	TST	R26
	LDI	R16,0
	BRNE	loc_632
	RJMP	loc_5CC
loc_62E:	RCALL	SUB_BEC
	RCALL	SUB_3A8
	DEC	R25
	RJMP	loc_633
loc_632:	RCALL	SUB_3A8
loc_633:	TST	R24
	BREQ	loc_637
	DEC	R24
	RJMP	loc_628
loc_637:	TST	R26
	BREQ	loc_628
	RCALL	SUB_C07
	DEC	R26
	RJMP	loc_628

; =============== S U B	R O U T	I N E =======================================

SUB_63C:	RCALL	SUB_48A
	SBIW	R28,2
	ST	Y, R16
	STD	Y+1,R17
	MOV	R27,R18
	MOV	R24,R19
	MOV	R25,R20
	MOV	R16,R21
	CP	R24,R20
	BRNE	loc_649
	RCALL	SUB_B2C
	LDI	R16,0
	RJMP	loc_661
loc_649:	MOV	R13, R21
	LDI	R26,1
loc_64B:	RCALL	SUB_663
	MOV	R16,R27
	RCALL	SUB_3A8
	LDI	R16,0
	RCALL	SUB_3A8
	CPI	R26,1
	BRNE	loc_656
	CP	R16, R25
	BRNE	loc_658
	LDI	R26,2
	RJMP	loc_658
loc_656:	CPI	R26,2
	BRNE	loc_65B
loc_658:	CP	R16,R24
	BRNE	loc_65B
	LDI	R26,0
loc_65B:	TST	R13
	BREQ	loc_65F
	TST	R26
	BRNE	loc_64B
loc_65F:	CLR	R13
	MOV	R16,R26
loc_661:	ADIW	R28,2
	RJMP	loc_4B9

; =============== S U B	R O U T	I N E =======================================

SUB_663:	LD	R16, Y
	RCALL	SUB_3A8
	LDD	R16,Y+1
	RJMP	SUB_3A8

; =============== S U B	R O U T	I N E =======================================

SUB_667:	RCALL	SUB_48A
	SBIW	R28,3
	ST	Y, R16
	STD	Y+1,R17
	STD	Y+2,R18
	MOV	R24,R19
	MOV	R27,R20
	MOV	R25,R21
	MOV	R16,R22
	CP	R24,R20
	BREQ	loc_674
	CP	R24,R21
	BRNE	loc_677
loc_674:	RCALL	SUB_B2C
	LDI	R16,0
	RJMP	loc_698
loc_677:	MOV	R13,R22
	CP	R27,R21
	BRNE	loc_67C
	LDI	R26,2
	RJMP	loc_67D
loc_67C:	LDI	R26,1
loc_67D:	RCALL	SUB_663
	LDD	R16,Y+2
	RCALL	SUB_3A8
	LDI	R16,0
	RCALL	SUB_3A8
	CPI	R26,1
	BRNE	loc_68B
	CP	R16,R27
	BRNE	loc_687
	LDI	R26, 2
loc_687:	CP	R16,R25
	BRNE	loc_68F
	LDI	R26,3
	RJMP	loc_68F
loc_68B:	CPI	R26,2
	BREQ	loc_687
	CPI	R26,3
	BRNE	loc_692
loc_68F:	CP	R16,R24
	BRNE	loc_692
	LDI	R26,0
loc_692:	TST	R13
	BREQ	loc_696
	TST	R26
	BRNE	loc_67D
loc_696:	CLR	R13
	MOV	R16,R26
loc_698:	RJMP	loc_45C

; =============== S U B	R O U T	I N E =======================================

SUB_699:	MOV	R13,R16
loc_69A:	LDI	R16,$F0
	RCALL	SUB_3A8
	LDI	R16,0
	RCALL	SUB_3A8
	LDI	R16,0
	RCALL	SUB_3A8
	LDI	R16,0
	RCALL	SUB_3A8
	BST	R16,0
	BRTC	loc_6A6
	TST	R13
	BRNE	loc_69A
loc_6A6:	CLR	R13
	MOV	R17,R16
	ANDI	R17,1
	MOV	R16,R17
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_6AB:	TST	R13
	BRNE	SUB_6AB
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	LDI	R16,3
	LDI	R17,0
	RCALL	loc_5C6
	RCALL	loc_5C8
	RJMP	SUB_C07

; =============== S U B	R O U T	I N E =======================================

SUB_6BA:	RCALL	SUB_4C4
	RCALL	SUB_484
loc_6BC:	TST	R13
	BRNE	loc_6BC
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	MOV	R25, R16
	RCALL	SUB_BEC
	RCALL	SUB_3A8
	MOV	R24,R16
	LDI	R16,4
	LDI	R17,0
	RCALL	loc_5C6
	RCALL	SUB_C07
	CPI	R26,3
	BRNE	loc_6D0
	MOV	R16,R25
	RJMP	loc_6D1
loc_6D0:	MOV	R16,R24
loc_6D1:	RCALL	SUB_C07
	RJMP	loc_5CB

; =============== S U B	R O U T	I N E =======================================

SUB_6D3:	LDS	R17,Buffer_1BC
	OUT	PORTC,R17
	RJMP	loc_6DC
loc_6D7:	RCALL	SUB_6D3
	LDS	R16,Buffer_1B8
loc_6DA:	OUT	PORTC,R16
	RCALL	SUB_BEC
loc_6DC:	OUT	PORTB,R16

;***************************************************************************************

SUB_6DD:	CBI	PORTD,7		;Cигнал Xtpl1 = 0 (на базы VT3,VT4)
	NOP
	NOP
	SBI	PORTD,7		;Cигнал Xtpl1 = 1 (на базы VT3,VT4)
	RET

;***************************************************************************************

SUB_6E2:	RCALL	SUB_74E
	SBIW	R28,3
	RCALL	SUB_BEC
	MOV	R27,R16
	RCALL	SUB_BEC
	STD	Y+2,R16
	RCALL	SUB_BEC
	MOV	R25,R16
	RCALL	SUB_BEC
	MOV	R26,R16
	RCALL	SUB_BEC
	ST	Y,R16
	RCALL	SUB_BEC
	STD	Y+1,R16
	RCALL	SUB_BEC
	MOV	R24, R16
	LDI	R16,0
	OUT	SPCR,R16
	LDS	R16,Buffer_1D5	;Результат АЦП преобразований
	CPI	R16,$2D
	BRCS	loc_6FC
	LDS	R16,Buffer_1D5	;Результат АЦП преобразований
	CPI	R16,$38
	BRCS	loc_700
loc_6FC:	RCALL	SUB_745
	LDI	R16,$C0
	RCALL	SUB_C07
	RJMP	loc_730
loc_700:	IN	R16,TCCR2
	ANDI	R16,$EF
	OUT	TCCR2,R16
	SBI	PORTD,7
	SBI	PORTD,2
	CBI	PORTD,3
	MOV	R16,R27
	RCALL	SUB_AF1
	TST	R26
	BRNE	loc_710
	RJMP	loc_70C
loc_70B:	RCALL	SUB_73A
loc_70C:	MOV	R16,R25
	DEC	R25
	TST	R16
	BRNE	loc_70B
loc_710:	LDS	R16,Buffer_1CD
	OUT	DDRC,R16
	LDS	R16,Buffer_1CE
	OUT	PORTC,R16
	SER	R16
	OUT	DDRB,R16		;Порт В на вывод
	LDI	R16,0
	OUT	PORTB,R16		;Cигналы-Data7...0 = 0
	CLI
	TST	R26
	BREQ	loc_723
	MOV	R19,R25
	MOV	R18,R24
	LDD	R17,Y+1
	LD	R16,Y
	RCALL	SUB_98C
	RJMP	loc_725
loc_723:	MOV	R16,R27
	RCALL	SUB_AF1
loc_725:	SBI	PORTD,3
	CBI	PORTD,2
	MOV	R16,R27
	RCALL	SUB_AF1
	LDD	R16,Y+2
	RCALL	SUB_AF1
	LDI	R16,$64
	RCALL	SUB_B13
	SEI
	RCALL	SUB_DE8
	RCALL	SUB_ED6
loc_730:	ADIW	R28,3
loc_731:	RCALL	SUB_736
	LD	R26,Y+
	LD	R27,Y+
	RET
loc_735:	RCALL	SUB_C07

; =============== S U B	R O U T	I N E =======================================

SUB_736:	LD	R24,Y+
	LD	R25,Y+
	RET

SUB_739:	RCALL	SUB_73B
SUB_73A:	RJMP	SUB_6DD

SUB_73B:	LDS	R16,Buffer_1B5
	OUT	PORTC,R16
	LDI	R30,$60
	LDI	R31,0
	LDD	R17,Z+1
	OUT	PORTB,R17
	RET

SUB_743:	RCALL	SUB_74A
	OUT	PORTC,R16

SUB_745:	LDI	R16,2
	LDI	R17,0
	RCALL	SUB_CEE
	MOV	R16,R9
	RJMP	SUB_C07

SUB_74A:	RCALL	SUB_B13
	LDS	R16,Buffer_1C0
	RET

SUB_74E:	ST	-Y,R27
	ST	-Y,R26
	ST	-Y,R25
	ST	-Y,R24
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_753:	RCALL	SUB_776
	RCALL	SUB_BEC
	MOV	R24,R16
	RCALL	SUB_BEC
	MOV	R25,R16
	SBI	PORTD,2		;Cигнал Reset = 1 (на базу VT5)
	CBI	PORTD,3		;Выключить +12v (на базу VT1)
	MOV	R16,R24
	RCALL	SUB_B13
	LDI	R16,0
	OUT	DDRB,R16		;Порт В на ввод
	OUT	PORTB,R16		;Cигналы-Data7...0 = 0
	OUT	DDRC,R16		;Порт С на ввод
	OUT	PORTC,R16		;Cигналы-Pagel,Xa1,Xa0,BS1,~WR,~OE,R/B,BS2 = 0
	IN	R16,TCCR2
	ORI	R16,$10
	OUT	TCCR2,R16
	MOV	R16,R25
	RCALL	SUB_B13
	BST	R11,6
	BRTS	loc_76C
	CBI	PORTD,3		;Выключить +12v (на базу VT1)
	CBI	PORTD,2		;Cигнал Reset = 0 (на базу VT5)
	MOV	R16,R24
	RCALL	SUB_B13
loc_76C:	LDI	R16,$0A
	RCALL	SUB_B13
	RCALL	SUB_DE8
	RCALL	SUB_EDD
	RJMP	SUB_736

; =============== S U B	R O U T	I N E =======================================

SUB_771:	LDI	R16,0
	OUT	DDRB,R16
	SER	R16
	OUT	PORTB,R16
	RET

SUB_776:	ST	-Y,R25
	ST	-Y,R24
	RET

SUB_779:	RJMP	SUB_771

SUB_77A:	RCALL	SUB_780
	OUT	PORTC,R16
	RCALL	SUB_BEC
	OUT	PORTB,R16
	RCALL	SUB_786
	RJMP	SUB_DE1

SUB_780:	LDI	R16,8
	RCALL	SUB_6D3
	LDS	R16,Buffer_1B4
	RET

SUB_785:	RCALL	SUB_791
SUB_786:	RCALL	SUB_6DD
	RCALL	SUB_771
	RCALL	SUB_7A0
	LDS	R17,Buffer_1C0
loc_78B:	OUT	PORTC,R17
	SER	R17
	OUT	DDRB,R17
	LDI	R17,0
	OUT	PORTB,R17
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_791:	LD	R16,Z
	OUT	PORTB,R16
	LD	R16,Z
	LDD	R17,Z+1
	LDD	R18,Z+2
	LDD	R19,Z+3
	SUBI	R16,$FF		;-1
	SBCI	R17,$FF		;-1
	SBCI	R18,$FF		;-1
	SBCI	R19,$FF		;-1
	ST	Z,R16
	STD	Z+1,R17
	STD	Z+2,R18
	STD	Z+3,R19
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_7A0:	LDS	R16,Buffer_1C8
loc_7A2:	OUT	PORTC,R16
	NOP
	NOP
	NOP
	NOP
	IN	R16,PINB
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_7A9:	RCALL	SUB_780
	RCALL	loc_6DA
	RCALL	SUB_7AE
	RCALL	loc_78B
	RJMP	SUB_DE1

; =============== S U B	R O U T	I N E =======================================

SUB_7AE:	RCALL	SUB_771
	LDS	R16,Buffer_1CB
	RCALL	loc_7A2
	LDS	R17,Buffer_1C3
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_7B5:	ST	-Y,R26
	RCALL	SUB_776
	RCALL	SUB_7E2
	LDD	R26,Z+3
	RCALL	SUB_C1C
	MOV	R24,R16
	MOV	R25,R17
	LDI	R16,2
	RCALL	SUB_6D3
	BST	R26,7
	BRTC	loc_7C6
	LDS	R16,Buffer_1B6
	RCALL	SUB_7E1
	LDD	R18, Z+2
	OUT	PORTB,R18
	RCALL	SUB_73A
loc_7C6:	RCALL	SUB_739
	MOV	R16,R24
	MOV	R17,R25
	RCALL	SUB_7D8
	RJMP	loc_7D2
loc_7CB:	RCALL	SUB_7DF
	RCALL	SUB_785
	RCALL	SUB_C07
	RCALL	SUB_7E5
	BREQ	loc_7D3
	RCALL	SUB_7AE
	RCALL	loc_78B
loc_7D2:	RCALL	SUB_C07
loc_7D3:	RCALL	SUB_7E5
	BRNE	loc_7CB
	RCALL	SUB_7EA
	LD	R26,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_7D8:	SUBI	R16,$FD		;-3
	SBCI	R17,$FF		;-1
	RCALL	SUB_CEE
	MOV	R16,R9
	RCALL	SUB_C07
	LDI	R16,0
	RET

SUB_7DF:	LDS	R16,Buffer_1B4
SUB_7E1:	OUT	PORTC,R16
SUB_7E2:	LDI	R30,$60
	LDI	R31,0
	RET

SUB_7E5:	MOV	R16,R24
	MOV	R17,R25
	SBIW	R24,1
	OR	R16,R17
	RET

SUB_7EA:	LDI	R16,0
	RJMP	loc_735

; =============== S U B	R O U T	I N E =======================================

SUB_7EC:	RCALL	SUB_776
	RCALL	SUB_BEC
	MOV	R25,R16
	RCALL	SUB_BEC
	MOV	R24,R16
	LDI	R16,$80
	RCALL	SUB_6D3
	RCALL	SUB_801
	MOV	R16,R25
	RCALL	SUB_743
	MOV	R16,R24
	RCALL	SUB_7FE
	BRNE	loc_7FB
	LDI	R16,$81
	RJMP	loc_7FC
loc_7FB:	LDI	R16,0
loc_7FC:	RJMP	loc_735

; =============== S U B	R O U T	I N E =======================================

SUB_7FD:	LDD	R16,Y+1
SUB_7FE:	RCALL	SUB_96E
	TST	R16
	RET

SUB_801:	LDS	R16,Buffer_1C4
	OUT	PORTC,R16
	NOP
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_806:	RCALL	SUB_74E
	SBIW	R28,9
	LDI	R16,0
	STD	Y+1,R16
	RCALL	SUB_7E2
	LDD	R17,Z+1
	STD	Y+6,R17
	LDD	R18,Z+2
	STD	Y+7,R18
	LDD	R19,Z+3
	STD	Y+8,R19
	LDI	R16,1
	STD	Y+3,R16
	RCALL	SUB_C1C
	STD	Y+4,R16
	STD	Y+5,R17
	RCALL	SUB_BEC
	ST	Y,R16
	RCALL	SUB_BEC
	STD	Y+2,R16
	LDD	R24,Y+4
	LDD	R25,Y+5
	LSR	R25
	ROR	R24
	LDI	R16,$10
	RCALL	SUB_6D3
	LD	R16,Y
	SBRS	R16,0
	RJMP	loc_84C
	ANDI	R16,$0E
	BRNE	loc_826
	RJMP	loc_86F
loc_826:	LDI	R16,1
	LDI	R17,0
	LD	R20,Y
	LSR	R20
	ANDI	R20,7
	RCALL	SUB_F94
	MOV	R26,R16
	MOV	R27,R17
	LDD	R16,Y+4
	LDD	R17,Y+5
	MOV	R20,R26
	MOV	R21,R27
	RCALL	SUB_FA0
	STD	Y+3,R16
	MOV	R24,R26
	MOV	R25,R27
	LSR	R25
	ROR	R24
	RJMP	loc_86F
loc_839:	LDS	R16,Buffer_1B9
	RCALL	loc_6DA
	RCALL	SUB_891
	LDI	R16,0
	RCALL	SUB_B13
	RCALL	SUB_88D
	RCALL	SUB_89E
	BRNE	loc_844
loc_842:	LDI	R16,$81
	STD	Y+1,R16
loc_844:	LDD	R16,Y+4
	LDD	R17,Y+5
	SUBI	R16,2
	SBCI	R17,0
	STD	Y+4,R16
	STD	Y+5,R17
	OR	R16,R17
	BREQ	loc_885
loc_84C:	RCALL	SUB_8A7
	RCALL	loc_6DC
	RCALL	SUB_8A2
	RCALL	SUB_89E
	BRNE	loc_839
	RJMP	loc_842
loc_852:	RCALL	SUB_7DF
	RCALL	SUB_8AC
	RCALL	loc_6DC
	LDS	R16,Buffer_1B9
	RCALL	loc_6DA
	RCALL	SUB_88A
loc_859:	MOV	R16,R26
	MOV	R17,R27
	SBIW	R26,1
	OR	R16,R17
	BRNE	loc_852
	LD	R16,Y
	SBRS	R16,7
	RJMP	loc_86F
	LDS	R16,Buffer_1B5
	OUT	PORTC,R16
	LDD	R16,Y+6
	RCALL	loc_6DC
	LDD	R16,Y+8
	SBRS	R16,7
	RJMP	loc_86E
	LDS	R16,Buffer_1B6
	OUT	PORTC,R16
	LDD	R16,Y+7
	RCALL	loc_6DC
loc_86E:	RCALL	SUB_8A2
loc_86F:	LDD	R16,Y+3
	MOV	R17,R16
	DEC	R17
	STD	Y+3, R17
	TST	R16
	BREQ	loc_87C
	MOV	R26, R24
	MOV	R27, R25
	RCALL	SUB_89E
	BRNE	loc_859
	LDI	R16,$81
	STD	Y+1,R16
	RJMP	loc_859
loc_87C:	LD	R16,Y
	SBRS	R16,6
	RJMP	loc_885
	RCALL	SUB_89E
	BRNE	loc_883
	LDI	R16,$81
	STD	Y+1,R16
loc_883:	LDI	R16,0
	RCALL	SUB_6D3
loc_885:	RCALL	SUB_745
	LDD	R16,Y+1
	RCALL	SUB_C07
	ADIW	R28,9
	RJMP	loc_731

; =============== S U B	R O U T	I N E =======================================

SUB_88A:	LDS	R16,Buffer_1CC
	OUT	PORTC,R16
SUB_88D:	LDS	R16,Buffer_1C1
	OUT	PORTC,R16
	RET

SUB_891:	LDS	R16,Buffer_1C5
	OUT	PORTC,R16
	NOP
	RET

SUB_896:	IN	R18,PINC
	LDI	R16,1
	LDI	R17,0
	LDS	R20,Buffer_1CF
	RCALL	SUB_F94
	and	R16,R18
	RET

SUB_89E:	LDD	R16,Y+2
	RCALL	SUB_96E
	TST	R16
	RET

SUB_8A2:	RCALL	SUB_801
	LDI	R16,0
	RCALL	SUB_74A
	OUT	PORTC,R16
	RET

SUB_8A7:	RCALL	SUB_73B
	RCALL	SUB_6DD
	LDS	R16,Buffer_1B4
	OUT	PORTC,R16

SUB_8AC:	RCALL	SUB_791
	RCALL	SUB_6DD
	LDS	R16,Buffer_1B8
	OUT	PORTC,R16
	RJMP	SUB_BEC

; =============== S U B	R O U T	I N E =======================================

SUB_8B2:	RCALL	SUB_74E
	SBIW	R28,4
	LDI	R16,0
	ST	Y,R16
	LDI	R26,1
	RCALL	SUB_C1C
	STD	Y+2,R16
	STD	Y+3,R17
	RCALL	SUB_BEC
	MOV	R27,R16
	RCALL	SUB_BEC
	STD	Y+1,R16
	MOV	R16,R27
	ANDI	R16,$0E
	BREQ	loc_8D5
	LDI	R16,1
	LDI	R17,0
	MOV	R20,R27
	LSR	R20
	ANDI	R20,7
	RCALL	SUB_F94
	MOV	R24,R16
	MOV	R25,R17
	LDD	R16,Y+2
	LDD	R17,Y+3
	MOV	R20,R24
	MOV	R21,R25
	RCALL	SUB_FA0
	MOV	R26,R16
	STD	Y+2,R24
	STD	Y+3,R25
	RJMP	loc_8D5
loc_8D2:	BST	R27,7
	BRTC	loc_8D5
	RCALL	SUB_8A2
loc_8D5:	MOV	R16,R26
	DEC	R26
	TST	R16
	BREQ	loc_8EF
	RCALL	SUB_7FD
	BRNE	loc_8DD
	LDI	R16,$81'
	ST	Y, R16
loc_8DD:	LDI	R16,$11
	RCALL	SUB_6D3
	LDD	R24,Y+2
	LDD	R25,Y+3
	RJMP	loc_8E3
loc_8E2:	RCALL	SUB_88A
loc_8E3:	RCALL	SUB_7E5
	BREQ	loc_8D2
	RCALL	SUB_8A7
	RCALL	loc_6DC
	BST	R27,0
	BRTS	loc_8E2
	RCALL	SUB_8A2
	RCALL	SUB_7FD
	BRNE	loc_8E3
	LDI	R16,$81
	ST	Y,R16
	RJMP	loc_8E3
loc_8EF:	BST	R27,6
	BRTC	loc_8F5
	RCALL	SUB_7FD
	BRNE	loc_8F5
	LDI	R16,$81
	ST	Y,R16
loc_8F5:	RCALL	SUB_745
	LD	R16,Y
	RCALL	SUB_C07
	ADIW	R28,4
	RJMP	loc_731

; =============== S U B	R O U T	I N E =======================================

SUB_8FA:	RCALL	SUB_776
	RCALL	SUB_C1C
	MOV	R24,R16
	MOV	R25,R17
	RCALL	SUB_7D8
	RCALL	SUB_C07
	LDI	R16,3
	RCALL	SUB_6D3
	RJMP	loc_909
loc_903:	RCALL	SUB_739
	LDS	R16,Buffer_1B4
	OUT	PORTC,R16
	RCALL	SUB_785
	RCALL	SUB_C07
loc_909:	RCALL	SUB_7E5
	BRNE	loc_903
	RJMP	SUB_7EA

; =============== S U B	R O U T	I N E =======================================

SUB_90C:	LDI	R16,4
	RCALL	SUB_6D3
	RCALL	SUB_BEC
	TST	R16
	BREQ	loc_918
	DEC	R16
	BREQ	loc_91D
	DEC	R16
	BREQ	loc_920
	DEC	R16
	BREQ	loc_927
	RJMP	loc_929
loc_918:	RCALL	SUB_779
	RCALL	SUB_7A0
	LDS	R17, Buffer_1C0
	RJMP	loc_91E
loc_91D:	RCALL	SUB_7AE
loc_91E:	RCALL	loc_78B
	RJMP	SUB_DE1
loc_920:	RCALL	SUB_779
	LDS	R16, Buffer_1CA
	RCALL	loc_7A2
	LDS	R17, Buffer_1C2
	RJMP	loc_91E
loc_927:	RCALL	SUB_92B
	RJMP	loc_91E
loc_929:	SER	R16
	RJMP	SUB_DE1

; =============== S U B	R O U T	I N E =======================================

SUB_92B:	RCALL	SUB_771
	LDS	R16,Buffer_1C9
	RCALL	loc_7A2
	LDS	R17,Buffer_1C1
	RET

SUB_932:	RCALL	SUB_BEC
	LDI	R16,4
	RCALL	SUB_6D3
	RCALL	SUB_92B
	RCALL	loc_78B
	RJMP	SUB_DE1

; =============== S U B	R O U T	I N E =======================================

SUB_938:	ST	-Y,R24
	RCALL	SUB_BEC
	MOV	R24,R16
	LDI	R16,$40
	RCALL	loc_6D7
	TST	R24
	BREQ	loc_944
	DEC	R24
	BREQ	loc_948
	DEC	R24
	BREQ	loc_94E
	RJMP	loc_957
loc_944:	RCALL	SUB_801
	RCALL	SUB_BEC
	RCALL	SUB_74A
	RJMP	loc_956
loc_948:	RCALL	SUB_891
	RCALL	SUB_BEC
	RCALL	SUB_B13
	LDS	R16,Buffer_1C1
	RJMP	loc_956
loc_94E:	LDS	R16,Buffer_1C6
	OUT	PORTC,R16
	NOP
	RCALL	SUB_BEC
	RCALL	SUB_B13
	LDS	R16,Buffer_1C2
loc_956:	OUT	PORTC,R16
loc_957:	RCALL	SUB_745
	RCALL	SUB_BEC
	RCALL	SUB_7FE
	BRNE	loc_95D
	LDI	R16,$81
	RJMP	loc_95E
loc_95D:	LDI	R16,0
loc_95E:	RCALL	SUB_C07
	LD	R24,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_961:	RCALL	SUB_BEC
	LDI	R16,$20
	RCALL	loc_6D7
	RCALL	SUB_801
	RCALL	SUB_BEC
	RCALL	SUB_743
	RCALL	SUB_BEC
	RCALL	SUB_7FE
	BRNE	loc_96C
	LDI	R16,$81
	RJMP	SUB_C07
loc_96C:	LDI	R16,0
	RJMP	SUB_C07

; =============== S U B	R O U T	I N E =======================================

SUB_96E:	ST	-Y,R27
	ST	-Y,R26
	ST	-Y,R24
	MOV	R24,R16
	MOV	R20,R16
	LDI	R21,0
	LDI	R16,$0A
	LDI	R17,0
	RCALL	SUB_F84
	MOV	R26,R16
	MOV	R27,R17
	TST	R24
	BRNE	loc_980
loc_97B:	LDI	R16,1
	RJMP	loc_988
loc_97D:	LDI	R16,$64
	RCALL	SUB_AF1
	SBIW	R26,1
loc_980:	RCALL	SUB_896
	BRNE	loc_985
	MOV	R16,R26
	OR	R16,R27
	BRNE	loc_97D
loc_985:	RCALL	SUB_896
	BRNE	loc_97B
	LDI	R16,0
loc_988:	LD	R24,Y+
	LD	R26,Y+
	LD	R27,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_98C:	RCALL	SUB_74E
	ST	-Y,R17
	MOV	R27,R16
	MOV	R26,R18
	MOV	R24,R19
	LDI	R17,0
	LDI	R16,$95
	RCALL	SUB_9CC
	LDI	R17,0
	LDI	R16,$94
	RCALL	SUB_9CC
	LDI	R16,$0F
	RCALL	SUB_B13
	RCALL	SUB_59
	CPI	R16,$0A
	BRCC	loc_99F
	LDI	R25,0
	MOV	R16,R27
	RJMP	loc_9A3
loc_99F:	LDI	R25,1
	MOV	R20,R27
	LDI	R16,$0A
	RCALL	SUB_F7C
loc_9A3:	RCALL	SUB_B13
	LDS	R17,Buffer_1D4
	LDI	R16,$94
	RCALL	SUB_9CC
	LDS	R17,Buffer_1D6
	LDI	R16,$95
	RCALL	SUB_9CC
	TST	R25
	BREQ	loc_9B7
	LD	R20,Y
	LDI	R16,$0A
	RCALL	SUB_F7C
	RCALL	SUB_B13
	MOV	R20,R26
	LDI	R16,$0A
	RCALL	SUB_F7C
loc_9B5:	RCALL	SUB_B00
	RJMP	loc_9BC
loc_9B7:	LD	R16,Y
	RCALL	SUB_B13
	MOV	R16,R26
	RJMP	loc_9B5
loc_9BB:	RCALL	SUB_73A
loc_9BC:	MOV	R16,R24
	DEC	R24
	TST	R16
	BRNE	loc_9BB
	ADIW	R28, 1
	RJMP	loc_731

; =============== S U B	R O U T	I N E =======================================

SUB_9C2:	LDI	R16,$A1
	OUT	TCCR1A,R16
	LDI	R16,0
	OUT	OCR1BH,R16
	OUT	OCR1BL,R16
	OUT	OCR1AH,R16
	OUT	OCR1AL,R16
	LDI	R16,1
	OUT	TCCR1B,R16
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_9CC:	TST	R17
	BREQ	loc_9CF
	INC	R17
loc_9CF:	LSL	R17
	LSL	R17
	CPI	R16,$94
	BRNE	loc_9D8
	LDI	R19,0
	OUT	OCR1AH,R19
	OUT	OCR1AL,R17
loc_9D6:	LDI	R16,1
	RET
loc_9D8:	CPI	R16,$95
	BRNE	loc_9DE
	LDI	R19,0
	OUT	OCR1BH,R19
	OUT	OCR1BL,R17
	RJMP	loc_9D6
loc_9DE:	LDI	R16,0
	RET

;*********** Переполнение таймера/счётчика Т0 ******************************************

TIMER0_OVF:	ST	-Y,R24
	ST	-Y,R31
	ST	-Y,R30
	ST	-Y,R3
	ST	-Y,R2
	ST	-Y,R1
	ST	-Y,R0
	ST	-Y,R23
	ST	-Y,R22
	ST	-Y,R21
	ST	-Y,R20
	ST	-Y,R19
	ST	-Y,R18
	ST	-Y,R17
	ST	-Y,R16
	IN	R24, SREG
	OUT	TCNT0, R10
	TST	R13
	BREQ	loc_9F4
	DEC	R13
loc_9F4:	RCALL	SUB_A4F
	LDD	R16, Z+$B
	SBRC	R16, 1
	RJMP	loc_A0E
	BST	R11, 6
	BRTS	loc_A03
	BST	R11, 4
	BRTC	loc_A0E
	LDI	R16, 1
	RCALL	SUB_A6C
	SET
	BLD	R11, 6
	LDS	R12, Buffer_1D8
	RJMP	loc_A0E
loc_A03:	TST	R12
	BREQ	loc_A06
	DEC	R12
loc_A06:	BST	R11, 4
	BRTS	loc_A0E
	TST	R12
	BRNE	loc_A0E
	CLT
	BLD	R11,6
	LDI	R16,0
	RCALL	SUB_A6C
loc_A0E:	LDI	R30,$6C
	LDI	R31,0
	LDD	R16,Z+1
	INC	R16
	STD	Z+1,R16
	ANDI	R16,$0F
	BRNE	loc_A28
	LD	R16,Z
	TST	R16
	BRNE	loc_A28
	LDI	R16,2
	RCALL	SUB_F18
	BST	R16,1
	BRTS	loc_A1E
	SET
	RJMP	loc_A1F
loc_A1E:	CLT
loc_A1F:	BLD	R11,4
	BST	R16,0
	RCALL	SUB_A4F
	LDD	R16,Z+$B
	BRTS	loc_A26
	ORI	R16,$10
	RJMP	loc_A27
loc_A26:	ANDI	R16,$EF
loc_A27:	STD	Z+$B,R16
loc_A28:	RCALL	SUB_A4F
	LDD	R16,Z+$A
	SBRC	R16,0
	RJMP	loc_A3E
	LDS	R16,Buffer_06D
	ANDI	R16,3
	CPI	R16,1
	BRNE	loc_A32
	RCALL	SUB_6E
loc_A32:	LDS	R16,Buffer_06D
	ANDI	R16,3
	CPI	R16,2
	BRNE	loc_A38
	RCALL	SUB_93
loc_A38:	LDS	R16,Buffer_06D
	ANDI	R16,$1F
	CPI	R16,$1F
	BRNE	loc_A3E
	RCALL	SUB_A8C
loc_A3E:	OUT	SREG, R24
	LD	R16,Y+
	LD	R17,Y+
	LD	R18,Y+
	LD	R19,Y+
	LD	R20,Y+
	LD	R21,Y+
	LD	R22,Y+
	LD	R23,Y+
	LD	R0,Y+
	LD	R1,Y+
	LD	R2,Y+
	LD	R3,Y+
	LD	R30,Y+
	LD	R31,Y+
	LD	R24,Y+
	RETI

; =============== S U B	R O U T	I N E =======================================

SUB_A4F:	LDI	R30,$D4
	LDI	R31,1
	RET

SUB_A52:	CLR	R13
	CLR	R12
	CLR	R11
	RCALL	SUB_A4F
	LDD	R16,Z+$A
	SBRS	R16,0
	RJMP	loc_A5B
	LDI	R16,$C5
	RJMP	loc_A5C
loc_A5B:	LDI	R16,$8C
loc_A5C:	MOV	R10,R16
	OUT	TCNT0,R10
	LDI	R16,1
	OUT	TIMSK,R16
	LDI	R16,3
	OUT	TCCR0,R16
	RET

SUB_A63:	LDI	R18,$18
	OUT	TCCR2,R18
	SER	R18
	OUT	TCNT2,R18
	OUT	OCR2,R17
	ANDI	R16,7
	ORI	R16,$18
	OUT	TCCR2,R16
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_A6C:	CPI	R16,1
	RCALL	SUB_A4F
	LDD	R16,Z+$B
	BRNE	loc_A7D
	SBRS	R16,3
	RJMP	loc_A76
	LDD	R16,Z+$A
	SBRC	R16,0
	RJMP	loc_A88
	RJMP	loc_A7A
loc_A76:	LDD	R16,Z+$A
	SBRS	R16,0
	RJMP	loc_A89
	SBI	DDRD,2
loc_A7A:	SBI	PORTD,2		;Cигнал Reset = 1 (на базу VT5)
	CBI	PORTD,3		;Выключить +12v (на базу VT1)
	RET
loc_A7D:	SBRS	R16,3
	RJMP	loc_A85
	LDD	R16,Z+$A
	SBRS	R16,0
	RJMP	loc_A89
	SBI	PORTD,2		;Cигнал Reset = 1 (на базу VT5)
	CBI	DDRD,2
	RET
loc_A85:	LDD	R16,Z+$A
	SBRS	R16,0
	RJMP	loc_A7A
loc_A88:	SBI	DDRD,2
loc_A89:	CBI	PORTD,3		;Выключить +12v (на базу VT1)
	CBI	PORTD,2		;Cигнал Reset = 0 (на базу VT5)
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_A8C:	LDS	R16,Buffer_06E
	TST	R16
	BRNE	loc_AA4
	LDS	R16,Buffer_06F
	TST	R16
	BRNE	loc_AA4
	LDS	R16,Buffer_1D6
	CPI	R16,$0C
	BRCS	loc_AA4
	LDS	R16, Buffer_1D7
	CPI	R16,$0C
	BRCC	loc_AA4
	LDI	R17,0
	LDI	R16,$95
	RCALL	SUB_9CC
	LDI	R16,$20
	RCALL	SUB_ADF
	STS	Buffer_06F,R16
	RJMP	loc_AB5
loc_AA4:	LDS	R16,Buffer_06F
	CPI	R16,1
	BRNE	loc_AAF
	LDS	R17,Buffer_1D6
	LDI	R16,$95
	RCALL	SUB_9CC
	RCALL	SUB_AE7
	LDD	R16,Z+1
	RJMP	loc_AB3
loc_AAF:	TST	R16
	BREQ	loc_AB5
	LDI	R30,$6E
	LDI	R31,0
loc_AB3:	DEC	R16
	STD	Z+1,R16
loc_AB5:	LDS	R16,Buffer_06E
	TST	R16
	BRNE	loc_ACC
	LDS	R16,Buffer_1D4
	CPI	R16,$0C
	BRCS	locRET_ADE
	LDS	R16,Buffer_1D5	;Результат АЦП преобразований
	CPI	R16,$0C
	BRCC	locRET_ADE
	LDI	R17,0
	LDI	R16,$95
	RCALL	SUB_9CC
	LDI	R17,0
	LDI	R16,$94
	RCALL	SUB_9CC
	LDI	R16,8
	RCALL	SUB_ADF
	STS	Buffer_06E,R16
	RET
loc_ACC:	CPI	R16,1
	BRNE	loc_ADA
	LDS	R17,Buffer_1D4
	LDI	R16,$94
	RCALL	SUB_9CC
	LDI	R16,1
	STS	Buffer_06F,R16
	RCALL	SUB_AE7
	LD	R16,Z
	DEC	R16
	ST	Z,R16
	RET
loc_ADA:	LDI	R30,$6E
	LDI	R31,0
	DEC	R16
	ST	Z,R16
locRET_ADE:	RET

; =============== S U B	R O U T	I N E =======================================

SUB_ADF:	STS	Buffer_1DA,R16
	MOV	R16,R11
	ANDI	R16,$FE
	ORI	R16,2
	MOV	R11,R16
	LDI	R16,$14
	RET

SUB_AE7:	LDI	R16,0
	STS	Buffer_1DA,R16
	MOV	R16,R11
	ANDI	R16,$FD
	ORI	R16,1
	MOV	R11,R16
	LDI	R30,$6E
	LDI	R31,0
	RET

SUB_AF1:	RCALL	SUB_A4F
	LDD	R17,Z+$A
	SBRS	R17,0
	RJMP	loc_AFD
loc_AF5:	TST	R16
	BREQ	locRET_AFF
	RJMP	loc_AF8
loc_AF8:	DEC	R16
	RJMP	loc_AF5
loc_AFA:	RJMP	loc_AFB
loc_AFB:	NOP
	DEC	R16
loc_AFD:	TST	R16
	BRNE	loc_AFA
locRET_AFF:	RET

SUB_B00:	RJMP	loc_B05
loc_B01:	LDI	R17,$0B
loc_B02:	DEC	R17
	BRNE	loc_B02
	RJMP	loc_B05
loc_B05:	MOV	R17,R16
	DEC	R16
	TST	R17
	BREQ	locRET_B12
	RCALL	SUB_A4F
	LDD	R17,Z+$A
	SBRC	R17,0
	RJMP	loc_B01
	LDI	R17,$17
loc_B0E:	DEC	R17
	BRNE	loc_B0E
	NOP
	RJMP	loc_B05
locRET_B12:	RET

; =============== S U B	R O U T	I N E =======================================

SUB_B13:	RJMP	loc_B1B
loc_B14:	LDI	R18,$6A
	LDI	R19,3
loc_B16:	SUBI	R18,1
	SBCI	R19,0
	BRNE	loc_B16
	RJMP	loc_B1A
loc_B1A:	NOP
loc_B1B:	MOV	R17,R16
	DEC	R16
	TST	R17
	BREQ	locRET_B2B
	RCALL	SUB_A4F
	LDD	R17,Z+$0A
	SBRC	R17,0
	RJMP	loc_B14
	LDI	R18,$D5
	LDI	R19,6
loc_B25:	SUBI	R18,1
	SBCI	R19,0
	BRNE	loc_B25
	RJMP	loc_B29
loc_B29:	NOP
	RJMP	loc_B1B
locRET_B2B:	RET

; =============== S U B	R O U T	I N E =======================================

SUB_B2C:	LDS	R17,Buffer_06D
	ADD	R17,R16
	TST	R16
	BREQ	locRET_B35
loc_B31:	LDS	R16,Buffer_06D
	CP	R16,R17
	BRNE	loc_B31
locRET_B35:	RET

SUB_B36:	OUT	UBRRL,R16
	LDI	R16,$98
	OUT	UCSRB,R16
	LDI	R16,3

; =============== S U B	R O U T	I N E =======================================

SUB_B3A:	MOV	R18,R16
	IN	R19,SREG
	CLI
	BST	R18,0
	BRTC	loc_B48
	LDI	R16,0
	RCALL	SUB_B53
	STD	Z+4,R16
	STD	Z+5,R16
	STD	Z+2,R16
	STD	Z+3,R16
	STD	Z+$2F,R16
	STD	Z+$B,R16
	STD	Z+9,R16
loc_B48:	BST	R18,1
	BRTC	loc_B4F
	LDI	R16,0
	STS	Buffer_09E,R16
	STS	Buffer_09D,R16
loc_B4F:	BST	R19,7
	BRTC	locRET_B52
	SEI
locRET_B52:	RET

; =============== S U B	R O U T	I N E =======================================

SUB_B53:	LDI	R30,$70
	LDI	R31,0
	RET

; =============== S U B	R O U T	I N E =======================================

USART_RXC:	ST	-Y,R25
	ST	-Y,R24
	ST	-Y,R31
	ST	-Y,R30
	ST	-Y,R20
	ST	-Y,R19
	ST	-Y,R18
	ST	-Y,R17
	ST	-Y,R16
	IN	R20,SREG
	IN	R16,UDR
	RCALL	SUB_B53
	LDD	R17,Z+9
	EOR	R17,R16
	STD	Z+9,R17
	LDD	R17,Z+$2F
	SUBI	R17,0
	BREQ	loc_B94
	DEC	R17
	BREQ	loc_B9F
	DEC	R17
	BREQ	loc_BA2
	DEC	R17
	BREQ	loc_BA7
	DEC	R17
	BREQ	loc_BAF
	DEC	R17
	BREQ	loc_B76
	DEC	R17
	BRNE	loc_B75
	RJMP	loc_BB5
loc_B75:	RJMP	loc_BBC
loc_B76:	LDD	R18,Z+2
	LDD	R19,Z+3
	MOV	R24,R18
	MOV	R25,R19
	ADIW	R24,1
	STD	Z+2,R24
	STD	Z+3,R25
	MOV	R30,R18
	MOV	R31,R19
	SUBI	R30,$5F
	SBCI	R31,$FF		;-1
	ST	Z,R16
	RCALL	SUB_B53
	LDD	R16,Z+6
	LDD	R17,Z+7
	SUBI	R16,$FF		;-1
	SBCI	R17,$FF		;-1
	STD	Z+6,R16
	STD	Z+7,R17
	LDD	R16,Z+6
	LDD	R17,Z+7
	LD	R18,Z
	LDD	R19,Z+1
	CP	R16,R18
	CPC	R17,R19
	BRCC	loc_B92
loc_B90:	LDI	R16,5
	RJMP	loc_BBD
loc_B92:	LDI	R16,6
	RJMP	loc_BBD
loc_B94:	CPI	R16,$1B
	LDI	R16,0
	BRNE	loc_BBD
	ST	Z,R16
	STD	Z+1,R16
	STD	Z+6,R16
	STD	Z+7,R16
	LDI	R16,$1B
	STD	Z+9,R16
	LDI	R16,1
	RJMP	loc_BBD
loc_B9F:	STD	Z+$0B,R16
	LDI	R16,2
	RJMP	loc_BBD
loc_BA2:	LDI	R18,0
	ST	Z,R18
	STD	Z+1,R16
	LDI	R16,3
	RJMP	loc_BBD
loc_BA7:	LD	R18,Z
	LDD	R19,Z+1
	OR	R18,R16
	TST	R19
	ST	Z,R18
	STD	Z+1,R19
	LDI	R16,4
	RJMP	loc_BBD
loc_BAF:	CPI	R16,$0E
	LDI	R16,0
	BRNE	loc_BBD
	STD	Z+2,R16
	STD	Z+3,R16
	RJMP	loc_B90
loc_BB5:	LDD	R16,Z+9
	TST	R16
	LDI	R16,1
	BRNE	loc_BBB
	STD	Z+$0C,R16
	RJMP	loc_BBC
loc_BBB:	STD	Z+$A,R16
loc_BBC:	LDI	R16,0
loc_BBD:	STD	Z+$30,R16
	LDD	R16,Z+$30
	STD	Z+$2F,R16
	OUT	SREG,R20
	LD	R16,Y+
	LD	R17,Y+
	LD	R18,Y+
	LD	R19,Y+
	LD	R20,Y+
	LD	R30,Y+
	LD	R31,Y+
	LD	R24,Y+
	LD	R25,Y+
	RETI

; =============== S U B	R O U T	I N E =======================================

USART_UDRE:	ST	-Y,R31
	ST	-Y,R30
	ST	-Y,R18
	ST	-Y,R17
	ST	-Y,R16
	IN	R18,SREG
	LDS	R16,Buffer_09D
	LDS	R17,Buffer_09E
	CP	R16,R17
	BREQ	loc_BE4
	LDS	R16,Buffer_09E
	INC	R16
	ANDI	R16,$1F
	STS	Buffer_09E,R16
	MOV	R30,R16
	LDI	R31,0
	SUBI	R30,$90
	SBCI	R31,$FF		;-1
	LDD	R16,Z+$0D
	OUT	UDR,R16
	RJMP	loc_BE5
loc_BE4:	CBI	UCSRB,5
loc_BE5:	OUT	SREG,R18
	LD	R16,Y+
	LD	R17,Y+
	LD	R18,Y+
	LD	R30,Y+
	LD	R31,Y+
	RETI

; =============== S U B	R O U T	I N E =======================================

SUB_BEC:	MOV	R21,R27
	MOV	R20,R26
loc_BEE:	RCALL	SUB_B53
	LDD	R16,Z+2
	LDD	R17,Z+3
	LDD	R18,Z+4
	LDD	R19,Z+5
	CP	R16,R18
	CPC	R17,R19
	BREQ	loc_BEE
	LDD	R16,Z+4
	LDD	R17,Z+5
	MOV	R30,R16
	MOV	R31,R17
	ADIW	R30,1
	LDI	R26,$74
	LDI	R27,0
	ST	X+,R30
	ST	X,R31
	MOV	R30,R16
	MOV	R31,R17
	SUBI	R30,$5F
	SBCI	R31,$FF		;-1
	LD	R16,Z
	MOV	R26,R20
	MOV	R27,R21
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_C07:	LDS	R18,Buffer_09D
	INC	R18
	ANDI	R18,$1F
loc_C0B:	LDS	R17,Buffer_09E
	CP	R18,R17
	BREQ	loc_C0B
	MOV	R30,R18
	LDI	R31,0
	SUBI	R30,$90
	SBCI	R31,$FF		;-1
	STD	Z+$0D,R16
	STS	Buffer_09D,R18
	SBI	UCSRB,5
	RCALL	SUB_B53
	LDD	R17,Z+8
	EOR	R17,R16
	STD	Z+8,R17
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_C1C:	ST	-Y,R25
	ST	-Y,R24
	RCALL	SUB_BEC
	LDI	R24,0
	MOV	R25,R16
	RCALL	SUB_BEC
	LDI	R17,0
	ADD	R16,R24
	ADC	R17,R25
	LD	R24,Y+
	LD	R25,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_C28:	LDS	R16,Buffer_07A	;На выбор подпрограммы 
	TST	R16
	BREQ	loc_C37
	RCALL	SUB_CD8
	LDI	R16,$B0
	RCALL	SUB_C07
	LDI	R16,$C1
	RCALL	SUB_C07
	LDS	R16,Buffer_079
	RCALL	SUB_CE2
	STS	Buffer_07A,R16
	RET
loc_C37:	LDS	R16,Buffer_07C
	TST	R16
	BRNE	loc_C3C
	RJMP	loc_CD7
loc_C3C:	LDI	R16,2
	RCALL	SUB_B3A
	RCALL	SUB_BEC
	MOV	R9,R16
	DEC	R16
	CPI	R16,$3C
	BRCS	loc_C44
	RJMP	loc_CCC
loc_C44:	MOV	R30,R16
	LDI	R31,0
	LSL	R30
	ROL	R31
	SUBI	R30,$DE
	SBCI	R31,$FF		;R31,R30 + 34
	LPM
	ADIW	R30,1
	MOV	R16,R0
	LPM
	MOV	R30,R16
	MOV	R31,R0
	IJMP
	
loc_C51:	LDI	R16,$0B
	RCALL	SUB_CE7
	LDI	R16,0
	RCALL	SUB_C07
	LDI	R16,8
	RCALL	SUB_C07
	RCALL	SUB_CDD
	LDD	R16,Z+$0A
	SBRS	R16,0
	RJMP	loc_C6B
	LDI	R16,$41
	RCALL	SUB_C07
	LDI	R16,$56 ; 'V'
	RCALL	SUB_C07
	LDI	R16,$52 ; 'R'
	RCALL	SUB_C07
	LDI	R16,$49 ; 'I'
	RCALL	SUB_C07
	LDI	R16,$53 ; 'S'
	RCALL	SUB_C07
	LDI	R16,$50 ; 'P'
loc_C66:	RCALL	SUB_C07
	LDI	R16,$5F ; '_'
	RCALL	SUB_C07
	LDI	R16,$32 ; '2'
	RJMP	loc_CCF
loc_C6B:	LDI	R16,$53 ; 'S'
	RCALL	SUB_C07
	LDI	R16,$54 ; 'T'
	RCALL	SUB_C07
	LDI	R16,$4B ; 'K'
	RCALL	SUB_C07
	LDI	R16,$35 ; '5'
	RCALL	SUB_C07
	LDI	R16,$30 ; '0'
	RCALL	SUB_C07
	LDI	R16,$30 ; '0'
	RJMP	loc_C66
	
loc_C77:	RCALL	SUB_D00		;Настройка скорости  таймера Т2
	RJMP	loc_CD0
loc_C79:	RCALL	SUB_D5B		;Чтение скорости программирования
	RJMP	loc_CD0
loc_C7B:	RCALL	SUB_DA1		;Проверка на наличия МК в режиме LVSP
	RJMP	loc_CD0
loc_C7D:	RCALL	SUB_DB0		;Сохранить текущий адрес 4 байта
	RJMP	loc_CD0
loc_C7F:	RCALL	SUB_DCE		;Копировать коды команд высоковольтного программирования 32 байта
	RJMP	loc_CD0
loc_C81:	RCALL	SUB_DEB		;Возвращает $C0  -  Зачем это надо ?
	RJMP	loc_CD0
loc_C83:	RCALL	SUB_3F3		;Ввод микроконтроллера в режим LVSP
	RJMP	loc_CD0
loc_C85:	RCALL	SUB_48F		;Последняя команда от ПК   в режиме HVSP завершена 
	RJMP	loc_CD0
loc_C87:	RCALL	SUB_49A		;Стирание кристалла в режиме HVSP
	RJMP	loc_CD0
loc_C89:	RCALL	SUB_4CD		;Запись во Flash память в режиме HVSP
	RJMP	loc_CD0
loc_C8B:	LDI	R16, 1		;Чтение Flash памяти в режиме HVSP
loc_C8C:	RCALL	SUB_593
	RJMP	loc_CD0
loc_C8E:	RCALL	SUB_5CE		;Запись в EEPROM в режиме HVSP
	RJMP	loc_CD0
loc_C90:	LDI	R16, 0		;Чтение EEPROM памяти в режиме HVSP
	RJMP	loc_C8C
loc_C92:	RCALL	SUB_6AB		;Запись конфигурационных ячеек и ячеек защиты в режиме HVSP
	RJMP	loc_CD0
loc_C94:	RCALL	SUB_6BA		;Чтение конфигурационных ячеек, байта защиты и сигнатуры в режиме LVSP
	RJMP	loc_CD0
loc_C96:	RCALL	SUB_61D		;Передать/принять байты в режиме HVSP
	RJMP	loc_CD0
loc_C98:	RCALL	SUB_6E2		;Ввод микроконтроллера в режиме HVPP
	RJMP	loc_CD0
loc_C9A:	RCALL	SUB_753		;Последняя команда от ПК в режиме HVPP завершена
	RJMP	loc_CD0
loc_C9C:	RCALL	SUB_7EC		;Стирание кристалла в режиме HVPP
	RJMP	loc_CD0
loc_C9E:	RCALL	SUB_806		;Запись во Flash память в режиме HVPP
	RJMP	loc_CD0
loc_CA0:	RCALL	SUB_7B5		;Чтение Flash памяти в режиме HVPP
	RJMP	loc_CD0
loc_CA2:	RCALL	SUB_8B2		;Запись в EEPROM в режиме HVPP
	RJMP	loc_CD0
loc_CA4:	RCALL	SUB_8FA		;Чтение EEPROM памяти в режиме HVPP
	RJMP	loc_CD0
loc_CA6:	RCALL	SUB_938		;Запись конфигурационных ячеек в режиме HVPP
	RJMP	loc_CD0
loc_CA8:	RCALL	SUB_90C		;Чтение конфигурационных ячеек в режиме HVPP
	RJMP	loc_CD0
loc_CAA:	RCALL	SUB_961		;Запись байта защиты в режиме HVPP
	RJMP	loc_CD0
loc_CAC:	RCALL	SUB_932		;Чтение байта защиты в режиме HVPP
	RJMP	loc_CD0
loc_CAE:	RCALL	SUB_77A		;Чтение сигнатуры микроконтроллера в режиме HVPP
	RJMP	loc_CD0
loc_CB0:	RCALL	SUB_7A9		;Чтение калибровочной ячейки в режиме HVPP
	RJMP	loc_CD0
loc_CB2:	RCALL	SUB_C5		;Ввод микроконтроллера в режиме HVSP
	RJMP	loc_CD0
loc_CB4:	RCALL	SUB_134		;Последняя команда от ПК в режиме HVPS завершена 
	RJMP	loc_CD0
loc_CB6:	RCALL	SUB_16B		;Стирание кристалла в режиме HVSP
	RJMP	loc_CD0
loc_CB8:	RCALL	SUB_1E9		;Запись Flash памяти в режиме HVSP
	RJMP	loc_CD0
loc_CBA:	RCALL	SUB_192		;Чтение Flash памяти 
	RJMP	loc_CD0
loc_CBC:	RCALL	SUB_274		;Запись EEPROM памяти в режиме HVSP
	RJMP	loc_CD0
loc_CBE:	RCALL	SUB_2D1		;Чтение EEPROM памяти 
	RJMP	loc_CD0
loc_CC0:	RCALL	SUB_2EA		;Запись конфигурационных ячеек в режиме HVSP
	RJMP	loc_CD0
loc_CC2:	RCALL	SUB_305		;Чтение конфигурационных ячеек в режиме HVSP
	RJMP	loc_CD0
loc_CC4:	RCALL	SUB_317		;Запись байта защиты в режиме HVSP
	RJMP	loc_CD0
loc_CC6:	RCALL	SUB_325		;Чтение байта защиты в режиме HVSP
	RJMP	loc_CD0
loc_CC8:	RCALL	SUB_154		;Чтение сигнатуры в режиме HVSP
	RJMP	loc_CD0
loc_CCA:	RCALL	SUB_162		;Чтение калибровочной ячейки в режиме HVSP
	RJMP	loc_CD0
loc_CCC:	LDI	R16,1		;Команда не поддерживается
	RCALL	SUB_CE7
	LDI	R16,$C9
loc_CCF:	RCALL	SUB_C07
loc_CD0:	LDI	R16,1
	RCALL	SUB_B3A
	LDS	R16,Buffer_078
	RCALL	SUB_CE2
	STS	Buffer_07C,R16
loc_CD7:	RET

; =============== S U B	R O U T	I N E =======================================

SUB_CD8:	LDI	R16,2
	LDI	R17,0
	RJMP	SUB_CEE

SUB_CDB:	LDI	R16,$21
	RCALL	SUB_CE0
SUB_CDD:	LDI	R30,$D4
	LDI	R31,1
	RET

SUB_CE0:	LDI	R17,0
	RJMP	loc_AF

SUB_CE2:	RCALL	SUB_C07
	LDI	R16,0
	STS	Buffer_079,R16
	RET

SUB_CE7:	LDI	R17,0
	RCALL	SUB_CEE
	MOV	R16,R9
	RJMP	SUB_C07

SUB_CEB:	RCALL	SUB_CD8
	MOV	R16,R9
	RJMP	SUB_C07

SUB_CEE:	ST	-Y,R25
	ST	-Y,R24
	MOV	R24,R16
	MOV	R25,R17
	LDI	R16,$1B
	RCALL	SUB_C07
	LDS	R16,Buffer_07B
	RCALL	SUB_C07
	MOV	R16,R25
	RCALL	SUB_C07
	MOV	R16,R24
	RCALL	SUB_C07
	LDI	R16,$0E
loc_CFC:	RCALL	SUB_C07
	LD	R24,Y+
	LD	R25,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_D00:	ST	-Y,R25
	ST	-Y,R24
	RCALL	SUB_BEC
	MOV	R25,R16
	RCALL	SUB_BEC
	MOV	R24,R16
	RCALL	SUB_CEB
	SUBI	R25,$94
	BREQ	loc_D16
	DEC	R25
	BREQ	loc_D22
	DEC	R25
	BREQ	loc_D2C
	DEC	R25
	BREQ	loc_D38
	DEC	R25
	BREQ	loc_D3E
	SUBI	R25, 6
	BREQ	loc_D4C
	DEC	R25
	BREQ	loc_D49
	RJMP	loc_D59
loc_D16:	STS	Buffer_1D4,R24
	LDS	R18,Buffer_1D4
	LDI	R16,$10
	RCALL	SUB_CE0
	LDS	R17,Buffer_1D4
	LDI	R16,$94
loc_D1F:	RCALL	SUB_9CC
loc_D20:	LDI	R16,0
	RJMP	loc_D5A
loc_D22:	STS	Buffer_1D6,R24
	LDS	R18,Buffer_1D6
	LDI	R16,$14
	RCALL	SUB_CE0
	LDS	R17,Buffer_1D6
	LDI	R16,$95
	RJMP	loc_D1F
loc_D2C:	STS	Buffer_1DB,R24
	LDS	R18,Buffer_1DB
	LDI	R16,$18
loc_D31:	RCALL	SUB_CE0
	LDS	R17,Buffer_1DC
	LDS	R16,Buffer_1DB
	RCALL	SUB_A63
	RJMP	loc_D20
loc_D38:	STS	Buffer_1DC,R24
	LDS	R18,Buffer_1DC
	LDI	R16,$1C
	RJMP	loc_D31
loc_D3E:	STS	Buffer_1D9,R24
	RCALL	SUB_3E5
	LDS	R16, Buffer_06A
	RCALL	SUB_3DA
	LDS	R18, Buffer_1D9
	LDI	R16,$24
	RCALL	SUB_CE0
	RJMP	loc_D20
loc_D49:	STS	Buffer_1DD,R24
	RJMP	loc_D20
loc_D4C:	TST	R24
	BREQ	loc_D53
	LDI	R18,1
	RCALL	SUB_CDB
	LDD	R16,Z+$B
	ORI	R16,8
	RJMP	loc_D57
loc_D53:	LDI	R18,0
	RCALL	SUB_CDB
	LDD	R16,Z+$B
	ANDI	R16,$F7
loc_D57:	STD	Z+$B, R16
	RJMP	loc_D20
loc_D59:	LDI	R16,$C0
loc_D5A:	RJMP	loc_CFC

; =============== S U B	R O U T	I N E =======================================

SUB_D5B:	RCALL	SUB_BEC
	SUBI	R16,$80
	BREQ	loc_D81
	DEC	R16
	BREQ	loc_D83
	SUBI	R16,$0F
	BREQ	loc_D79
	DEC	R16
	BREQ	loc_D7D
	DEC	R16
	BREQ	loc_D7F
	SUBI	R16,2
	BREQ	loc_D85
	DEC	R16
	BREQ	loc_D88
	DEC	R16
	BREQ	loc_D90
	DEC	R16
	BREQ	loc_D93
	DEC	R16
	BREQ	loc_D98
	SUBI	R16,2
	BREQ	loc_D96
	SUBI	R16,2
	BREQ	loc_D8D
	DEC	R16
	BREQ	loc_D8B
	SUBI	R16,2
	BREQ	loc_D9B
	RJMP	loc_D9E
loc_D79:	LDI	R16,8
	RCALL	SUB_F18
	ANDI	R16,$0F
	RJMP	SUB_DE1
loc_D7D:	LDI	R16,2
	RJMP	SUB_DE1
loc_D7F:	LDI	R16,$0A
	RJMP	SUB_DE1
loc_D81:	LDI	R16,9
	RJMP	SUB_DE1
loc_D83:	LDI	R16,0
	RJMP	SUB_DE1
loc_D85:	LDS	R16,Buffer_1D5	;Результат АЦП преобразований
	RJMP	SUB_DE1
loc_D88:	LDS	R16,Buffer_1D6
	RJMP	SUB_DE1
loc_D8B:	IN	R16,PINB
	RJMP	SUB_DE1
loc_D8D:	LDS	R16,Buffer_1DF
	RJMP	SUB_DE1
loc_D90:	LDS	R16,Buffer_1DB
	RJMP	SUB_DE1
loc_D93:	LDS	R16,Buffer_1DC
	RJMP	SUB_DE1
loc_D96:	RCALL	SUB_EE6
	RJMP	SUB_DE1
loc_D98:	LDS	R16,Buffer_1D9
	RJMP	SUB_DE1
loc_D9B:	LDS	R16,Buffer_1DD
	RJMP	SUB_DE1
loc_D9E:	RCALL	SUB_CEB
	LDI	R16,$C0
	RJMP	SUB_C07

; =============== S U B	R O U T	I N E =======================================

SUB_DA1:	ST	-Y,R24
	RCALL	SUB_CDD
	LDD	R16,Z+$A
	ANDI	R16,1
	RCALL	SUB_F31
	TST	R16
	BREQ	loc_DAA
	LDI	R24,0
	RJMP	loc_DAB
loc_DAA:	LDI	R24,$C0
loc_DAB:	RCALL	SUB_CEB
loc_DAC:	MOV	R16,R24
	RCALL	SUB_C07
	LD	R24,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_DB0:	RCALL	SUB_BEC
	LDI	R18,0
	LDI	R30,$60
	LDI	R31,0
	ST	Z,R18
	STD	Z+1,R18
	STD	Z+2,R18
	STD	Z+3,R16
	RCALL	SUB_DC6
	OR	R22,R16
	RCALL	SUB_DC5
	OR	R21,R16
	RCALL	SUB_DC5
	OR	R20,R16
	RCALL	SUB_DC0
	RJMP	SUB_DE8

; =============== S U B	R O U T	I N E =======================================

SUB_DC0:	ST	Z,R20
	STD	Z+1,R21
	STD	Z+2,R22
	STD	Z+3,R23
	RET

SUB_DC5:	RCALL	SUB_DC0
SUB_DC6:	RCALL	SUB_BEC
	LDI	R30,$60
	LDI	R31,0
	LD	R20,Z
	LDD	R21,Z+1
	LDD	R22,Z+2
	LDD	R23,Z+3
	RET

SUB_DCE:	ST	-Y,R27
	ST	-Y,R26
	ST	-Y,R24
	RCALL	SUB_CD8
	LDI	R26,$B4
	LDI	R27,1
	LDI	R24,$20
loc_DD5:	RCALL	SUB_BEC
	ST	X+,R16
	DEC	R24
	BRNE	loc_DD5
	MOV	R16,R9
	RCALL	SUB_C07
	LDI	R16,0
	RCALL	SUB_C07
	LD	R24,Y+
	LD	R26,Y+
	LD	R27,Y+
	RET

SUB_DE1:	ST	-Y,R24
	MOV	R24,R16
	LDI	R16,3
	RCALL	SUB_CE7
	LDI	R16,0
	RCALL	SUB_C07
	RJMP	loc_DAC

SUB_DE8:	RCALL	SUB_CEB
	LDI	R16,0
	RJMP	SUB_C07

; =============== S U B	R O U T	I N E =======================================

SUB_DEB:	ST	-Y,R25
	ST	-Y,R24
	LDI	R24,0
	LDI	R30,$70
	LDI	R31,0
	LD	R16,Z
	LDD	R17,Z+1
	CPI	R16,$0A
	SBCI	R17,0
	BREQ	loc_E02
loc_DF5:	RCALL	SUB_CEB
	LDI	R16,$C0
	RJMP	loc_CFC
loc_DF8:	RCALL	SUB_BEC
	LDI	R30,LOW(Data_3*2)
	LDI	R31,HIGH(Data_3*2)
	ADD	R30,R24
	ADC	R31,R25
	LPM
	MOV	R17,R0
	CP	R17,R16
	BRNE	loc_DF5
	INC	R24
loc_E02:	LDI	R30,LOW(Data_3*2)
	LDI	R31,HIGH(Data_3*2)
	LDI	R25,0
	ADD	R30,R24
	ADC	R31,R25
	LPM
	TST	R0
	BRNE	loc_DF8
	TST	R24
	BREQ	loc_DF5
	RCALL	SUB_DE8
	LDS	R16,Buffer_078
	RCALL	SUB_C07
	LDI	R16,$64
	RCALL	SUB_B2C
	OUT	SPCR,R25
	LDI	R16,$10
	OUT	DDRB,R16
	OUT	PORTB,R25
loc_E16:	RJMP	loc_E16

; =============== S U B	R O U T	I N E =======================================

SUB_E17:	LDI	R16,8
	RCALL	SUB_F18
	ANDI	R16,$0F
	CPI	R16,$0F
	RCALL	SUB_EBA
	LDD	R16,Z+$A
	BRNE	loc_E20
	ORI	R16,1
	RJMP	loc_E21
loc_E20:	ANDI	R16,$FE
loc_E21:	STD	Z+$0A,R16
	RCALL	SUB_A52
	LDI	R16,0
	STS	Buffer_1DD,R16
	RCALL	SUB_EBA
	LDD	R16,Z+$A
	SBRS	R16,0
	RJMP	loc_E2C
	LDI	R16,1
	RJMP	loc_E2D
loc_E2C:	LDI	R16,3
loc_E2D:	RCALL	SUB_B36
	LDI	R16,$10
	RCALL	SUB_EB8
	STS	Buffer_1D4,R16
	LDS	R16,Buffer_1D4
	CPI	R16,$3D
	BRCS	loc_E3D
	LDI	R16,$32
	STS	Buffer_1D4,R16
	LDS	R18,Buffer_1D4
	LDI	R16,$10
	RCALL	SUB_EB6
loc_E3D:	LDI	R16,$14
	RCALL	SUB_EB8
	STS	Buffer_1D6,R16
	LDS	R16,Buffer_1D4
	LDS	R17,Buffer_1D6
	CP	R16,R17
	BRCC	loc_E4F
	LDS	R16,Buffer_1D4
	STS	Buffer_1D6,R16
	LDS	R18,Buffer_1D6
	LDI	R16,$14
	RCALL	SUB_EB6
loc_E4F:	LDS	R17,Buffer_1D4
	LDI	R16,$94
	RCALL	SUB_9CC
	LDS	R17,Buffer_1D6
	LDI	R16,$95
	RCALL	SUB_9CC
	LDI	R16,$64
	RCALL	SUB_B13
	SEI
	LDI	R16,$18
	RCALL	SUB_EB8
	STS	Buffer_1DB,R16
	LDS	R16,Buffer_1DB
	CPI	R16,8
	BRCS	loc_E78
	LDI	R16,1
	STS	Buffer_1DB,R16
	LDS	R18,Buffer_1DB
	LDI	R16,$18
	RCALL	SUB_EB6
	LDI	R16,0
	STS	Buffer_1DC,R16
	LDS	R18,Buffer_1DC
	LDI	R16,$1C
	RCALL	SUB_EB6
	LDI	R16,$0A
	STS	Buffer_1D9,R16
	LDS	R18,Buffer_1D9
	LDI	R16,$24
	RCALL	SUB_EB6
	RCALL	SUB_EB0
loc_E78:	LDI	R16,$1C
	RCALL	SUB_EB8
	STS	Buffer_1DC, R16
	LDI	R16,$20 
	RCALL	SUB_EB8
	STS	Buffer_1D8,R16
	LDS	R16,Buffer_1D8
	TST	R16
	BRNE	loc_E85
	RCALL	SUB_EB0
loc_E85:	LDI	R16,$24
	RCALL	SUB_EB8
	STS	Buffer_1D9,R16
	LDI	R16,$21
	RCALL	SUB_EB8
	TST	R16
	RCALL	SUB_EBA
	LDD	R16,Z+$B
	BREQ	loc_E91
	ORI	R16,8
	RJMP	loc_E92
loc_E91:	ANDI	R16,$F7
loc_E92:	STD	Z+$B,R16
	LDI	R16,0
	RCALL	SUB_A6C
	LDS	R17,Buffer_1DC
	LDS	R16,Buffer_1DB
	RCALL	SUB_A63
	LDI	R16,0
	STS	Buffer_1DA,R16
	SET
	RCALL	SUB_EAD
	SET
	RCALL	SUB_EA9
	CLT
	RCALL	SUB_EAD
	CLT
	RCALL	SUB_EA9
	SET
	BLD	R11,0
loc_EA7:	RCALL	SUB_C28
	RJMP	loc_EA7

; =============== S U B	R O U T	I N E =======================================

SUB_EA9:	BLD	R11,0
	RCALL	SUB_EAB
SUB_EAB:	LDI	R16,$FA
	RJMP	SUB_B13

SUB_EAD:	BLD	R11,1
	RCALL	SUB_EAB
	RJMP	SUB_EAB

SUB_EB0:	LDI	R16,$14
	STS	Buffer_1D8,R16
	LDS	R18,Buffer_1D8
	LDI	R16,$20
SUB_EB6:	LDI	R17,0
	RJMP	loc_AF

SUB_EB8:	LDI	R17,0
	RJMP	loc_C2

SUB_EBA:	LDI	R30,$D4
	LDI	R31,1
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_EBD:	RCALL	SUB_9C2
	LDI	R16,0
	LDI	R17,0
	LDI	R30,$60
	LDI	R31,0
	ST	Z,R16
	STD	Z+1,R16
	STD	Z+2,R16
	STD	Z+3,R16
	LDI	R16,4
	OUT	PORTD,R16		;Cигналы Reset=0,12v-выкл,Xtpl1=1
	LDI	R16,$BE
	OUT	DDRD,R16
	LDI	R16,$3F
	OUT	PORTA,R16
	LDI	R16,$30
	OUT	DDRA,R16
	OUT	PORTB,R17
	OUT	DDRB,R17
	OUT	PORTC,R17
	OUT	DDRC,R17
	RCALL	SUB_53
	LDI	R16,1
	LDI	R17,0
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_ED6:	RCALL	SUB_EBA
	LDD	R16,Z+$B
	ORI	R16,2
	STD	Z+$B,R16
	LDI	R16,3
	OR	R11,R16
	RET

SUB_EDD:	RCALL	SUB_EBA
	LDD	R16,Z+$B
	ANDI	R16,$FD
	STD	Z+$B,R16
	MOV	R16,R11
	ANDI	R16,$FD
	ORI	R16,1
	MOV	R11,R16
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_EE6:	ST	-Y,R26
	ST	-Y,R25
	ST	-Y,R24
	LDI	R25,0
	LDI	R16,1
	STS	Buffer_06C,R16
	RCALL	SUB_B13
	LDI	R24,0
	RJMP	loc_EF2
loc_EF0:	BST	R24,0
	BRTS	loc_EF4
loc_EF2:	CBI	PORTA,4		;Включить светодиод RED
	RJMP	loc_EF5
loc_EF4:	SBI	PORTA,4		;Выключить светодиод RED
loc_EF5:	BST	R24,1
	BRTC	loc_EF9
	SBI	PORTA,5		;Выключить светодиод GRN
	RJMP	loc_EFA
loc_EF9:	CBI	PORTA,5		;Включить светодиод GRN
loc_EFA:	LDI	R16,2
	RCALL	SUB_B13
	CBI	PORTA,4		;Включить светодиод RED
	NOP
	SBI	PORTA,4		;Выключить светодиод RED
	LDI	R16,3
loc_F00:	CBI	PORTA,5		;Включить светодиод GRN
	SBI	PORTA,5		;Выключить светодиод GRN
	LSL	R26
	SBIC	PIND,6		;Сигнал от сдвигового регистра 74HC597N
	INC	R26
	DEC	R16
	BRNE	loc_F00
	LSL	R25
	LSL	R25
	MOV	R16,R25
	MOV	R25,R26
	ANDI	R25,3
	ADD	R25,R16
	INC	R24
	CPI	R24,4
	BRCS	loc_EF0
	LDI	R16,0
	STS	Buffer_06C,R16
	MOV	R16,R25
	LD	R24,Y+
	LD	R25,Y+
	LD	R26,Y+
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_F18:	LDI	R18,0
	CBI	PORTA,4		;Включить светодиод RED
	SBI	PORTA,4		;Выключить светодиод RED
	RJMP	loc_F21
loc_F1C:	LSL	R18
	SBIC	PIND,6		;Сигнал от сдвигового регистра 74HC597N
	ORI	R18,1
	CBI	PORTA,5		;Включить светодиод GRN
	SBI	PORTA,5		;Выключить светодиод GRN
loc_F21:	MOV	R17,R16
	DEC	R16
	TST	R17
	BRNE	loc_F1C
	BST	R11,1
	BRTC	loc_F29
	CBI	PORTA,4		;Включить светодиод RED
	RJMP	loc_F2A
loc_F29:	SBI	PORTA,4		;Выключить светодиод RED
loc_F2A:	BST	R11,0
	BRTC	loc_F2E
	CBI	PORTA,5		;Включить светодиод GRN
	RJMP	loc_F2F
loc_F2E:	SBI	PORTA,5		;Выключить светодиод GRN
loc_F2F:	MOV	R16,R18
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_F31:	CLI
	ST	-Y,R17
	ST	-Y,R18
	ST	-Y,R19
	ST	-Y,R20
	ST	-Y,R21
	ST	-Y,R22
	ST	-Y,R23
	ST	-Y,R24
	MOV	R22,R16
	LDI	R23,8
	IN	R21,DDRB
	IN	R24,PINB
	SBI	DDRB,5
	SBI	PINB,5
	LDI	R22,$1F
	CPI	R16,1
	BRNE	loc_F44
	LDI	R22,$C
loc_F44:	SER	R16
	SER	R17
	IN	R18,PINB
	ANDI	R18,$40
loc_F48:	LDI	R19,0
	CP	R16,R19
	CPC	R17,R19
	BREQ	loc_F5F
	IN	R19,PINB
	ANDI	R19,$40
	CP	R18,R19
	MOV	R18,R19
	BREQ	loc_F53
	DEC	R23
	BREQ	loc_F61
loc_F53:	LDI	R20,$20
	IN	R19,PORTB
	EOR	R19,R20
	OUT	PORTB,R19
	LDI	R19,0
	DEC	R16
	BRNE	loc_F5B
	DEC	R17
loc_F5B:	MOV	R19,R22
loc_F5C:	DEC	R19
	BRNE	loc_F5C
	RJMP	loc_F48
loc_F5F:	LDI	R16,0
	RJMP	loc_F63
loc_F61:	LDI	R16,1
	RJMP	loc_F63
loc_F63:	OUT	PINB,R24
	OUT	DDRB,R21
	LD	R24,Y+
	LD	R23,Y+
	LD	R22,Y+
	LD	R21,Y+
	LD	R20,Y+
	LD	R19,Y+
	LD	R18,Y+
	LD	R17,Y+
	SEI
	RET

;***************************************************************************************

RESET:	SER	R16
	OUT	SPL,R16
	LDI	R16,1
	OUT	SPH,R16
	LDI	R28,$30
	LDI	R29,2
	RCALL	SUB_EBD
	TST	R16
	BREQ	loc_F79
	RCALL	SUB_FC5
loc_F79:	RCALL	SUB_E17
	RCALL	SUB_FEB
	RJMP	SUB_FEB

;***************************************************************************************

SUB_F7C:	MOV	R0,R16
	CLR	R16
loc_F7E:	LSR	R20
	BRCC	loc_F81
	ADD	R16,R0
loc_F81:	LSL	R0
	BRNE	loc_F7E
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_F84:	CLR	R0
	CLR	R1
loc_F86:	CPI	R16,0
	CPC	R16,R17
	BREQ	loc_F91
	LSR	R17
	ROR	R16
	BRCC	loc_F8E
	ADD	R0,R20
	ADC	R1,R21
loc_F8E:	LSL	R20
	ROL	R21
	RJMP	loc_F86
loc_F91:	MOV	R16,R0
	MOV	R17,R1
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_F94:	DEC	R20
	BRMI	locRET_F99
	LSL	R16
	ROL	R17
	RJMP	SUB_F94
locRET_F99:	RET
loc_F9A:	DEC	R20
	BRMI	locRET_F9F
	LSR	R17
	ROR	R16
	RJMP	loc_F9A
locRET_F9F:	RET

; =============== S U B	R O U T	I N E =======================================

SUB_FA0:	CLR	R0
	CLR	R1
	LDI	R30,$0F
loc_FA3:	ROL	R16
	ROL	R17
	ROL	R0
	ROL	R1
	CP	R0,R20
	CPC	R1,R21
	BRCS	loc_FAC
	SUB	R0,R20
	SBC	R1,R21
loc_FAC:	DEC	R30
	BRPL	loc_FA3
	ROL	R16
	ROL	R17
	MOV	R20,R0
	MOV	R21,R1
	COM	R16
	COM	R17
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_FB5:	LDI	R18,0
	ST	X+,R18
	RCALL	SUB_FBA
	BRNE	SUB_FB5
	RET

SUB_FBA:	SUBI	R16,1
	SBCI	R17,0
	MOV	R18,R16
	OR	R18,R17
	RET

SUB_FBF:	LPM
	ADIW	R30,1
	ST	X+,R0
	RCALL	SUB_FBA
	BRNE	SUB_FBF
	RET

; =============== S U B	R O U T	I N E =======================================

SUB_FC5:	LDI	R24,LOW(Data_2*2)
	LDI	R25,HIGH(Data_2*2)
loc_FC7:	MOV	R30,R24
	MOV	R31,R25
	LPM
	MOV	R16,R0
	ADIW	R30,1
	LPM
	MOV	R17,R0
	MOV	R30,R24
	MOV	R31,R25
	ADIW	R30,2
	LPM
	MOV	R26,R0
	ADIW	R30,1
	LPM
	MOV	R27,R0
	MOV	R30,R24
	MOV	R31,R25
	ADIW	R30,4
	LPM
	MOV	R18,R0
	ADIW	R30,1
	LPM
	MOV	R20,R18
	OR	R20,R0
	BREQ	loc_FE4
	MOV	R30,R18
	MOV	R31,R0
	RCALL	SUB_FBF
	RJMP	loc_FE5
loc_FE4:	RCALL	SUB_FB5
loc_FE5:	ADIW	R24,6
	LDI	R17,0
	CPI	R24,$A6
	CPC	R25,R17
	BRCS	loc_FC7
	RET

SUB_FEB:	NOP
loc_FEC:	SLEEP
	RJMP	loc_FEC

;***************************************************************************************

.ORG $0FEE

Data_3:	.DB $66,$77,$75,$70,$67,$72,$61,$64,$65,$00

.ORG $0FF3

Data_4:	.DB $AA,$55,$00,$00,$06,$06,$06,$06,$06,$06

;***************************************************************************************

.INCLUDE "MemORy.asm"

