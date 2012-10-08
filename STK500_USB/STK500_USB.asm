


.DEVICE ATmega16			;С кварцем на 12,0 Мгц

.equ 	 SREG	 =$3F		; Регистр состояния
.equ 	 SPH	 =$3E		; Младший байт регистра указателя стека
.equ 	 SPL	 =$3D		; Старший байт регистра указателя стека
.equ 	 OCR0	 =$3C		; Регистра сравнения таймера / счётчика Т0
.equ 	 GICR 	 =$3B		; Общий регистр управления прерываниями
.equ 	 GIFR	 =$3A		; Общий регистр флагов прерывания
.equ 	 TIMSK	 =$39		; Регистр маски прерывания таймеров / счётчиков
.equ 	 TIFR 	 =$38		; Регистр флагов прерывания таймеров / счётчиков
.equ 	 SPMCR	 =$37		; Регистр управления самопрограммированием
.equ 	 TWCR	 =$36		; TWI Регистр Контроля(управления)
.equ 	 MCUCR	 =$35		; Регистр управления и состояния микроконтроллера
.equ 	 MCUCSR	 =$34		; Регистр состояния микроконтроллера
.equ 	 TCCR0	 =$33		; Регистр управления таймера / счётчика Т0
.equ 	 TCNT0 	 =$32		; Счётный регистр таймера / счётчика Т0
.equ 	 OSCCAL	 =$31		; Регистр калибровки внутреннего генератора
.equ 	 SFIOR	 =$30		; Регистр специальных функций I/O 
.equ 	 TCCR1A	 =$2F		; Регистр управления A таймера / счётчика Т1
.equ 	 TCCR1B	 =$2E		; Регистр управления B таймера / счётчика Т1
.equ 	 TCNT1H	 =$2D		; Регистр данных таймера / счётчика Т1 ст. байт
.equ 	 TCNT1L	 =$2C		; Регистр данных таймера / счётчика Т1 мл. байт
.equ 	 OCR1AH	 =$2B		; Регистр сравнения А таймера / счётчика Т1 ст. байт
.equ 	 OCR1AL	 =$2A		; Регистр сравнения А таймера / счётчика Т1 мл. байт
.equ 	 OCR1BH	 =$29		; Регистр сравнения В таймера / счётчика Т1 ст. байт
.equ 	 OCR1BL	 =$28		; Регистр сравнения В таймера / счётчика Т1 мл. байт
.equ 	 ICR1H 	 =$27		; Регистр захвата таймера / счётчика Т1 ст. байт
.equ 	 ICR1L 	 =$26		; Регистр захвата таймера / счётчика Т1 мл. байт
.equ 	 TCCR2	 =$25		; Регистр управления таймера / счётчика Т2
.equ 	 TCNT2	 =$24		; Счётный регистр таймера / счётчика Т2
.equ 	 OCR2 	 =$23		; Регистра сравнения таймера / счётчика Т2
.equ 	 ASSR 	 =$22		; Регистр асинхронного режима
.equ 	 WDTCR 	 =$21		; Регистр сторожевого таймера
.equ 	 UBRRH	 =$20		; USART ст. байт регистра скорости в бодах ?
.equ 	 UCSRC 	 =$20		; USART Контроль(управление) и C Регистра Состояния
.equ 	 EEARH	 =$1F		; Регистр адреса EEPROM ст. байт
.equ 	 EEARL	 =$1E		; Регистр адреса EEPROM мл. байт
.equ 	 EEDR 	 =$1D		; Регистр данных EEPROM
.equ 	 EECR 	 =$1C		; Регистр управления EEPROM
.equ 	 PORTA	 =$1B		; Регистр данных порт A (выход)
.equ 	 DDRA 	 =$1A		; Регистр направления порт A
.equ 	 PINA 	 =$19		; Выводы порт A (вход)
.equ 	 PORTB	 =$18		; Регистр данных порт B (выход)
.equ 	 DDRB 	 =$17		; Регистр направления порт B
.equ 	 PINB 	 =$16		; Выводы порт B (вход)
.equ 	 PORTC	 =$15		; Регистр данных порт C (выход)
.equ 	 DDRC 	 =$14		; Регистр направления порт C
.equ 	 PINC 	 =$13		; Выводы порт C (вход)
.equ 	 PORTD	 =$12		; Регистр данных порт D (выход)
.equ 	 DDRD 	 =$11		; Регистр направления порт D
.equ 	 PIND 	 =$10		; Выводы порт D (вход)
.equ 	 SPDR 	 =$0F		; SPI Регистр Данных
.equ 	 SPSR	 =$0E		; SPI Регистр состояния
.equ 	 SPCR 	 =$0D		; SPI Регистр управления
.equ 	 UDR 	 =$0C		; USART Регистр Данных Ввода - вывода
.equ 	 UCSRA 	 =$0B		; USART Регистр состояния и управления A
.equ 	 UCSRB	 =$0A		; USART Регистр состояния и управления B
.equ 	 UBRRL	 =$09		; USART мл. байт регистра скорости в бодах
.equ 	 ACSR 	 =$08		; Регистр управления и состояния аналоговым компаратором
.equ 	 ADMUX	 =$07		; Регистр управления мультиплексором АЦП
.equ 	 ADCSRA	 =$06		; Регистр управления и состояния АЦП 
.equ 	 ADCH 	 =$05		; Ст. байт регистра данных АЦП
.equ 	 ADCL 	 =$04		; Мл. байт регистра данных АЦП
.equ 	 TWDR 	 =$03		; TWI регистр данных
.equ 	 TWAR 	 =$02		; TWI (Подчиненный) регистр адреса
.equ 	 TWSR 	 =$01		; TWI регистр состояния
.equ 	 TWBR 	 =$00		; TWI регистр скорости передачи в битах
.equ 	 RAMEND	 =$045F		; Верхняя граница области ОЗУ

