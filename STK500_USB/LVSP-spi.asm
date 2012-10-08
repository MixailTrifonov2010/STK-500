
;___________ Таблица векторов переходов ________________________________________________

Table:	RJMP	Name_out		;Ответ ПК - STK500-2
	RJMP	Rate_WR		;Настройка скорости таймера Т2 и SPI
	RJMP	Rate_RD		;Чтение скорости программирования
	RJMP	Answer		;Команда не поддерживается
	RJMP	Answer		;Проверка на наличия МК в режиме LVSP
	RJMP	Burn_4		;Сохранить текущий адрес 4 байта
	RJMP	Answer		;Команда не поддерживается
	RJMP	Answer		;Команда не поддерживается
	RJMP	Answer		;Команда не поддерживается
	RJMP	Answer		;Команда не поддерживается

	RJMP	Answer		;Команда не поддерживается
	RJMP	Answer		;Команда не поддерживается
	RJMP	Answer		;Команда не поддерживается
	RJMP	Answer		;Команда не поддерживается
	RJMP	Answer		;Команда не поддерживается
	RJMP	Start_spi		;Ввод в режим LVSP
	RJMP	Spi_close		;Последняя команда от ПК  в режиме LVSP завершена 
	RJMP	Chip_erase		;Стирание кристалла в режиме LVSP
	RJMP	WR_spi_Fla		;Запись во Flash память в режиме LVSP
	RJMP	RD_F_LVSP		;Чтение Flash памяти в режиме LVSP

	RJMP	WR_spi_Eep		;Запись в EEPROM в режиме LVSP
	RJMP	RD_E_LVSP		;Чтение EEPROM памяти в режиме LVSP
	RJMP	F_defense		;Запись конфигурационных ячеек в режиме LVSP
	RJMP	Sign_LVSP		;Чтение конфигурационных ячеек в режиме LVSP
	RJMP	F_defense		;Запись ячеек защиты в режиме LVSP
	RJMP	Sign_LVSP		;Чтение байта защиты в режиме LVSP
	RJMP	Sign_LVSP		;Чтение сигнатуры микроконтроллера в режиме LVSP
	RJMP	Sign_LVSP		;Чтение калибровочной ячейки в режиме LVSP
	RJMP	In_Out_Port		;Управление портами A,B,C, сигналом Reset и +5v
	RJMP	Answer		;Команда не поддерживается

	RJMP	Answer		;Команда не поддерживается
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
	RJMP	Answer		;Команда не поддерживается
	RJMP	Answer		;Команда не поддерживается
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

;___________ Ответ ПК - STK500-2 _______________________________________________________

Name_out:	LDI	R24,LOW(Spool_Out+1)
	LDI	R25,HIGH(Spool_Out+1)	;Первый байт ответа программатора на команду ПК
	MOVW	R27:R26,R25:R24
	LDI	R30,LOW(Data_6*2)
	LDI	R31,HIGH(Data_6*2)	;STK500_2
Name_out_1:	LPM	R0,Z+
	ST	X+,R0
	TST	R0
	BRNE	Name_out_1
	LDI	R28,$0B
	RJMP	Answer_3		;Ответ ПК на команду

;____________ Настройка скорости таймера Т2 и SPI ______________________________________

Rate_WR:	LDS	R30,Spool_Inp	;Адрес первого принятого байта сообщения от ПК
	LDS	R18,Spool_Inp+1
	ANDI	R30,$0F
	CLR	R31
	SUBI	R30,$90
	SBCI	R31,$FF		;R31-R30 + $0070
	CPI	R30,$76
	BRNE	Rate_WR_1
	ANDI	R18,$77
Rate_WR_1:	CPI	R30,$7E
	BRNE	Rate_WR_3
	TST	R18
	LDD	R18,Z+$00
	BREQ	Rate_WR_2
	ORI	R18,8
	RJMP	Rate_WR_3
Rate_WR_2:	ANDI	R18,$F7
Rate_WR_3:	STD	Z+$00,R18
	RJMP	Answer_3		;Ответ ПК на команду

;___________ Чтение скорости программирования по SPI ___________________________________
	; Результат АЦП преобразований, Опрос 74HC597,Скорость таймера Т2
	; Скорость по SPI интефейсу,Состояние порта В

