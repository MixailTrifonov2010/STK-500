



.DEVICE ATmega16			;С кварцем на 7,3728 Мгц

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
	JMP	Reset		; Внешнее прерывание 0	
	JMP	Reset		; Внешнее прерывание 1
	JMP	Reset  		; Совпадение таймера/счётчика Т2
	JMP	Reset		; Переполнение таймера/счётчика Т2
	JMP	Reset	     	; Захват таймера/счётчика Т1
	JMP	Reset		; Совпадение А таймера/счётчика Т1
	JMP	Reset		; Совпадение В таймера/счётчика Т1
	JMP	Reset  		; Переполнение таймера/счётчика Т1
	JMP	Reset		; Переполнение таймера/счётчика Т0
	JMP	Reset		; Передача по SPI завершена
	RJMP	US_rxc		; USART, приём завершен
	NOP
	RJMP	Us_udre		; Регистр данных USART пуст
	NOP
	JMP	Reset		; USART, передача завершена
	JMP	Reset		; Преобразование АЦП завершено
 	JMP	Reset 		; EEPROM готово
	JMP	Reset            	; Аналоговый компаратор
	JMP	Reset		; Прерывание от модуля TWI
	JMP	Reset 		; Внешнее прерывание 2
	RJMP	MatchT0  		; Совпадение таймера/счётчика Т0
	NOP
	JMP	Reset		; Готовность SPM

Data_1:	.DB $00,$08,'S','T','K','5','0','0','_','2'

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
Start_2:	LPM	R0,Z+
	ST	X+,R0
	CPI	R26,$70
	BRNE	Start_2
	; Инициализация портов ввода/вывода
	LDI	R16,$6C
	OUT	PORTD,R16		;Cигналы Reset=0,12v-выкл,Xtpl1=1
	LDI	R16,$BE
	OUT	DDRD,R16
	OUT	DDRA,R29
	LDI	R16,$FF
	OUT	PORTA,R16
	OUT	DDRB,R29
	OUT	PORTB,R29
	OUT	DDRC,R29
	OUT	PORTC,R29
	; Инициализация таймера Т0
	LDI	R16,$72
	OUT	OCR0,R16
	LDI	R16,$02
	OUT	TIMSK,R16
	LDI	R16,$0B
	OUT	TCCR0,R16
	; Инициализация USART
	LDI	R16,3
	OUT	UBRRL,R16
	LDI	R16,$98
	OUT	UCSRB,R16

;___________ Выбор подпрограммы ________________________________________________________

Select:	SEI			;Разрешить глобальные прерывания
	LDI	R28,$60
	LDI	R29,$00         	;Начло области ОЗУ
	LDD	R16,Y+$1B		;Ошибка в принятом сообщении ($01)
	TST	R16
	BREQ	Select_1
	RCALL	Leader_4		;Передача преамбулы 4
	LDI	R16,$B0
	RCALL	Usart_out		;Отправить байт из R16 по USART
	LDI	R16,$C1
	RCALL	Usart_out		;Отправить байт из R16 по USART
	RJMP	Sel_out
Select_1:	LDD	R17,Y+$1A		;Принят пакет данных ($01)
	TST	R17
	BREQ	Select
Select_2:	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	MOV	R14,R16		;Код команды принятый от ПК
	STD	Y+$1E,R29		;Счётчик записанных байт в буфер USART
	STD	Y+$1F,R29		;Счётчик переданных байт по USART
	DEC	R16
	CPI	R16,$3C
	BRCS	Select_3
	RCALL	Table_err
	RJMP	Sel_out
Select_3:	LDI	R30,LOW(Table)
	LDI	R31,HIGH(Table)
	ADD	R30,R16
	ADC	R31,R29
	ICALL

Sel_out:	LDD	R16,Y+$1D		;Контрольная сумма отправленного сообщеня по USART 
	RCALL	Usart_out		;Отправить байт из R16 по USART
	STD	Y+$12,R29
	STD	Y+$13,R29		;Счётчик принимаемых байт данных по USART
	STD	Y+$14,R29
	STD	Y+$15,R29		;Счётчик обработанных байт данных принятых по USART
	STD	Y+$1D,R29		;Контрольная сумма отправленного сообщения по USART 
	STD	Y+$1C,R29		;Контрольная сумма принятого сообщеня по USART 
	STD	Y+$1B,R29		;Сбросить ошибку в принятом сообщении ($00)
	STD	Y+$1A,R29		;Сбросить - Принят пакет данных ($00)
	STD	Y+$19,R29		;Номер байта принятой преамбулы
	RJMP	Select

