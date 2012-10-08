

;____________ Введение микроконтроллера в режим последовательного программирования _____

Start_spi:	RCALL	Init_T2		;Инициализация таймера Т2 и SPI интерфейса
	SBI	PORTD,3		;Выключить +12v 
	LDI	R20,$0B
	RCALL	Read_N_byt		;Чтение из ОЗУ одинадцати байт в R0-R10
Start_spi1:	CBI	PORTD,5		;Включить +5v
	CBI	PORTD,2		;Cигнал Reset = 0 (на базу VT5)
	MOV	R16,R1
	RCALL	Delay		;Пауза длительностью 1 мс * (R16+1)
	LDI	R16,$B0
	OUT	DDRB,R16
	OUT	PORTB,R29
	SBI	PORTD,2		;Cигнал Reset = 1 (на базу VT5)
	MOV	R16,R1
	RCALL	Delay		;Пауза длительностью 1 мс * (R16+1)
	DEC	R3
	BREQ	Start_spi5
	MOV	R16,R7
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	MOV	R16,R8
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	MOV	R16,R9
	RCALL	Spi_In_Out		;Передать/принять байт по SPI интерфейсу
	MOV	R0,R16
	MOV	R16,R10
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	MOV	R2,R16
	MOV	R16,R6
	CPI	R16,3
	BRNE	Start_spi2
	MOV	R2,R0
	RJMP	Start_spi3
Start_spi2:	TST	R16
	BREQ	Start_spi4
Start_spi3:	CP	R2,R5
	BRNE	Start_spi1
Start_spi4:	RJMP	Lead4_00		;Передача преамбулы 4 и $00 в USART
Start_spi5:	RCALL	Leader_4		;Передача преамбулы 4
	RCALL	Usart_C0		;Отправить $C0 по USART
	RJMP	Spi_close1		;Подать/снять сигнал Reset на МК и выключить +12v

;___________ Последняя команда от ПК завершена _________________________________________

Spi_close:	RCALL	Lead4_00		;Передача преамбулы 4 и $00 в USART
Spi_close1:	SBI	PORTD,5		;Выключить +5v
	OUT	DDRB,R29
	OUT	PORTB,R29
	OUT	TCCR2,R29		;Выключить таймер Т2
	OUT	SPCR,R29		;Выключить аппартный SPI интерфейс
	OUT	TCCR1A,R29	
	OUT	TCCR1B,R29		;Выключить таймер Т1
	CBI	PORTD,2		;Cигнал Reset = 0 (на базу VT5)
	RET

;___________ Стирание кристалла ________________________________________________________

Chip_erase:	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	MOV	R16,R25
	RCALL	Delay		;Пауза длительностью 1 мс * (R16+1)
Ch_erase2:	RCALL	Ram_Spi_4		;Четыре байта из ОЗУ передать по SPI
	TST	R24
	BREQ	Ch_erase3
	RCALL	RDY_Lvsp		;Чтение флага готовности программиремого контроллера
	BREQ	Ch_erase4
	RCALL	Leader_4		;Передача преамбулы 4
	LDI	R16,$80
	RJMP	Usart_out		;Отправить байт из R16 по USART
Ch_erase3:	MOV	R16,R25
	RCALL	Delay		;Пауза длительностью 1 мс * (R16+1)
Ch_erase4:	RJMP	Lead4_00		;Передача преамбулы 4 и $00 в USART

;___________ Запись фьюзов и ячеек защиты ______________________________________________

F_defense:	RCALL	Ram_Spi_4		;Четыре байта из ОЗУ передать по SPI
	LDI	R16,$03
	LDI	R17,$00
	RCALL	Leader_3		;Передача преамбулы 3
	RJMP	Usart_00		;Отправить $00 по USART

;___________ Чтение сигнатуры микроконтроллера по SPI __________________________________
	; ячеек защиты, идентификатора, конфигурационных ячеек и калибровчной
	; ячейки генератора
Sign_LVSP:	RCALL	Read_byte
	MOV	R24,R16		;Чтение из ОЗУ байта в R24
	RCALL	Ram_Spi_3		;Три байта из ОЗУ передать по SPI
	MOV	R9,R16
	RCALL	Spi_Out_00		;Принять байт по SPI интерфейсу
	MOV	R8,R16
	LDI	R16,$04
	LDI	R17,$00
	RCALL	Leader_3		;Передача преамбулы 3
	CPI	R24,3
	BRNE	Sign_LVSP2
	MOV	R16,R9
	RJMP	Sign_LVSP3