Rate_RD:	LDS	R30,Spool_Inp	;Адрес первого принятого байта сообщения от ПК
	CLR	R31
	IN	R19,PINB
	STS	Buffer_07D,R19	;PortB
	ANDI	R30,$1F
	SBRC	R30,4	
	RJMP	Rate_RD_1
	LDI	R24,$09
	TST	R30
	BREQ	Rate_RD_2
	CLR	R24
	RJMP	Rate_RD_2
Rate_RD_1:	ANDI	R30,$0F
	SUBI	R30,$90
	SBCI	R31,$FF		;R31-R30 + $0070
	LDD	R24,Z+$00
Rate_RD_2:	CLR	R25
	STS	Spool_Out+1,R24
	LDI	R28,3
	RJMP	Answer_3		;Ответ ПК на команду

;___________ Управление портами A,B,C, сигналом Reset и +5v ____________________________

In_Out_Port:LDI	R19,$07
	RCALL	Read_N_byt		;Чтение из ОЗУ семи байт в R2-R8
	IN	R9,PINA
	OUT	DDRA,R2		;Настойка линий порта А
	OUT	PORTA,R3		;Выдать принятый байт в порт А (вкл/выкл подтяжки)
	IN	R2,PINB
	OUT	DDRB,R4		;Настойка линий порта B
	OUT	PORTB,R5		;Выдать принятый байт в порт B (вкл/выкл подтяжки)
	IN	R3,PINC
	OUT	DDRC,R6		;Настойка линий порта C
	OUT	PORTC,R7		;Выдать принятый байт в порт C (вкл/выкл подтяжки)
	MOV	R25,R8
	ANDI	R25,$21
	IN	R24,PORTD
	ANDI	R24,$DE
	OR	R24,R25
	OUT	PORTD,R24		;Вкл/выкл +5v (PIND5 0-вкл, 1-выкл. PIND2=0 то Reset=1, PIND2=1 то Reset=0)
	LDI	R30,LOW(Spool_Out+1)
	LDI	R31,HIGH(Spool_Out+1)	;Первый байт ответа программатора на команду ПК
	ST	Z+,R9
	ST	Z+,R2
	ST	Z+,R3
	IN	R24,PIND
	ST	Z+,R24
	LDI	R28,$07
	RJMP	Answer_3		;Ответ ПК на команду

;____________ Сохранить текущий адрес 4 байта __________________________________________

Burn_4:	LDS	R24,Spool_Inp
	STS	Cur_addr3,R24	;Указатель на наличие дополнительного байта адреса (бит 7) 
	LDS	R24,Spool_Inp+1
	STS	Cur_addr2,R24	;Текущий адрес Flash или Eeprom памяти доп. байт
	LDS	R24,Spool_Inp+2
	STS	Cur_addr1,R24	;Текущий адрес Flash или Eeprom памяти ст. байт
	LDS	R24,Spool_Inp+3
	STS	Cur_addr0,R24	;Текущий адрес Flash или Eeprom памяти мл. байт
	RJMP	Answer_3		;Ответ ПК на команду

;____________ Ввод в режим LVSP ________________________________________________________

Start_spi:	RCALL	Init_T2		;Инициализация таймера Т2 и SPI интерфейса
	SBI	PORTD,1		;Выключить +12v 
	LDI	R19,$07
	RCALL	Read_N_byt		;Чтение из ОЗУ семи байт в R2-R8
Start_spi1:	CBI	PORTD,5		;Включить +5v
	MOV	R24,R3
	RCALL	Delay		;Пауза длительностью 1 мс * (R24+1)
	LDI	R25,$B0
	OUT	DDRB,R25
	OUT	PORTB,R1	
	CBI	PORTD,0		;Cигнал Reset = 0 (на базу VT3)
	MOV	R24,R3
	RCALL	Delay		;Пауза длительностью 1 мс * (R24+1)
	SBI	PORTD,0		;Cигнал Reset = 1 (на базу VT3)
	MOV	R24,R3
	RCALL	Delay		;Пауза длительностью 1 мс * (R24+1)
	DEC	R5
	BREQ	Start_spi5
	LDS	R24,Spool_Inp+7
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	LDS	R24,Spool_Inp+8
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	LDS	R24,Spool_Inp+9
	RCALL	Spi_In_Out		;Передать/принять байт по SPI интерфейсу
	MOV	R6,R24
	LDS	R24,Spool_Inp+10
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	MOV	R4,R24
	MOV	R25,R8
	CPI	R25,3
	BRNE	Start_spi2
	MOV	R4,R6
	RJMP	Start_spi3