;___________ Таблица векторов переходов ________________________________________________

Table:	RJMP	Name_out		;Ответ ПК - STK500-2
	RJMP	Rate_WR		;Настройка скорости таймера Т2
	RJMP	Rate_RD		;Чтение скорости программирования
	RJMP	Table_err		;Команда не поддерживается
	RJMP	Table_err		;Проверка на наличия МК в режиме LVSP
	RJMP	Burn		;Сохранить текущий адрес 4 байта
	RJMP	Table_err		;Команда не поддерживается
	RJMP	Table_err		;Команда не поддерживается
	RJMP	Table_err		;Команда не поддерживается
	RJMP	Table_err		;Команда не поддерживается

	RJMP	Table_err		;Команда не поддерживается
	RJMP	Table_err		;Команда не поддерживается
	RJMP	Table_err		;Команда не поддерживается
	RJMP	Table_err		;Команда не поддерживается
	RJMP	Table_err		;Команда не поддерживается
	RJMP	Start_spi		;Ввод в режим LVSP
	RJMP	Spi_close		;Последняя команда от ПК  в режиме LVSP завершена 
	RJMP	Chip_erase		;Стирание кристалла в режиме LVSP
	RJMP	WR_spi_Fla		;Запись во Flash память в режиме LVSP
	RJMP	M_spi_rw_1		;Чтение Flash памяти в режиме LVSP

	RJMP	WR_spi_Eep		;Запись в EEPROM в режиме LVSP
	RJMP	M_spi_rw		;Чтение EEPROM памяти в режиме LVSP
	RJMP	F_defense		;Запись конфигурационных ячеек в режиме LVSP
	RJMP	Sign_LVSP		;Чтение конфигурационных ячеек в режиме LVSP
	RJMP	F_defense		;Запись ячеек защиты в режиме LVSP
	RJMP	Sign_LVSP		;Чтение байта защиты в режиме LVSP
	RJMP	Sign_LVSP		;Чтение сигнатуры микроконтроллера в режиме LVSP
	RJMP	Sign_LVSP		;Чтение калибровочной ячейки в режиме LVSP
	RJMP	In_Out_Port		;Управление портами A,B,C, сигналом Reset и +5v
	RJMP	Table_err		;Команда не поддерживается

	RJMP	Table_err		;Команда не поддерживается
	RJMP	Start_HVPP		;Ввод микроконтроллера в режиме HVPP
	RJMP	HVPP_close		;Последняя команда от ПК в режиме HVPP завершена 
	RJMP	Erase_HVPP		;Стирание кристалла в режиме HVPP
	RJMP	WR_F_HVPP		;Запись во Flash память в режиме HVPP
	RJMP	RD_F_HVPP		;Чтение Flash памяти в режиме HVPP
	RJMP	WR_E_HVPP		;Запись в EEPROM в режиме HVPSP
	RJMP	RD_E_HVPP		;Чтение EEPROM памяти в режиме HVPP
	RJMP	Conf_PPw		;Запись конфигурационных ячеек в режиме HVPP
	RJMP	Conf_PPr		;Чтение конфигурационных ячеек в режиме HVPP

	RJMP	Prot_PPw		;Запись байта защиты по HVPP	
	RJMP	Prot_PPr		;Чтение байта защиты по HVPP
	RJMP	Sign_HVPP		;Чтение сигнатуры микроконтроллера в режиме HVPP
	RJMP	Calibr_PP		;Чтение калибровочной ячейки в режиме HVPP
	RJMP	Copy_32		;Копировать коды команд высоковольтного программирования 32 байта
	RJMP	Table_err		;Команда не поддерживается
	RJMP	Table_err		;Команда не поддерживается
	RJMP	Start_HVSP		;Ввод микроконтроллера в режиме HVSP
	RJMP	HVSP_close		;Последняя команда от ПК в режиме HVSP завершена 
	RJMP	Erase_HVSP		;Стирание кристалла в режиме HVSP

	RJMP	WR_F_HVSP		;Запись Flash памяти в режиме HVSP
	RJMP	RD_F_HVSP		;Чтение Flash памяти в режиме HVSP
	RJMP	WR_E_HVSP		;Запись EEPROM памяти в режиме HVSP
	RJMP	RD_E_HVSP		;Чтение EEPROM памяти в режиме HVSP
	RJMP	Conf_SPw		;Запись конфигурационных ячеек в режиме HVSP
	RJMP	Conf_SPr		;Чтение конфигурационных ячеек в режиме HVSP
	RJMP	Prot_SPw		;Запись байта защиты в режиме HVSP
	RJMP	Prot_SPr		;Чтение байта защиты в режиме HVSP
	RJMP	Sign_HVSP		;Чтение сигнатуры в режиме HVSP
	RJMP	Calibr_SP		;Чтение калибровочной ячейки в режиме HVSP