.CSEG
.ORG $000

Reset:	JMP	Start		; Обработка сброса
	RJMP	INterrupt0		; Внешнее прерывание 0
	NOP
	JMP	Reset		; Внешнее прерывание 1
	JMP	Reset  		; Совпадение таймера/счётчика Т2
	JMP	Reset		; Переполнение таймера/счётчика Т2
	JMP	Reset	     	; Захват таймера/счётчика Т1
	JMP	Reset		; Совпадение А таймера/счётчика Т1
	JMP	Reset		; Совпадение В таймера/счётчика Т1
	JMP	Reset  		; Переполнение таймера/счётчика Т1
	JMP	Reset		; Переполнение таймера/счётчика Т0
	JMP	Reset		; Передача по SPI завершена
	JMP	Reset		; USART, приём завершен
	JMP	Reset		; Регистр данных USART пуст
	JMP	Reset		; USART, передача завершена
	JMP	Reset		; Преобразование АЦП завершено
 	JMP	Reset 		; EEPROM готово
	JMP	Reset            	; Аналоговый компаратор
	JMP	Reset		; Прерывание от модуля TWI
	JMP	Reset 		; Внешнее прерывание 2
	RJMP	MatchT0  		; Совпадение таймера/счётчика Т0
	NOP
	JMP	Reset		; Готовность SPM
;_______________________________________________________________________________________


Data_0:	.DB $04,$03,$09,$04
Data_1:	.DB $12,$03,'o',$00,'b',$00,'d',$00,'e',$00,'v',$00,'.',$00,'a',$00,'t',$00
Data_2:	.DB $16,$03,'P',$00,'r',$00,'o',$00,'g',$00,'r',$00,'a',$00,'m',$00,'m',$00,'e',$00,'r',$00
Data_3:	.DB $14,$03,'U',$00,'n',$00,'i',$00,'v',$00,'e',$00,'r',$00,'s',$00,'a',$00,'l',$00

Data_4:	.DB $12,$01,$10,$01,$02,$00,$00,$08,$C0,$16,$E1,$05,$00,$01,$01,$02,$03,$01
Data_5:	.DB $09,$02,$43,$00,$02,$01,$00,$80,$64,	/*Configuration*/\
	    $09,$04,$00,$00,$01,$02,$02,$01,$00,	/*Configuration*/\
	    $05,$24,$00,$10,$01,		/*CDC Header Functional*/\
	    $04,$24,$02,$02,			/*CDC Abstract Control Management Functional*/\
	    $05,$24,$06,$00,$01,		/*CDC Union Functional*/\
	    $05,$24,$01,$03,$01,		/*Interface*/\
	    $07,$05,$83,$03,$08,$00,$01,		/*In-Endpoint*/\
	    $09,$04,$01,$00,$02,$0A,$00,$00,$00,	/*Configuration*/\
	    $07,$05,$01,$02,$08,$00,$00,		/*Endpoint-Out*/\
	    $07,$05,$81,$02,$08,$00,$00,$00		/*Endpoint-In*/\