Start_spi2:	TST	R24
	BREQ	Start_spi4
Start_spi3:	CP	R4,R7
	BRNE	Start_spi1
Start_spi4:	RJMP	Answer_3		;Ответ ПК на команду - Контроллер по SPI ответил
Start_spi5:	SBI	PORTD,0		;Cигнал Reset = 1 (на базу VT3)
	CLR	R24
	OUT	PORTB,R24
	OUT	DDRB,R24
	OUT	TCCR2,R24		;Выключить таймер Т2
	OUT	SPCR,R24		;Выключить аппартный SPI интерфейс
	OUT	TCCR1A,R24	
	OUT	TCCR1B,R24		;Выключить таймер Т1
	SBI	PORTD,5		;Выключить +5v
	RJMP	Answer		;Ответ ПК на команду - Контроллер не отвечает

;___________ Последняя команда от ПК завершена _________________________________________

Spi_close:	SBI	PORTD,0		;Cигнал Reset = 1 (на базу VT3)
	CLR	R24
	OUT	PORTB,R24
	OUT	DDRB,R24
	OUT	TCCR2,R24		;Выключить таймер Т2
	OUT	SPCR,R24		;Выключить аппартный SPI интерфейс
	OUT	TCCR1A,R24	
	OUT	TCCR1B,R24		;Выключить таймер Т1
	SBI	PORTD,5		;Выключить +5v
	RJMP	Answer_3		;Ответ ПК на команду

;___________ Стирание кристалла ________________________________________________________

Chip_erase:	LDI	R19,$02
	RCALL	Read_N_byt		;Чтение из ОЗУ в R2-R3
	MOV	R24,R3
	RCALL	Delay		;Пауза длительностью 1 мс * (R24+1)
Ch_erase2:	RCALL	Ram_Spi_4		;Четыре байта из ОЗУ передать по SPI
	TST	R24
	BREQ	Ch_erase3
	MOV	R24,R2
	RCALL	RDY_Lvsp		;Чтение флага готовности программиремого контроллера
	BREQ	Ch_erase3
	LDI	R24,$80
	RJMP	Answer_1		;Ответ ПК на команду - Команда не выполнена
Ch_erase3:	RJMP	Answer_3		;Ответ ПК на команду - Команда выполнена

;___________ Запись фьюзов и ячеек защиты ______________________________________________

F_defense:	LDI	R30,LOW(Spool_Inp)
	LDI	R31,HIGH(Spool_Inp)	;Первый байт данных от ПК
	RCALL	Ram_Spi_4		;Четыре байта из ОЗУ передать по SPI
	LDI	R28,$03
	CLR	R29
	RJMP	Answer_3		;Ответ ПК на команду - Команда выполнена

;___________ Чтение сигнатуры микроконтроллера по SPI __________________________________
	; ячеек защиты, идентификатора и конфигурационных ячеек и калибровчной
	; ячейки генератора

Sign_LVSP:	LDI	R30,LOW(Spool_Inp)
	LDI	R31,HIGH(Spool_Inp)	;Первый байт данных от ПК
	LD	R23,Z+
	RCALL	Ram_Spi_3		;Три байта из ОЗУ передать по SPI
	MOV	R9,R24
	RCALL	Spi_Out_00		;Принять байт по SPI интерфейсу
	CPI	R23,3
	BRNE	Sign_LVSP2
	MOV	R24,R9
Sign_LVSP2:	LDI	R28,$04
	CLR	R29
	STS	Spool_Out+1,R24
	STS	Spool_Out+2,R29
	RJMP	Answer_3		;Ответ ПК на команду - Команда выполнена

;___________ Чтение Flash или EEPROM памяти по SPI _____________________________________

RD_F_LVSP:	CLR	R3		;Читаем - Flash
	COM	R3
	RJMP	M_spi_rw
RD_E_LVSP:	CLR	R3		;Читаем - EEPROM
M_spi_rw:	CLR	R19
	LDS	R27,Spool_Inp
	LDS	R26,Spool_Inp+1	;R27-R26 - количество читаемых байт
	LDS	R2,Spool_Inp+2	;Код операции чтения Flash или EEPROM памяти
	MOVW	R29:R28,R27:R26
	ADIW	R29:R28,3
	LDI	R30,LOW(Spool_Out+1)
	LDI	R31,HIGH(Spool_Out+1)	;Первый байт ответа программатора на команду ПК
	LDS	R4,Cur_addr3	;Указатель на наличие дополнительного байта адреса (бит 7) 
	SBRC	R4,7
	RCALL	Spare_addr		;Загрузка дополнительного байта адреса
	RJMP	M_spi_rw_3