Table_err:	LDI	R16,1
	RCALL	Leader_5		;Передача преамбулы 5
	LDI	R16,$C9
	RJMP	Usart_out		;Отправить байт из R16 по USART

;___________ Ответ ПК - STK500-2 _______________________________________________________

Name_out:	LDI	R16,$0B
	RCALL	Leader_5		;Передача преамбулы 5
	LDI	R30,LOW(Data_1*2)
	LDI	R31,HIGH(Data_1*2)
	LDI	R19,$0A
Name_out_1:	LPM	R16,Z+
	RCALL	Usart_out		;Отправить байт из R16 по USART
	DEC	R19
	BRNE	Name_out_1
	RET

;___________ Настройка скорости SPI и периода таймера Т2 _______________________________

Rate_WR:	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	MOV	R30,R25
	RCALL	Leader_4		;Передача преамбулы 4
	ANDI	R30,$0F
	CLR	R31
	CPI	R30,$06
	BRNE	Rate_WR_1
	ANDI	R24,$07
Rate_WR_1:	CPI	R30,$0E
	BRNE	Rate_WR_3
	TST	R24
	LDD	R24,Z+$00
	BREQ	Rate_WR_2
	ORI	R24,8
	RJMP	Rate_WR_3
Rate_WR_2:	ANDI	R24,$F7
Rate_WR_3:	SUBI	R30,$A0
	SBCI	R31,$FF		;R31-R30 + $0060
	STD	Z+$00,R24
	RJMP	Usart_00		;Отправить $00 по USART

;___________ Чтение скорости программирования по SPI ___________________________________
	; Результат АЦП преобразований, Опрос 74HC597,Скорость таймера Т2
	; Скорость по SPI интефейсу,Состояние порта В
Rate_RD:	IN	R16,PINB
	STD	Y+$0D,R16
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	MOV	R30,R16
	ANDI	R30,$1F
	CLR	R31
	SBRC	R30,4	
	RJMP	Rate_RD_1
	LDI	R16,$09
	TST	R30
	BREQ	Rate_RD_2		;Передача преамбулы 5 и отправить $00 по USART
	CLR	R16
	RJMP	Rate_RD_2		;Передача преамбулы 5 и отправить $00 по USART
Rate_RD_1:	ANDI	R30,$0F
	SUBI	R30,$A0
	SBCI	R31,$FF		;R31-R30 + $0060
	LDD	R16,Z+$00
Rate_RD_2:	MOV	R24,R16
	LDI	R16,$03
	RCALL	Leader_5		;Передача преамбулы 5
	RCALL	Usart_00		;Отправить $00 по USART
	MOV	R16,R24
	RJMP	Usart_out		;Отправить байт из R16 по USART

;___________ Сохранить текущий адрес 4 байта ___________________________________________

Burn:	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	STS	Buffer_0A0+2,R24
	STS	Buffer_0A0+3,R25
	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	STS	Buffer_0A0,R24
	STS	Buffer_0A0+1,R25
	RJMP	Lead4_00		;Передача преамбулы 4 и $00 в USART

;___________ Копировать коды команд высоковольтного программирования 32 байта __________

Copy_32:	LDI	R26,$80
	LDI	R27,$00
	LDI	R20,$20
Copy_32_1:	RCALL	Read_10_1		;Чтение из ОЗУ N байт и запись по адресу в R27-R26
	RJMP	Lead4_00		;Передача преамбулы 4 и $00 в USART

;___________ Управление портами A,B,C, сигналом Reset и +5v ____________________________