Data_6:	.DB $08,'S','T','K','5','0','0','_','2',$00

Data_s:	.DB $02,$02,$0A,$FF,$32,$19,$01,$00,$01,$FF,$F2,$FF,$FF,$FF,$01,$FF

;_______________________________________________________________________________________

Start:	LDI	R28,LOW(RAMEND)
	LDI	R29,HIGH(RAMEND)
	OUT	SPH,R29
	OUT	SPL,R28
	LDI	R26,LOW(Buffer_060)
	LDI	R27,HIGH(Buffer_060)	;R27-R26 = $0060
	; Очистка ОЗУ после включения питания или аппаратного сброса.
Start_1:	ST	-Y,R27
	CP	R28,R26
	CPC	R29,R27
	BRCC	Start_1
	LDI	R30,LOW(Data_s*2)
	LDI	R31,HIGH(Data_s*2)
	ADIW	R27:R26,16
Start_2:	LPM	R0,Z+
	ST	X+,R0
	CPI	R26,$80
	BRNE	Start_2
	; Инициализация портов ввода/вывода
	LDI	R16,$FF
	LDI	R17,$F3
	LDI	R18,$B3
	OUT	PORTD,R18
	OUT	DDRD,R17
	OUT	PORTA,R16
	OUT	DDRA,R1
	OUT	PORTB,R16
	OUT	DDRB,R1
	OUT	PORTC,R16
	OUT	DDRC,R1
	LDI	R16,$64
	LDI	R20,$B8
	LDI	R21,$0B
	SBI	DDRD,3
	; Пауза длительностью 100 мс
Start_3:	MOVW	R25:R24,R21:R20
Start_4:	SBIW	R25:R24,1
	BRNE	Start_4
	SUBI	R16,1
	BRNE	Start_3
	CBI	DDRD,3
	; Инициализация таймера T0 
	LDI	R17,$BB
	OUT	OCR0,R17		; Регистра сравнения таймера/счётчика Т0
	LDI	R18,$0B
	OUT	TCCR0,R18
	LDI	R19,$02
	OUT	TIMSK,R19
	LDI	R24,3
	OUT	MCUCR,R24
	LDI	R24,$40
	OUT	GICR,R24
	LDI	R24,$4B
	LDI	R25,$5A
	STS	Buffer_2E3,R24
	STS	Buffer_30E,R24
	STS	Buffer_2E2,R25
	STS	Buffer_30D,R25
	SEI			;Разрешить глобальное прерывание

;M0:	RCALL	Basic_2
;	RJMP	M0
;_______________________________________________________________________________________

Basic:	CLR	R1
	RCALL	In_Out_USB		;Приём по USB и ответ на запросы Setup
	LDS	R24,Buffer_067	;Принят пакет данных от ПК - $55
	CPI	R24,$55
	BRNE	Basic_2
	STS	Buffer_067,R1	;Сбросить принят пакет данных от ПК - $00
	LDI	R28,$02
	LDI	R29,$00
	LDS	R24,Code_In		;Код команды от ПК 
	STS	Code_Out,R24	;Код выполненной команды
	STS	Spool_Out,R1	;Первый байт ответа программатора на команду ПК
	SUBI	R24,1
	CPI	R24,$3C
	BRCS	Basic_1
	RCALL	Answer		;Ответ ПК на команду - Команда не поддерживается
	RJMP	Basic_2
Basic_1:	LDI	R30,LOW(Table)
	LDI	R31,HIGH(Table)	;R31-R30 + Начало таблицы векторов переходов
	ADD	R30,R24
	ADC	R31,R1
	ICALL

Basic_2:	LDS	R24,Buffer_2E2
	SBRS	R24,4
	RJMP	Basic
	LDI	R26,LOW(Buffer_2E4)
	LDI	R27,HIGH(Buffer_2E4)	;R27-R26 = $02E4
	CLR	R23
	LDS	R24,Counter_K
	LDS	R25,Counter_K+1	;Общее количество отправляемых байт по USB