Sign_LVSP2:	MOV	R16,R8
Sign_LVSP3:	RCALL	Usart_out		;Отправить байт из R16 по USART
	RJMP	Usart_00		;Отправить $00 по USART

;___________ Запись в EEPROM или Flash по SPI __________________________________________

WR_spi_Fla:	LDI	R21,$55		;Программируем Flash
	RJMP	Prog_wr
WR_spi_Eep:	LDI	R21,$AA		;Программируем EEPROM
Prog_wr:	LDI	R20,$09
	RCALL	Read_N_byt		;Чтение из ОЗУ девяти байт в R0-R8
	LDS	R22,Buffer_0A0
	LDS	R23,Buffer_0A0+1	;Текущий адрес Flash или Eeprom памяти
	LDI	R17,$08		;Бит выбора старший - младший байт данных
	MOV	R10,R17		;Бит выбора старший - младший байт данных
	CLR	R11
            CLR         R24
	CLR	R25
	LDS	R16,Buffer_0A0+3	;Дополнительный байта адреса бит 7 
	SBRC	R16,7
	RCALL	Spare_addr		;Загрузка дополнительного байта адреса для ATmega256
	SBRS	R2,0		;Байт режима - 0 = запись байтами, 1 = страницей 
	RJMP	Prog_comp		;Режим побайтовой записи во Flash или Eeprom
	; Режим страничной записи во Flash или Eeprom
	RJMP	Prog_page4
Prog_page:	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	MOV	R9,R16
	MOV	R16,R4		;R4 - Команда записи в страницу Flash $40 или Eeprom $C1
	RCALL	LVSP_m2		;Передача команды,адреса и байта данных по SPI
	CPI	R21,$55		;Программируем FLASH ?
	BRNE	Prog_page1
	EOR	R4,R10		;Переключаем передачу старший или младший байт адреса
Prog_page1:	SBRC	R24,0
	RJMP	Prog_page2
	CPI	R21,$AA		;Программируем EEPROM ?
	BRNE	Prog_page3
Prog_page2:	RCALL	Addr_Inc1		;Инкрементирование текущего адреса памяти	
Prog_page3:	ADIW	R25:R24,1
Prog_page4:	CP	R24,R1
	CPC	R25,R0		;В R25-R24 количество записываемых байт в МК
	BRCS	Prog_page
	; Выдать команду записи строницы во Flash или Eeprom
	SBRS	R2,7		;Байт режима - запись страничная ?
	RJMP	Prog_out
	MOV	R16,R5		;R5 - Команда записи страницы в Flash $4C или Eeprom $C2
	RCALL	Spi_In_Out		;Передача команды по SPI
	MOV	R16,R23
	RCALL	Spi_In_Out		;Передача старшего байта адреса по SPI
	MOV	R16,R22
	RCALL	Spi_In_Out		;Передача младшего байта адреса по SPI
	RCALL	Spi_Out_00		;Передача $00 аппаратным/программным SPI
	MOV	R16,R2		;Байт режима проверки записи
	ANDI	R16,$F0
	SBRS	R16,5		;Режим - Прочесть байт из МК и сравнить с R9 ?
	RJMP	Prog_page5
	LDI	R16,$11		;Установить бит - Пауза длительностью 1,0 мс*R16
Prog_page5:	RCALL	C_program
	RJMP	Prog_out
	; Режим побайтовой записи во Flash или Eeprom
Prog_word:	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	MOV	R9,R16
	MOV	R16,R4		;R6 - Команда записи в страницу Flash $40 или Eeprom $C1
	RCALL	LVSP_m2		;Передача команды,адреса и байта данных по SPI
	CPI	R21,$55		;Программируем FLASH ?
	BRNE	Prog_word1
	EOR	R4,R10		;Переключаем передачу старший или младший байт адреса
Prog_word1:	MOV	R16,R2
	CP	R9,R8		;R8 = $00 или $FF
	BRNE	Prog_word2
	SBRC	R16,3
	RJMP	Prog_word2
	LDI	R16,$02		;Установить бит - Пауза длительностью 1,0 мс*R16
Prog_word2:	RCALL	C_program
	TST	R11
	BRNE	Prog_out		;Выход по ошибке программирования
	SBRC	R24,0
	RJMP	Prog_word3
	CPI	R21,$AA		;Программируем EEPROM ?
	BRNE	Prog_word4