In_Out_Port:LDI	R20,$07
	RCALL	Read_N_byt		;Чтение из ОЗУ семи байт в R0-R6
	IN	R7,PINA
	IN	R8,PINB
	IN	R9,PINC
	IN	R10,PIND
	OUT	DDRA,R0		;Настойка линий порта А
	OUT	PORTA,R1		;Выдать принятый байт в порт А (вкл/выкл подтяжки)
	OUT	DDRB,R2		;Настойка линий порта B
	OUT	PORTB,R3		;Выдать принятый байт в порт B (вкл/выкл подтяжки)
	OUT	DDRC,R4		;Настойка линий порта C
	OUT	PORTC,R5		;Выдать принятый байт в порт C (вкл/выкл подтяжки)
	MOV	R17,R6
	ANDI	R17,$24
	IN	R16,PORTD
	ANDI	R16,$DB
	OR	R16,R17
	OUT	PORTD,R16		;Вкл/выкл +5v (PIND5 0-вкл, 1-выкл. PIND2=0 то Reset=1, PIND2=1 то Reset=0)
	LDI	R16,$07
	RCALL	Leader_5		;Передача преамбулы 5
	RCALL	Usart_00		;Отправить $00 по USART
	MOV	R16,R7
	RCALL	Usart_out		;Отправить состояние порта А (ввод) по USART
	MOV	R16,R8
	RCALL	Usart_out		;Отправить состояние порта B (ввод) по USART
	MOV	R16,R9
	RCALL	Usart_out		;Отправить состояние порта C (ввод) по USART
	MOV	R16,R10
	RJMP	Usart_out		;Отправить состояние порта D (ввод) по USART

;___________ Отправка преамбулы и информацирнных байт по USART _________________________

Leader_0:	RCALL	Hvsp_m7		;Выдать в МК R17-команда,R16-данные,передача преамбулы 0
Leader_1:	MOVW	R17:R16,R25:R24	;Передача преамбулы 1
Leader_2:	SUBI	R16,$FD		;Передача преамбулы 2
	SBCI	R17,$FF		;R17-R16 + 3
Leader_3:	RCALL	Leader_6		;Передача преамбулы 3
	RJMP	Usart_00		;Отправить $00 по USART

Leader_4:	LDI	R16,$02		;Передача преамбулы 4
Leader_5:	LDI	R17,$00		;Передача преамбулы 5
	; Отправить по USART - $1B,(Y+$18),R17,R16,$0E,код команды
Leader_6:	PUSH	R25
	PUSH	R24
	MOVW	R25:R24,R17:R16
	LDI	R16,$1B
	RCALL	Usart_out		;Отправить байт из R16 по USART
	LDD	R16,Y+$18		;Порядковый номер команды в принятом сообщении по USART
	RCALL	Usart_out		;Отправить байт из R16 по USART
	MOV	R16,R25
	RCALL	Usart_out		;Отправить байт из R16 по USART
	MOV	R16,R24
	RCALL	Usart_out		;Отправить байт из R16 по USART
	LDI	R16,$0E
	RCALL	Usart_out		;Отправить байт из R16 по USART
	MOV	R16,R14		;Код команды принятой от ПК
	RCALL	Usart_out		;Отправить байт из R16 по USART
	POP	R24
	POP	R25
	RET

;___________ Инкрементирование текущего адреса FLASH или Eeprom памяти _________________

Addr_Inc:	LDS	R16,Buffer_0A0
	OUT	PORTB,R16
Addr_Inc1:	LDS	R16,Buffer_0A0
	LDS	R17,Buffer_0A0+1
	LDS	R18,Buffer_0A0+2	;Текущий адрес Flash или Eeprom памяти
	SUBI	R16,$FF
	SBCI	R17,$FF
	SBCI	R18,$FF		;R18-R16 + 1
	STS	Buffer_0A0,R16
	STS	Buffer_0A0+1,R17
	STS	Buffer_0A0+2,R18	;Текущий адрес Flash или Eeprom памяти
	RET

;___________ Чтение из ОЗУ N байт в R0-Rn ______________________________________________

Read_N_byt:	LDI	R27,$00
	LDI	R26,$00
Read_10_1:  MOVW	R19:R18,R27:R26
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
            MOVW	R27:R26,R19:R18
	ST	X+,R16
	DEC	R20
	BRNE	Read_10_1
	RET

;___________ Чтение из ОЗУ двух байт в R25-R24 _________________________________________

Read_2byte:	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	MOV	R25,R16
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	MOV	R24,R16
	RET

;___________ Чтение из ОЗУ байта в R16 _________________________________________________

Read_byte:	LDD	R16,Y+$12
	LDD	R17,Y+$13		;Счётчик принимаемых байт данных по USART
	LDD	R26,Y+$14
	LDD	R27,Y+$15		;Счётчик обработанных байт данных принятых по USART
	CP	R16,R26
	CPC	R17,R27
	BREQ	Read_byte
	ADIW	R27:R26,1
	STD	Y+$14,R26
	STD	Y+$15,R27		;Счётчик обработанных байт данных принятых по USART
	SUBI	R26,$01
	SBCI	R27,$FF		;R27-R26 + $00FF
	LD	R16,X
	RET
;_______________________________________________________________________________________

.INCLUDE "LVSP-spi.asm"