M_spi_rw_1:	RCALL	LVSP_m0		;Передача команды,адреса и приём байта данных по SP
	ST	Z+,R24
	TST	R3
	BREQ	M_spi_rw_2		;Если $00 EEPROM иначе читаем Flash
	MOV	R24,R2
	ORI	R24,8
	RCALL	LVSP_m1		;Передача команды,адреса и приём байта данных по SP
	ST	Z+,R24
	SBIW	R27:R26,1
M_spi_rw_2:	RCALL	Addr_Inc1		;Инкрементирование текущего адреса FLASH или Eeprom памяти
	SBRS	R4,7		;Дополнительный байт адреса бит 7 
	RJMP	M_spi_rw_3
	TST	R22
	BRNE	M_spi_rw_3
	LDS	R25,Cur_addr0	;Текущий адрес Flash или Eeprom памяти мл. байт
	TST	R25
	BRNE	M_spi_rw_3
	RCALL	Spare_addr		;Загрузка дополнительного байта адреса
M_spi_rw_3:	SBIW	R27:R26,1
	BRPL	M_spi_rw_1
	ST	Z,R1
	RJMP	Answer_3		;Ответ ПК на команду - Команда выполнена

;___________ Запись в EEPROM или Flash по SPI __________________________________________

WR_spi_Fla:	LDI	R21,$55		;Программируем Flash
	RJMP	Prog_wr
WR_spi_Eep:	LDI	R21,$AA		;Программируем EEPROM
Prog_wr:	LDI	R19,$09
	RCALL	Read_N_byt		;Чтение из ОЗУ девяти байт в R2-R10
	LDS	R22,Cur_addr0	;Текущий адрес Flash или Eeprom памяти мл. байт
	LDS	R23,Cur_addr1	;Текущий адрес Flash или Eeprom памяти ст. байт
	LDI	R20,$08
	MOV	R9,R20		;Бит выбора старший - младший байт данных
	CLR	R20
            CLR         R26
	CLR	R27
	LDS	R24,Cur_addr3	;Указатель на наличие дополнительного байта адреса (бит 7) 
	SBRC	R24,7
	RCALL	Spare_addr		;Загрузка дополнительного байта адреса для ATmega256
	SBRS	R4,0		;Байт режима - 0 = запись байтами, 1 = страницей 
	RJMP	Prog_comp		;Режим побайтовой записи во Flash или Eeprom
	; Режим страничной записи во Flash или Eeprom
	RJMP	Prog_page4
Prog_page:	MOV	R24,R6		;R6 - Команда записи в страницу Flash $40 или Eeprom $C1
	LD	R19,Z+		;Чтение из ОЗУ байта в R19
	RCALL	LVSP_m1		;Передача команды,адреса и байта данных по SPI
	CPI	R21,$55		;Программируем FLASH ?
	BRNE	Prog_page1
	EOR	R6,R9		;Переключаем ст. или мл. байт данных
Prog_page1:	SBRC	R26,0
	RJMP	Prog_page2
	CPI	R21,$AA		;Программируем EEPROM ?
	BRNE	Prog_page3
Prog_page2:	RCALL	Addr_Inc1		;Инкрементирование текущего адреса памяти	
Prog_page3:	ADIW	R27:R26,1
Prog_page4:	CP	R26,R3
	CPC	R27,R2		;В R27-R26 количество записываемых байт в МК
	BRCS	Prog_page
	; Выдать команду записи строницы во Flash или Eeprom
	SBRS	R4,7		;Байт режима - запись страничная ?
	RJMP	Prog_out
	MOV	R24,R7		;R7 - Команда записи страницы в Flash $4C или Eeprom $C2
	RCALL	Spi_In_Out		;Передача команды по SPI
	MOV	R24,R23
	RCALL	Spi_In_Out		;Передача старшего байта адреса по SPI
	MOV	R24,R22
	RCALL	Spi_In_Out		;Передача младшего байта адреса по SPI
	RCALL	Spi_Out_00		;Передача $00 аппаратным/программным SPI
	MOV	R25,R4		;Байт режима проверки записи
	ANDI	R25,$F1
	SBRC	R25,5		;Режим - Прочесть байт из МК и сравнить с R19 ?
	LDI	R25,$11		;Установить бит - Пауза длительностью 1,0 мс*R13