Basic_3:	SBIW	R25:R24,0
	BREQ	Basic_5
	LDS	R30,Counter_N
	LDS	R31,Counter_N+1	;Счётчик отправляемых байт по USB
	ADIW	R30:R31,1
	STS	Counter_N,R30
	STS	Counter_N+1,R31	;Счётчик отправляемых байт по USB
	CP	R30,R24
	CPC	R31,R25
	BRCS	Basic_4
	CLR	R24
	CLR	R25
	STS	Counter_N,R24
	STS	Counter_N+1,R25	;Счётчик отправляемых байт по USB
	STS	Counter_K,R24
	STS	Counter_K+1,R25	;Общее количество отправляемых байт по USB
Basic_4:	SUBI	R30,$51
	SBCI	R31,$FE		;R31-R30 - (R31-R30 + $01AF)
	LD	R17,Z
	ST	X+,R17
	INC	R23
	CPI	R23,$08
	BRNE	Basic_3
Basic_5:	LDS	R22,Buffer_069	;$00 или количество передаваемых байт до $08
	OR	R22,R23
	BREQ	Basic_7
Basic_6:	STS	Buffer_069,R23	;$00 или количество передаваемых байт до $08
	LDI	R26,LOW(Buffer_2E2)
	LDI	R27,HIGH(Buffer_2E2)	;NAK = $5A или количество передаваемых байт до $0C
	MOV	R22,R23		;Количество передаваемых байт
	SUBI	R23,$FC		;R23 + 4
	ST	X+,R23		;Количество передаваемых байт + 4
	LD	R24,X
	LDI	R25,$88
	EOR	R24,R25
	ST	X+,R24
	RCALL	CRC16		;Подсчёт контрольной суммы CRC16
Basic_7:	RJMP	Basic

;___________ Приём по USB и ответ на запросы Setup _____________________________________

In_Out_USB:	LDS	R22,Buffer_2F3
	SUBI	R22,3
	SBRC	R22,7		;Принято более 3х байт ?
	RJMP	Out_USB_5
	LDS	R24,Buffer_2F0
	LDI	R30,LOW(Buffer_303)
	LDI	R31,HIGH(Buffer_303)
	SUB	R30,R24
	SBC	R31,R1		;R31-R30 = $0303 - R24 
	LDS	R24,Buffer_2EF
	CPI	R24,$10
	BRCC	Out_USB
	MOV	R17,R22
USB_In:	LD	R18,Z+
	RCALL	USB_Data		;Проверка принята ли преамбула и блок данных
	SUBI	R17,1
	BRNE	USB_In
USB_In_1:	RJMP	Out_USB_4

Out_USB:	LDI	R28,LOW(Buffer_2D8)
	LDI	R29,HIGH(Buffer_2D8)	;R29-R28 = $02D8
	CPI	R24,$2D
	BREQ	Out_USB_1
	LDS	R24,Buffer_068	;$00,$40,$80
	SBRS	R24,7
	RJMP	Out_USB_4
	RJMP	Out_USB_2
Out_USB_1:	CPI	R22,$08		;Принят запрос Setup ?
	BRNE	USB_In_1

;___________ Ответ на запросы Setup ____________________________________________________

Setup:	LDI	R24,$C3
	STS	Buffer_2D7,R24	;Пакет Data0 = $C3
	LDI	R25,$5A
	STS	Buffer_060,R25	;NAK = $5A или количество передаваемых байт до $0C
	STS	Buffer_068,R1	;$00,$40,$80
	LDD	R25,Z+0
	LDD	R24,Z+1
	LDD	R23,Z+2
	LDD	R22,Z+3
	LDD	R21,Z+6
	LDD	R20,Z+7
	MOV	R17,R25
	ANDI	R25,$60
	BREQ	Setup_2
	CLR	R18
	CPI	R25,$20
	BRNE	Setup_1
	LDS	R19,Buffer_2D6
	TST	R19
	BRNE	Setup_1
	CPI	R24,$22
	BRCC	Setup_1
	STS	Buffer_2D5,R1
	SER	R18
	SBRC	R17,7
	MOV	R18,R21
	LDI	R19,$80
	STS	Buffer_068,R19	;$00,$40,$80
	RJMP	Setup_19