Prog_word3:	RCALL	Addr_Inc1		;Инкрементирование текущего адреса памяти
Prog_word4:	ADIW	R25:R24,1
Prog_comp:	CP	R24,R1
	CPC	R25,R0		;В R25-R24 количество записываемых байт в МК
	BRCS	Prog_word
Prog_out:	RJMP	Leader4_11		;Передача преамбулы 4 и R11 результат выполнения
	; Подрограмма контроля за процессом программирования результат в R11 = $80,$00 
C_program:	MOV	R15,R3		;Длительность паузы
	SBRC	R16,0		;Байт режима	
	RJMP	C_prog_1
	SBRC	R16,3
	RJMP	C_prog_5		;Ожидание RDY/~BSY от МК
	SBRC	R16,1
	RJMP	Delay_1		;Пауза длительностью 1 мс * R15
	SBRC	R16,2
	RJMP	C_prog_2		;Прочесть байт из МК и сравнить с R9
	RJMP	Delay_1		;Пауза длительностью 1 мс * R15
C_prog_1:	SBRC	R16,6	
	RJMP	C_prog_5		;Ожидание RDY/~BSY от МК
	SBRC	R16,4	
	RJMP	Delay_1		;Пауза длительностью 1 мс * R15
	SBRS	R16,5	
	RJMP	Delay_1		;Пауза длительностью 1 мс * R15
	; Прочесть байт из МК и сравнить с R9
C_prog_2:	CLR	R15
	COM	R15
C_prog_3:	MOV	R16,R6		;Команда чтения из Flash $20 или Eeprom $A0 
	CPI	R21,$55		;Программируем FLASH ?
	BRNE	C_prog_4
	MOV	R16,R4
	ANDI	R16,$08
	OR	R16,R6
	EOR	R16,R10		;Переключаем передачу старший или младший байт адреса
C_prog_4:	RCALL	LVSP_m1		;Передача команды,адреса и приём байта данных по SP
	CP	R16,R9		;R9 = последний записанный байт данных
	BREQ	C_prog_7
	TST	R15
	BRNE	C_prog_3
	RJMP	C_prog_6
C_prog_5:	RCALL	RDY_Lvsp1		;Ожидание RDY/~BSY от МК
	BREQ	C_prog_7
C_prog_6:	LDI	R16,$80
	MOV	R11,R16
C_prog_7:	RET

;___________ Чтение Flash или EEPROM памяти по SPI _____________________________________

M_spi_rw:	LDI	R16,$00		;Чтение EEPROM памяти
M_spi_rw_1:	MOV	R5,R16		;Чтение Flash памяти
	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	MOV	R4,R16
M_spi_rw_2:	LDS	R6,Buffer_0A0+3	;Дополнительный байта адреса бит 7 
	SBRC	R6,7
	RCALL	Spare_addr		;Загрузка дополнительного байта адреса
	RCALL	Leader_1		;Передача преамбулы 1
	RJMP	M_spi_rw_5
M_spi_rw_3:	RCALL	LVSP_mO		;Передать код команды, ст. и мл. байты адреса
	RCALL	Usart_out		;Отправить байт из R16 по USART
	TST	R5
	BREQ	M_spi_rw_4		;Если $00 EEPROM иначе читаем Flash
	MOV	R16,R4
	ORI	R16,8
	RCALL	LVSP_m1		;Передать код команды, ст. и мл. байты адреса
	RCALL	Usart_out		;Отправить байт из R16 по USART
	SBIW	R25:R24,1
M_spi_rw_4:	RCALL	Addr_Inc1		;Инкрементирование текущего адреса FLASH или Eeprom памяти
	SBRS	R6,7		;Дополнительный байта адреса бит 7 
	RJMP	M_spi_rw_5
	TST	R17
	BRNE	M_spi_rw_5
	LDS	R16,Buffer_0A0	;Текущий адрес Flash или Eeprom памяти
	TST	R16
	BRNE	M_spi_rw_5
	RCALL	Spare_addr		;Загрузка дополнительного байта адреса
M_spi_rw_5:	SBIW	R25:R24,1
	BRPL	M_spi_rw_3
	RJMP	Usart_00		;Отправить $00 по USART

;___________ Принять/передать байт по SPI интерфейсу ___________________________________

Spi_Out_00:	CLR	R16
Spi_In_Out:	IN	R17,SPCR		;SPI интерфейс: 0 - программный, => $50 - апаратный
	TST	R17
	BREQ	Spi_2
	IN	R17,SPSR		;Регистр состояния SPI
	IN	R17,SPDR		;Регистр Данных SPI
	OUT	SPDR,R16		;Регистр Данных SPI