Prog_page5:	RCALL	C_program
	RJMP	Prog_out
	; Режим побайтовой записи во Flash или Eeprom
Prog_word:	MOV	R24,R6		;R6 - Команда записи в страницу Flash $40 или Eeprom $C0
	LD	R19,Z+		;Чтение из ОЗУ байта в R19
	RCALL	LVSP_m1		;Передача команды,адреса и байта данных по SPI
	CPI	R21,$55		;Программируем FLASH ?
	BRNE	Prog_word1
	EOR	R6,R9		;Переключаем ст. или мл. байт данных
Prog_word1:	MOV	R25,R4
	CP	R19,R10		;R10 = $00 или $FF
	BRNE	Prog_word2
	SBRS	R25,3
	LDI	R25,$02		;Установить бит - Пауза длительностью 1,0 мс*R13
Prog_word2:	RCALL	C_program
	TST	R20
	BRNE	Prog_out		;Выход по ошибке программирования
	SBRC	R26,0
	RJMP	Prog_word3
	CPI	R21,$AA		;Программируем EEPROM ?
	BRNE	Prog_word4
Prog_word3:	RCALL	Addr_Inc1		;Инкрементирование текущего адреса памяти
Prog_word4:	ADIW	R27:R26,1
Prog_comp:	CP	R26,R3
	CPC	R27,R2		;В R25-R24 количество записываемых байт в МК
	BRCS	Prog_word
Prog_out:	MOV	R24,R20
	RJMP	Answer_2		;Ответ ПК на команду
	; Подрограмма контроля за процессом программирования результат в R20 = $80,$00 	 
C_program:	MOV	R13,R5		;Счётчик таймера Т0 - 1 мс * R13 длительность паузы
	SBRC	R25,0		;Байт режима	
	RJMP	C_prog_1
	SBRC	R25,3
	RJMP	C_prog_5		;Ожидание RDY/~BSY от МК
	SBRC	R25,1
	RJMP	Delay_1		;Пауза длительностью 1 мс * R13
	SBRC	R25,2
	RJMP	C_prog_2		;Прочесть байт из МК и сравнить с R19
	RJMP	Delay_1		;Пауза длительностью 1 мс * R13
C_prog_1:	SBRC	R25,6	
	RJMP	C_prog_5		;Ожидание RDY/~BSY от МК
	SBRC	R25,4	
	RJMP	Delay_1		;Пауза длительностью 1 мс * R13
	SBRS	R25,5	
	RJMP	Delay_1		;Пауза длительностью 1 мс * R13
	; Прочесть байт из МК и сравнить с R19
C_prog_2:	CLR	R13
	COM	R13
C_prog_3:	MOV	R24,R8		;Команда чтения из Flash $20 или Eeprom $A0 
	CPI	R21,$55		;Программируем FLASH ?
	BRNE	C_prog_4
	MOV	R24,R6
	ANDI	R24,$08
	OR	R24,R8
	EOR	R24,R9		;Переключаем ст. или мл. байт данных
C_prog_4:	RCALL	LVSP_m1		;Передача команды,адреса и приём байта данных по SP
	CP	R24,R19		;R19 = последний записанный байт данных
	BREQ	C_prog_7
	TST	R13		;Счётчик таймера Т0 - 1 мс * R13
	BRNE	C_prog_3
	RJMP	C_prog_6
C_prog_5:	RCALL	RDY_Lvsp1		;Ожидание RDY/~BSY от МК
	BREQ	C_prog_7
C_prog_6:	LDI	R20,$80
C_prog_7:	RET

;___________ Передача команды,адреса и приём/Передача байта данных по SPI ______________

LVSP_m0:	MOV	R24,R2		;Код комады
LVSP_m1:	RCALL	Spi_In_Out		;Передача команды по SPI
	LDS	R24,Cur_addr1	;Текущий адрес Flash или Eeprom памяти ст. байт
	RCALL	Spi_In_Out		;Передача старшего байта адреса по SPI
	LDS	R24,Cur_addr0	;Текущий адрес Flash или Eeprom памяти мл. байт
	RCALL	Spi_In_Out		;Передача младшего байта адреса по SPI
	MOV	R24,R19		;Чтение из ОЗУ байта в R24
	RJMP	Spi_In_Out		;Передача байта данных по SPI

;___________ Загрузка дополнительного байта адреса _____________________________________