Setup_1:	RJMP	Setup_18

Setup_2:	TST	R24
	BRNE	Setup_3
	LDI	R18,$02
	RJMP	Setup_16

Setup_3:	CPI	R24,$05
	BRNE	Setup_4
	STS	Buffer_2F4,R23	;Собственный адрес на шине USB
	RJMP	Setup_15

Setup_4:	CPI	R24,$06
	BRNE	Setup_6
	CPI	R22,1
	BRNE	Setup_5
	LDI	R24,LOW(Data_4*2)
	LDI	R25,HIGH(Data_4*2)	;Device Descriptor
	LDI	R18,$12
	RJMP	Setup_13

Setup_5:	CPI	R22,$02
	BRNE	Setup_9
	LDI	R24,LOW(Data_5*2)
	LDI	R25,HIGH(Data_5*2)	;Configuration
	LDI	R18,$43
	RJMP	Setup_13

Setup_6:	LDI	R18,$01
	CPI	R24,$08
	BRNE	Setup_7
	LDI	R24,LOW(Buffer_2F6)
	LDI	R25,HIGH(Buffer_2F6)	;R25-R24 = $02F6
	RJMP	Setup_17

Setup_7:	CPI	R24,$09
	BRNE	Setup_8
	RJMP	Setup_15

Setup_8:	CPI	R24,$0A
	BRNE	Setup_14
	RJMP	Setup_16

Setup_9:	CLR	R18
	CPI	R22,$03
	BRNE	Setup_13
	TST	R23
	BRNE	Setup_10
	LDI	R24,LOW(Data_0*2)
	LDI	R25,HIGH(Data_0*2)	;Get Descriptor(String)
	LDI	R18,$04
	RJMP	Setup_13

Setup_10:	CPI	R24,$01
	BRNE	Setup_11
	LDI	R24,LOW(Data_1*2)
	LDI	R25,HIGH(Data_1*2)	;obdev.at
	LDI	R18,$12
	RJMP	Setup_13

Setup_11:	CPI	R24,$02
	BRNE	Setup_12
	LDI	R24,LOW(Data_2*2)
	LDI	R25,HIGH(Data_2*2)	;Programmer
	LDI	R18,$16
	RJMP	Setup_13

Setup_12:	CPI	R24,$03
	BRNE	Setup_13
	LDI	R24,LOW(Data_3*2)
	LDI	R25,HIGH(Data_3*2)	;Universal
	LDI	R18,$14
Setup_13:	LDI	R26,$40
	STS	Buffer_068,R26	;$00,$40,$80
	RJMP	Setup_17

Setup_14:	CPI	R24,$0B
	BRNE	Setup_15
	LDI	R24,$4B
	STS	Buffer_2E3,R24
	STS	Buffer_30E,R24
Setup_15:	CLR	R18
Setup_16:	LDI	R24,LOW(Buffer_2E0)
	LDI	R25,HIGH(Buffer_2E0)	;R25-R24 = $02E0
Setup_17:	STS	Buffer_2F2,R25
	STS	Buffer_2F1,R24
Setup_18:	TST	R20
	BRNE	Setup_19
	CP	R21,R18
	BRCS	Setup_20
Setup_19:	MOV	R21,R18
Setup_20:	STS	Buffer_061,R21	;$00,$FF
	RJMP	Out_USB_4

;___________ Ответ на запросы Setup и приём по USB _____________________________________

Out_USB_2:	LDS	R24,Buffer_2D5
	STS	Buffer_061,R1	;$00,$FF
	TST	R24
	BRNE	Out_USB_4
	MOVW	R27:R26,R29:R28	;R27-R26 = $02D8
	LDI	R24,$07
Out_USB_3:	LD	R25,Z+
	ST	X+,R25
	SUBI	R24,1
	BRNE	Out_USB_3
Out_USB_4:	STS	Buffer_2F3,R1
Out_USB_5:	LDS	R24,Buffer_060	;NAK = $5A или количество передаваемых байт до $0C
	SBRS	R24,4
	RJMP	Out_USB_13
	LDS	R24,Buffer_061	;$00,$FF
	CPI	R24,$FF
	BRNE	Out_USB_6
	RJMP	Out_USB_13