Spi_1:	SBIS	SPSR,7		;Регистр состояния SPI
	RJMP	Spi_1
	IN	R16,SPDR		;Регистр Данных SPI
	RET
Spi_2:	MOV	R26,R16
	LDI	R27,8
Spi_3:	BST	R26,7		;Записать бит во флаг Т
	BRTC	Spi_4		;Переход если флаг T сброшен
	SBI	PORTB,5		;Сигнал MOSI = 1
	RJMP	Spi_5
Spi_4:	CBI	PORTB,5		;Сигнал MOSI = 0
Spi_5:	LSL	R26
	LDD	R16,Y+$08		;Скорость по SPI интефейсу
	RCALL	Latency		;Пауза 1,628 мкс * (R16+1)
	SBIC	PINB,6		;Сигнал MIS0
	SBR	R26,1
	SBI	PORTB,7		;Сигнал SCK = 1
	LDD	R16,Y+$08		;Скорость по SPI интефейсу
	RCALL	Latency		;Пауза 1,628 мкс * (R16+1)
	CBI	PORTB,7		;Сигнал SCK = 0
	DEC	R27
	BRNE	Spi_3
	MOV	R16,R26
	RET
	
;___________ Чтение флага готовности программируемого контроллера LVSP _________________

RDY_Lvsp:	MOV	R15,R24		;Количество запросов
RDY_Lvsp1:	LDI	R16,$F0
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	RCALL	Spi_Out_00		;Передать $00 по SPI интерфейсу
	RCALL	Spi_Out_00		;Передать $00 по SPI интерфейсу
	RCALL	Spi_Out_00		;Передать $00 по SPI интерфейсу
	BST	R16,0		;Записать бит во флаг Т
	BRTC	RDY_Lvsp2		;Переход если флаг T сброшен
	TST	R15
	BRNE	RDY_Lvsp1
RDY_Lvsp2:	CLR	R15
	ANDI	R16,1
	RET

;___________ Инициализация таймера Т2 и SPI интерфейса _________________________________

Init_T2:	LDI	R18,$18		;Инициализация таймера Т2 
	LDD	R17,Y+$07		;Количество тактов до совпадения таймера Т2
	LDD	R16,Y+$06		;Выбор источника тактового сигнала таймера Т2
	OUT	TCCR2,R18
	OUT	OCR2,R17
	ANDI	R16,7
	ORI	R16,$18
	OUT	TCCR2,R16		;Пин D7 порта D импульсы Xtal1
	LDS	R17,Buffer_068	;Скорость по SPI интефейсу
	CPI	R17,$04
	BRCC	Spi_init
	SBI	PORTB,4
	SBI	DDRB,4
	ORI	R17,$50
	RJMP	Spi_init_1
Spi_init:	CLR	R17
Spi_init_1:	OUT	SPCR,R17		;Регистр управления SPI
	RET

;___________ Четыре байта из ОЗУ передать по SPI _______________________________________

Ram_Spi_4:	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
Ram_Spi_3:	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	RJMP	Spi_In_Out		;Передать байт по SPI интерфейсу

;___________ Загрузка дополнительного байта адреса _____________________________________

Spare_addr:	LDI	R16,$4D
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	RCALL	Spi_Out_00		;Передать $00 по SPI интерфейсу
	LDS	R16,Buffer_0A0+2	;Buffer_0A2
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	RJMP	Spi_Out_00		;Передать $00 по SPI интерфейсу

;___________ Передача команды,адреса и приём байта данных по SPI _______________________

LVSP_mO:	MOV	R16,R4		;Код комады
LVSP_m1:	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	LDS	R16,Buffer_0A0+1	;Старший байт адреса
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	LDS	R16,Buffer_0A0	;Младший байт адреса
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	RJMP	Spi_Out_00		;Передать $00 по SPI интерфейсу

;___________ Передача команды,адреса и байта данных по SPI _____________________________

LVSP_m2:	RCALL	Spi_In_Out		;Передача команды по SPI
	LDS	R16,Buffer_0A0+1
	RCALL	Spi_In_Out		;Передача старшего байта адреса по SPI
	LDS	R16,Buffer_0A0
	RCALL	Spi_In_Out		;Передача младшего байта адреса по SPI
	MOV	R16,R9		;Чтение из ОЗУ байта в R24
	RJMP	Spi_In_Out		;Передача байта данных по SPI
;_______________________________________________________________________________________

.INCLUDE "HVPP.asm"