Spare_addr:	LDI	R24,$4D
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	RCALL	Spi_Out_00		;Передать $00 по SPI интерфейсу
	LDS	R24,Cur_addr2	;Текущий адрес Flash или Eeprom памяти доп. байт
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	RJMP	Spi_Out_00		;Передать $00 по SPI интерфейсу

;___________ Четыре байта из ОЗУ передать по SPI _______________________________________

Ram_Spi_4:	LD	R24,Z+		;Чтение из ОЗУ байта в R24
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
Ram_Spi_3:	LD	R24,Z+		;Чтение из ОЗУ байта в R24
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	LD	R24,Z+		;Чтение из ОЗУ байта в R24
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	LD	R24,Z+		;Чтение из ОЗУ байта в R24
	RJMP	Spi_In_Out		;Передать байт по SPI интерфейсу

;___________ Передать/принять байт по SPI интерфейсу ___________________________________

Spi_Out_00:	CLR	R24
Spi_In_Out:	IN	R25,SPCR		;SPI интерфейс: 0 - программный,  => $50 - апаратный
	TST	R25
	BREQ	Spi_2
	IN	R25,SPSR		;Регистр состояния SPI
	IN	R25,SPDR		;Регистр Данных SPI
	OUT	SPDR,R24		;Регистр Данных SPI
Spi_1:	SBIS	SPSR,7		;Регистр состояния SPI
	RJMP	Spi_1
	IN	R24,SPDR		;Регистр Данных SPI
	RET
Spi_2:	LDI	R25,8
Spi_3:	BST	R24,7		;Записать бит во флаг Т
	BRTC	Spi_4		;Переход если флаг T сброшен
	SBI	PORTB,5		;Сигнал MOSI = 1
	RJMP	Spi_5
Spi_4:	CBI	PORTB,5		;Сигнал MOSI = 0
Spi_5:	LSL	R24
	LDS	R1,Buffer_078	;Скорость по SPI интефейсу
	MOV	R0,R1
	LSL	R1
	SUB	R1,R0		;R1 * 1,5
	RCALL	Latency		;Пауза 1 мкс * R1
	SBIC	PINB,6		;Сигнал MIS0
	SBR	R24,1
	SBI	PORTB,7		;Сигнал SCK = 1
	LDS	R1,Buffer_078	;Скорость по SPI интефейсу
	MOV	R0,R1
	LSL	R1
	SUB	R1,R0		;R1 * 1,5
	RCALL	Latency		;Пауза 1 мкс * R1
	CBI	PORTB,7		;Сигнал SCK = 0
	DEC	R25
	BRNE	Spi_3
	RETI

;___________ Чтение флага готовности программируемого контроллера LVSP _________________

RDY_Lvsp:	MOV	R13,R24		;Счётчик таймера Т0 - 1 мс * R13
RDY_Lvsp1:	LDI	R24,$F0
	RCALL	Spi_In_Out		;Передать байт по SPI интерфейсу
	RCALL	Spi_Out_00		;Передать $00 по SPI интерфейсу
	RCALL	Spi_Out_00		;Передать $00 по SPI интерфейсу
	RCALL	Spi_Out_00		;Передать $00 по SPI интерфейсу
	BST	R24,0		;Записать бит во флаг Т
	BRTC	RDY_Lvsp2		;Переход если флаг T сброшен
	TST	R13
	BRNE	RDY_Lvsp1
RDY_Lvsp2:	CLR	R13
	ANDI	R24,1
	RETI
	
;___________ Инициализация таймера Т2 и SPI интерфейса _________________________________

Init_T2:	LDI	R18,$18		;Инициализация таймера Т2 
	LDS	R25,Buffer_077	;Количество тактов до совпадения таймера Т2
	LDS	R24,Buffer_076	;Выбор источника тактового сигнала таймера Т2
	OUT	TCCR2,R18
	OUT	OCR2,R25
	ANDI	R24,7
	ORI	R24,$18
	OUT	TCCR2,R24		;Пин D7 порта D импульсы Xtal1
	LDS	R25,Buffer_078	;Скорость по SPI интефейсу
	CPI	R25,$04
	BRCC	Spi_init
	SBI	PORTB,4
	SBI	DDRB,4
	ORI	R25,$50
	RJMP	Spi_init_1
Spi_init:	CLR	R25
Spi_init_1:	OUT	SPCR,R25		;Регистр управления SPI
	RETI
;_______________________________________________________________________________________

.INCLUDE "HVPP.asm"