Out_USB_6:	MOV	R17,R24
	CPI	R24,$09
	BRCS	Out_USB_7
	LDI	R17,$08
Out_USB_7:	MOVW	R27:R26,R29:R28	;R27-R26 = $02D8
	SUB	R24,R17
	STS	Buffer_061,R24	;$00,$FF
	TST	R17
	BREQ	Out_USB_11
	LDS	R24,Buffer_068	;$00,$40,$80
	SBRS	R24,7
	RJMP	Out_USB_8
	LDI	R17,$07
	LDS	R24,Buffer_2D5
	TST	R24
	BREQ	Out_USB_11
	CLR	R17
	RJMP	Out_USB_11

Out_USB_8:	LDS	R18,Buffer_2F1
	LDS	R19,Buffer_2F2
	MOVW	R31:R30,R19:R18
	ADD	R18,R17
	ADC	R19,R1
	STS	Buffer_2F1,R18
	STS	Buffer_2F2,R19
	MOV	R25,R17
	SBRS	R24,6
	RJMP	Out_USB_10
Out_USB_9:	LPM	R24,Z+
	ST	X+,R24
	SUBI	R25,1
	BRNE	Out_USB_9
	RJMP	Out_USB_11

Out_USB_10:	LD	R24,Z+
	ST	X+,R24
	SUBI	R25,1
	BRNE	Out_USB_10
Out_USB_11:	MOVW	R27:R26,R29:R28	;R27-R26 = $02D8
	LDS	R24,Buffer_2D7
	LDI	R25,$88
	EOR	R24,R25
	STS	Buffer_2D7,R24	;Пакет Data0 = $C3 или Data1 = $4B
	MOV	R22,R17		;Количество передаваемых байт
	RCALL	CRC16		;Подсчёт контрольной суммы CRC16
	SUBI	R17,$FC		;Количество передаваемых байт + 4
	CPI	R17,$0C
	BREQ	Out_USB_12
	SER	R24
	STS	Buffer_061,R24	;$00,$FF
Out_USB_12:	STS	Buffer_060,R17	;NAK = $5A или количество передаваемых байт до $0C
Out_USB_13:	LDI	R25,$14
Out_USB_14:	IN	R24,PIND
	ANDI	R24,$0C
	BRNE	Out_USB_15
	SUBI	R25,1
	BRNE	Out_USB_14
	STS	Buffer_2F4,R1	;Собственный адрес на шине USB
	STS	Buffer_2EE,R1	;Собственный адрес на шине USB
Out_USB_15:	RETI

;___________ Подсчёт контрольной суммы CRC16 полином $A001 _____________________________

CRC16:	CLR	R24
	CLR	R25
	LDI	R20,$01
	LDI	R21,$A0
	COM	R22		;R22 количество байт данных
CRC16_1:	SUBI	R22,$FF		;R22 + 1
	BRCC	CRC16_3
	LD	R18,X+
	LDI	R19,$F8
	EOR	R24,R18
CRC16_2:	ROR	R25
	ROR	R24
	BRCS	loc_215
	EOR	R24,R20
	EOR	R25,R21
loc_215:	SUBI	R19,$FF
	BRCS	CRC16_2
	RJMP	CRC16_1
CRC16_3:	ST	X+,R24
	ST	X+,R25		;R25-R24 контрольная сумма CRC16
	RET

;___________ Проверка принята ли преамбула  и блок данных ______________________________

USB_Data:	TST	R11		;Счётчик таймера Т0 - 63 мс * R11
	BRNE	USB_Data_1
	STS	Buffer_080,R1
	STS	Buffer_081,R1
USB_Data_1:	LDS	R28,Buffer_080	;Количество принятых байт данных мл. байт
	LDS	R29,Buffer_081	;Количество принятых байт данных ст. байт
	SBIW	R29:R28,0
	BRNE	USB_Data_2
	CPI	R18,$1B		;Код начала преамбулы $1B
	BRNE	USB_Data_4
	STS	Preamble_I,R18
	LDI	R28,$01
	LDI	R29,$00
	STS	Buffer_080,R28	;Количество принятых байт данных мл. байт
	STS	Buffer_081,R29	;Количество принятых байт данных ст. байт
	RJMP	USB_Data_4

USB_Data_2:	LDI	R19,$01
	CPI	R28,$19
	CPC	R29,R19
	BRCC	USB_Data_3
	SUBI	R28,$6E
	SBCI	R29,$FF		;R29-R28 = R31-R30 + (Preamble_I = $0092)
	STD	Y+0,R18
	SUBI	R28,$92
	SBCI	R29,$00		;R29-R28 = R31-R30 - (Preamble_I = $0092)
	ADIW	R29:R28,1
	STS	Buffer_080,R28	;Количество принятых байт данных мл. байт
	STS	Buffer_081,R29	;Количество принятых байт данных ст. байт
	CPI	R28,$05
	CPC	R29,R1
	BRCS	USB_Data_4
	BRNE	USB_Data_5
	CPI	R18,$0E		;Код оканчания преамбулы $0E
	BRNE	USB_Data_3
	LDS	R28,Amount_Il	;Количество принимаемых байт данных мл. байт от ПК
	LDS	R29,Amount_Ih	;Количество принимаемых байт данных ст. байт от ПК
	ADIW	R29:R28,6
	STS	Buffer_082,R28
	STS	Buffer_083,R29	;Общее количество принимаемых байт данных
	SUBI	R28,$1A
	SBCI	R29,1
	BRCS	USB_Data_4
USB_Data_3:	STS	Buffer_080,R1	;Количество принятых байт данных мл. байт
	STS	Buffer_081,R1	;Количество принятых байт данных ст. байт
USB_Data_4:	LDI	R24,$C8
	MOV	R11,R24		;Счётчик таймера Т0 - 63 мс * R11
	RET

USB_Data_5:	LDS	R24,Buffer_082
	LDS	R25,Buffer_083	;Общее количество принимаемых байт данных
	CP	R28,R24
	CPC	R29,R25
	BRNE	USB_Data_4
	; Принят пакет данных от ПК
	CLR	R25
	LDI	R26,LOW(Preamble_I)
	LDI	R27,HIGH(Preamble_I)	;R27-R26 = Preamble_I
	SBIW	R29:R28,0
	BREQ	USB_Data_7
USB_Data_6:	LD	R24,X+
	EOR	R25,R24
	SBIW	R29:R28,1
	BRNE	USB_Data_6
	TST	R25
	BREQ	USB_Data_7
	; Принят пакет данных от ПК с ошибкой
	LDI	R24,$B0
	STS	Code_Out,R24	;Код выполненной команды
	RCALL	Answer_1		;Ответ ПК
	RJMP	USB_Data_4
	; Принят пакет данных от ПК без ошибок
USB_Data_7:	LDI	R24,$55
	STS	Buffer_067,R24	;Принят пакет данных от ПК - $55
	RJMP	USB_Data_3

;___________ Ответ программатора на команду ____________________________________________

Answer:	LDI	R24,$C0
Answer_1:	LDI	R28,$02
	LDI	R29,$00
Answer_2:	STS	Spool_Out,R24	;Первый байт ответа программатора на команду ПК
Answer_3:	LDI	R18,$1B
	LDI	R30,LOW(Preamble_O)
	LDI	R31,HIGH(Preamble_O)	;Адрес - Код преамбулы $1B
	STD	Z+0,R18		;Код начала преамбулы $1B
	LDS	R18,Number_I	;Порядковый номер команды в принятом сообщении по USB
	STD	Z+1,R18		;Порядковый номер команды в принятом сообщении по USB 
	STD	Z+2,R29		;Количество передаваемых байт данных ст. байт
	STD	Z+3,R28		;Количество передаваемых байт данных мл. байт
	LDI	R18,$0E
	STD	Z+4,R18		;Код оканчания преамбулы $0E
	ADIW	R29:R28,6
	STS	Counter_K,R28
	STS	Counter_K+1,R29	;Общее количество отправляемых байт по USB
	SBIW	R29:R28,1
	CLR	R25
	STS	Counter_N,R25
	STS	Counter_N+1,R25	;Счётчик отправляемых байт по USB
Answer_4:	LD	R24,Z+		;Подсчёт контрольной суммы отправляемых байт по USB
	EOR	R25,R24
	SBIW	R29:R28,1
	BRNE	Answer_4
	STD	Z+0,R25
	RET
;_______________________________________________________________________________________

.INCLUDE "Interrupt.asm"
