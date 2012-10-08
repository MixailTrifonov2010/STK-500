

;___________ Ввод микроконтроллера в режим HVPP ________________________________________

Start_HVPP:	RCALL	Init_T1		;Инициализация таймера Т1
	OUT	SPCR,R29		;Отключить SPI модуль
	OUT	TCCR2,R29		;Выключить таймер Т2
	CBI	PORTD,5		;Включить +5v
	SBI	PORTD,3		;Выключить +12v 
	CBI	PORTD,7		;Cигнал Xtpl1 = 1 
	LDI	R17,$0E
	LDI	R18,$FD
	OUT	PORTC,R17
	OUT	DDRC,R18
	LDI	R20,$04	 
	RCALL	Read_N_byt		;Чтение из ОЗУ четырёх байт в R0-R3
	MOV	R16,R0
	RCALL	Delay		;Пауза длительностью 1 мс * (R16+1)
	SBI	PORTD,2		;Cигнал Reset = 1 (на базу VT5)
	TST	R3
	BRNE	St_HVPP2
St_HVPP1:	RCALL	Takt		;Выдать тактовый сигнал Xtal1
	DEC	R2
	BRNE	St_HVPP1
St_HVPP2:	CBI	PORTD,2		;Cигнал Reset = 0 (на базу VT5)
	SER	R16
	OUT	PORTB,R16		;Cигналы-Data7...0 = 0
	OUT	DDRB,R16		;Порт В на вывод
	CBI	PORTD,3		;Включить +12v (на базу VT1)
	LDI	R16,$01
	RCALL	Delay		;Пауза длительностью 1 мс * (R16+1)
	RJMP	Lead4_00		;Передача преамбулы 4 и $00 в USART

;___________ Последняя команда от ПК по HVPP завершена _________________________________ 

HVPP_close:	SBI	PORTD,3		;Выключить +12v
	OUT	TCCR1A,R29	
	OUT	TCCR1B,R29		;Выключить таймер Т1
	OUT	PORTB,R29
	OUT	DDRB,R29		;Порт В на ввод
	OUT	PORTC,R29
	OUT	DDRC,R29		;Порт С на ввод
	SBI	PORTD,5		;Выключить +5v
	CLR	R16
	RCALL	Delay		;Пауза длительностью 1 мс * (R16+1)
	SBI	PORTD,2		;Cигнал Reset = 1 (на базу VT5)
	RJMP	Lead4_00		;Передача преамбулы 4 и $00 в USART

;___________ Стирание кристалла по HVPP ________________________________________________

Erase_HVPP:	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	LDI	R16,$80
	RCALL	Hvpp_m0		;Загрузка команды R16 (Стирание,запись,чтение) в МК
	RCALL	Hvpp_m8
	MOV	R16,R24
	RCALL	RDY_Hvpp1		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	Lead4_00		;Передача преамбулы 4 и $00 в USART
	RJMP	Usart_81		;Отправить $81 по USART
Lead4_00:	RCALL	Leader_4		;Передача преамбулы 4
	RJMP	Usart_00		;Отправить $00 по USART

;___________ Чтение сигнатуры микроконтроллера в режиме HVPP ___________________________

Sign_HVPP:	RCALL	Calibr_PP1
	LDD	R17,Y+$34		;$6A (XA1 = XA0 = WR = R/B = 1)
	RJMP	Conf_PPr1		;Передача преамбулы 5 и отправить $00 по USART

;___________ Чтение калибровочной ячейки в режиме HVPP _________________________________

Calibr_PP:	RCALL	Calibr_PP1
	LDD	R17,Y+$35		;$7A (XA1 = XA0 = BS1 = WR = R/B = 1)
	RJMP	Conf_PPr1
Calibr_PP1:	LDI	R16,$08		;Команда чтение идентификатора
	RCALL	Hvpp_m0		;Загрузка команды R16 (Стирание,запись,чтение) в МК
	LDD	R17,Y+$20
	RJMP	Hvpp_m2		;R16 в порт C из ОЗУ в R16 в порт C и Xtal1

;___________ Чтение байта защиты по HVPP _______________________________________________

Prot_PPr:	LDI	R16,$04
	RCALL	Hvpp_m0		;Загрузка команды R16 (Стирание,запись,чтение) в МК
	LDD	R17,Y+$35		;$7A (XA1 = XA0 = BS1 = WR = R/B = 1)
	RJMP	Conf_PPr1

;___________ Чтение конфигурационных ячеек _____________________________________________

Conf_PPr:	LDI	R16,$04
	RCALL	Hvpp_m0		;Загрузка команды R16 (Стирание,запись,чтение) в МК
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	LDD	R17,Y+$34		;$6A (XA1 = XA0 = WR = R/B = 1)
	TST	R16
	BREQ	Conf_PPr1
	LDD	R17,Y+$37		;$7B (XA1 = XA0 = BS1 = WR = R/B = BS2 = 1)
	DEC	R16
	BREQ	Conf_PPr1
	LDD	R17,Y+$36		;$6B (XA1 = XA0 = WR = R/B = BS2 = 1)
	DEC	R16
	BREQ	Conf_PPr1
	LDD	R17,Y+$35		;$7A (XA1 = XA0 = BS1 = WR = R/B = 1)
	DEC	R16
	BREQ	Conf_PPr1
	LDI	R16,$C0
	RJMP	Rate_RD_2		;Передача преамбулы 5 и отправить $C0 по USART
Conf_PPr1:	RCALL	Hvpp_m5
	RJMP	Rate_RD_2		;Передача преамбулы 5 и отправить $00 по USART

;___________ Запись конфигурационных ячеек _____________________________________________

Conf_PPw:	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	MOV	R24,R16
	LDI	R16,$40
	RCALL	Hvpp_m1
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	RCALL	Delay		;Пауза длительностью 1 мс * (R16+1)
	LDD	R17,Y+$30		;$66 (XA1 = XA0 = RD = R/B = 1)
	TST	R24
	BREQ	Conf_PPw1
	LDD	R17,Y+$31		;$76 (XA1 = XA0 = BS1 = RD = R/B = 1)
	DEC	R24
	BREQ	Conf_PPw1
	LDD	R17,Y+$32		;$67 (XA1 = XA0 = RD = R/B = BS2 = 1)
	DEC	R24
	BREQ	Conf_PPw1
	RJMP	Conf_PPw2
Conf_PPw1:	RCALL	Hvpp_m9
Conf_PPw2:	RCALL	Leader_4		;Передача преамбулы 4
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	RCALL	RDY_Hvpp1		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	Conf_PPw5
	RJMP	Usart_81		;Отправить $81 по USART
Conf_PPw5:	RJMP	Usart_00		;Отправить $00 по USART

;___________ Запись байта защиты _______________________________________________________

Prot_PPw:	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	LDI	R16,$20
	RCALL	Hvpp_m1		;Загрузка команды R16 (Стирание,запись,чтение) в МК
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	RCALL	Hvpp_m8
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	LSL	R16
	RCALL	RDY_Hvpp1		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	Prot_PPw1
	RJMP	Usart_81		;Отправить $81 по USART
Prot_PPw1:	RJMP	Lead4_00		;Передача преамбулы 4 и $00 в USART

;___________ Запись во Flash память по HVPP ____________________________________________

WR_F_HVPP:	CLR	R11
	LDS	R10,Buffer_0A0+1	;Текущий адрес Flash или Eeprom памяти
	LDI	R21,1		;R21 количество страниц
	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	MOVW	R3:R2,R25:R24
	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	MOV	R0,R25
	MOV	R1,R24
	LDI	R16,$10
	RCALL	Hvpp_m0		;Загрузка команды R16 (Стирание,запись,чтение) в МК
	MOVW	R23:R22,R3:R2        	;Количество записываемых байт
	MOV	R16,R0
	SBRS	R16,0
	RJMP	WR_F_HVPP5
	ANDI	R16,$0E
	BREQ	WR_F_HVPP1
	RCALL	Shift		;Вычисление количество строниц и байт в странице
WR_F_HVPP1:	LSR	R23
	ROR	R22         	;Количество слов в странице у микроконтроллера
	RJMP	WR_F_HVPP9
WR_F_HVPP2:	LDD	R17,Y+$25		;$3E (XA0 = BS1 = WR = RD = R/B = 1)
	RCALL	Hvpp_m2		;R16 в порт C из ОЗУ в R16 в порт C и Xtal1
	LDD	R17,Y+$31		;$76 (XA1 = XA0 = BS1 = RD = R/B = 1)
	OUT	PORTC,R17		;Выдать команду WR
	LDI	R16,$00
	RCALL	Latency		;Пауза 1,628 мкс * (R16+1
	RCALL	Hvpp_m7		;$7E (XA1 = XA0 = BS1 = WR = RD = R/B = 1) в порт С
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_F_HVPP4
WR_F_HVPP3:	LDI	R16,$81
	MOV	R11,R16
WR_F_HVPP4:	SUBI	R22,2
	SBCI	R23,0		;R23-R22 - 2
	BREQ	Leader4_11
WR_F_HVPP5:	RCALL	Hvpp_m12
	RCALL	Hvpp_m8		;Запись страницы
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_F_HVPP2
	RJMP	WR_F_HVPP3
	;Загрузка буфера страницы
WR_F_HVPP6:	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R17
	RCALL	Addr_Inc		;Инкрементирование текущего адреса FLASH памяти
	RCALL	Takt		;Выдать тактовый сигнал Xtal1
	LDD	R17,Y+$24		;$2E (XA0 = WR = RD = R/B = 1)
	OUT	PORTC,R17
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	RCALL	Hvpp_m3		;R16 в порт C и Xtal1
	LDD	R17,Y+$25		;$3E (XA0 = BS1 = WR = RD = R/B = 1)
	RCALL	Hvpp_m2		;R16 в порт C из ОЗУ в R16 в порт C и Xtal1
	RCALL	Hvpp_m6		;Выдать импульс PAGEL
WR_F_HVPP7:	SBIW	R25:R24,1		;Количество байт в странице у микроконтроллера
	BRPL	WR_F_HVPP6
	SBRS	R0,7
	RJMP	WR_F_HVPP9
	LDD	R17,Y+$21		;$1E (BS1 = WR = RD = R/B = 1)
	OUT	PORTC,R17
	MOV	R16,R10
	RCALL	Hvpp_m3		;R16 в порт В и выдать Xtal1
	LDS	R16,Buffer_0A0+3	;Дополнительный байта адреса бит 7 
	SBRS	R16,7
	RJMP	WR_F_HVPP8
	LDD	R17,Y+$22		;$0F (WR = RD = R/B = BS2 = 1)
	OUT	PORTC,R17
	LDS	R16,Buffer_0A0+2	;Текущий адрес Flash или Eeprom памяти
	RCALL	Hvpp_m3		;R16 в порт В и выдать Xtal1
WR_F_HVPP8:	RCALL	Hvpp_m8		;Запись страницы во Flash память
WR_F_HVPP9:	SUBI	R21,1		;Количество страниц
	BRMI	WR_F_HVPP10
	MOVW	R25:R24,R23:R22	;Количество байт в странице у микроконтроллера
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_F_HVPP7
	LDI	R16,$81
	MOV	R11,R16
	RJMP	WR_F_HVPP7
WR_F_HVPP10:MOV	R16,R0
	SBRS	R16,6
	RJMP	Leader4_11
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_F_HVPP11
	LDI	R16,$81
	MOV	R11,R16
WR_F_HVPP11:LDI	R16,$00
	RCALL	Hvpp_m0		;Загрузка команды R16 (Стирание,запись,чтение) в МК
Leader4_11:	RCALL	Leader_4		;Передача преамбулы 4
	MOV	R16,R11
	RJMP	Usart_out		;Отправить байт из R16 по USART

;___________ Чтение Flash памяти по HVPP _______________________________________________

RD_F_HVPP:	LDS	R0,Buffer_0A0+3	;Дополнительный байта адреса бит 7 
	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	LDI	R16,$02
	RCALL	Hvpp_m0		;Загрузка команды R16 (Стирание,запись,чтение) в МК
	BST	R0,7		;Записать бит во флаг Т
	BRTC	RD_F_HVPP1		;Переход если флаг T сброшен
	LDD	R17,Y+$22		;$0F (WR = RD = R/B = BS2 = 1)
	OUT	PORTC,R17
	LDD	R18,Z+2
	OUT	PORTB,R18
	RCALL	Takt		;Выдать тактовый сигнал Xtal1
RD_F_HVPP1:	RCALL	Hvpp_m11
	RCALL	Takt		;Выдать тактовый сигнал Xtal1
	RCALL	Leader_1		;Передача преамбулы 1
	RJMP	RD_F_HVPP3
RD_F_HVPP2:	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R17
	RCALL	Hvpp_m4
	RCALL	Usart_out		;Отправить байт из R16 по USART
	SBIW	R25:R24,1
	BRMI	RD_F_HVPP3
	LDD	R17,Y+$37		;$7B (XA1 = XA0 = BS1 = WR = R/B = BS2 = 1)
	RCALL	Hvpp_m5
	RCALL	Usart_out		;Отправить байт из R16 по USART
RD_F_HVPP3:	SBIW	R25:R24,1
	BRPL	RD_F_HVPP2
	RJMP	Usart_00		;Отправить $00 по USART

;___________ Запись в EEPROM по HVPP ___________________________________________________

WR_E_HVPP:	LDI	R21,$01		;R23 количество страниц
	CLR	R11
	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	MOVW	R3:R2,R25:R24
	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	MOV	R0,R25
	MOV	R1,R24
	MOV	R16,R0
	ANDI	R16,$0E
	BREQ	WR_E_HVPP2
	RCALL	Shift		;Вычисление количество строниц и байт в странице
	RJMP	WR_E_HVPP2
WR_E_HVPP1:	SBRC	R0,7
	RCALL	Hvpp_m8		;Запись страницы EEPROM
WR_E_HVPP2:	SUBI	R21,1		;Количество страниц
	BRMI	WR_E_HVPP6
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_E_HVPP3
	LDI	R16,$81
	MOV	R11,R16
WR_E_HVPP3:	LDI	R16,$11		;Команда Запись EEPROM памяти
	RCALL	Hvpp_m0		;Загрузка команды R16 (Стирание,запись,чтение) в МК
	MOVW	R25:R24,R23:R22	;Количество байт в странице
	RJMP	WR_E_HVPP5
WR_E_HVPP4:	RCALL	Hvpp_m6		;Выдать импульс PAGEL
WR_E_HVPP5:	SBIW	R25:R24,1
	BRMI	WR_E_HVPP1
	RCALL	Hvpp_m12
	BST	R0,0		;Записать бит во флаг Т
	BRTS	WR_E_HVPP4		;Переход если флаг T установлен
	RCALL	Hvpp_m8		;Запись страницы EEPROM
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_E_HVPP5
	LDI	R16,$81
	MOV	R11,R16
	RJMP	WR_E_HVPP5
WR_E_HVPP6:	BST	R0,6		;Записать бит во флаг Т
	BRTC	WR_E_HVPP7		;Переход если флаг T сброшен
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_E_HVPP7
	LDI	R16,$81
	MOV	R11,R16
WR_E_HVPP7:	RJMP	Leader4_11		;Передача преамбулы 4 и R11 результат выполнения

;___________ Чтение EEPROM памяти по HVPP ______________________________________________

RD_E_HVPP:	RCALL	Read_2byte		;Чтение из ОЗУ двух байт в R25-R24
	RCALL	Leader_1		;Передача преамбулы 1
	LDI	R16,$03
	RCALL	Hvpp_m0		;Загрузка команды R16 (Стирание,запись,чтение) в МК
	RJMP	RD_E_HVPP2
RD_E_HVPP1:	RCALL	Hvpp_m11
	RCALL	Takt		;Выдать тактовый сигнал Xtal1
	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R17
	RCALL	Hvpp_m4
	RCALL	Usart_out		;Отправить байт из R16 по USART
RD_E_HVPP2:	SBIW	R25:R24,1
	BRPL	RD_E_HVPP1
	RJMP	Usart_00		;Отправить $00 по USART

;___________ Служебные подпрограммы для HVPP ___________________________________________

Hvpp_m0:	LDD	R17,Y+$28		;$4E (XA1 = WR = RD = R/B = 1)
	OUT	PORTC,R17
	RJMP	Hvpp_m3		;R16 в порт В и выдать Xtal1
Hvpp_m1:	RCALL	Hvpp_m0		;Загрузка команды R16 (Стирание,запись,чтение) в МК
	LDD	R17,Y+$24		;$2E (XA0 = WR = RD = R/B = 1)
Hvpp_m2:	OUT	PORTC,R17
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
Hvpp_m3:	OUT	PORTB,R16
	RJMP	Takt		;Выдать тактовый сигнал Xtal1

Hvpp_m4:	RCALL	Addr_Inc		;Инкрементирование текущего адреса FLASH или Eeprom памяти
	RCALL	Takt		;Выдать тактовый сигнал Xtal1
	LDD	R17,Y+$34		;$6A (XA1 = XA0 = WR = R/B = 1)
Hvpp_m5:	OUT	PORTC,R17
	OUT	DDRB,R29		;Порт В на ввод
	SER	R16
	OUT	PORTB,R16
	LPM	R16,Z
	LPM	R16,Z
	IN	R16,PINB
	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R17
	SER	R17
	OUT	DDRB,R17
	OUT	PORTB,R29
	RET

Hvpp_m6:	LDD	R17,Y+$38		;$BE (PAGEL = XA0 = BS1 = WR = RD = R/B = 1)
	OUT	PORTC,R17
	LPM	R17,Z
Hvpp_m7:	LDD	R17,Y+$2D		;$7E (XA1 = XA0 = BS1 = WR = RD = R/B = 1)
	RJMP	Hvpp_m10

Hvpp_m8:	LDD	R17,Y+$30		;$66 (XA1 = XA0 = RD = R/B = 1)
Hvpp_m9:	OUT	PORTC,R17
	LDI	R16,$02
	RCALL	Latency		;Пауза 1,628 мкс * (R16+1)
	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
Hvpp_m10:	OUT	PORTC,R17
	RET

Hvpp_m11:	LDS	R16,Buffer_0A0+1	;Текущий адрес Flash или Eeprom памяти
	LDD	R17,Y+$21		;$1E (BS1 = WR = RD = R/B = 1)
	RJMP	Hvpp_m13

Hvpp_m12:	RCALL	Hvpp_m11
	RCALL	Takt		;Выдать тактовый сигнал Xtal1
	RCALL	Addr_Inc		;Инкрементирование текущего адреса FLASH или Eeprom памяти
	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R17
	RCALL	Takt		;Выдать тактовый сигнал Xtal1
	RCALL	Read_byte		;Чтение из ОЗУ байта в R16
	LDD	R17,Y+$24		;$2E (XA0 = WR = RD = R/B = 1)
Hvpp_m13:	OUT	PORTB,R16
	OUT	PORTC,R17

;___________ Выдать импульс тактового сигнала __________________________________________

Takt:	LPM	R16,Z
	LPM	R16,Z
Takt_1:	SBI	PORTD,7		;Cигнал Xtpl1 = 0 
	SBIW	R27:R26,0
	SBIW	R27:R26,0
	CBI	PORTD,7		;Cигнал Xtpl1 = 1
	RET

;___________ Ожидание RDY/BSY от контроллера Z = 0 или 1 HVPP __________________________

RDY_Hvpp:	MOV	R16,R1
RDY_Hvpp1:	LDI	R17,$0A
	PUSH	R0
	PUSH	R1
	MUL	R17,R16
	MOVW	R27:R26,R1:R0
	POP	R1
	POP	R0
	TST	R16
	BRNE	RDY_Hvpp4
RDY_Hvpp2:	CLZ			;Сброс флага Z
	RET
RDY_Hvpp3:	LDI	R16,$63
	RCALL	Latency		;Пауза 1,628 мкс * (R16+1)
	SBIW	R27:R26,1
	BRMI	RDY_Hvpp5
RDY_Hvpp4:	SBIS	PINC,1
	RJMP	RDY_Hvpp3
RDY_Hvpp5:	SBIC	PINC,1
	RJMP	RDY_Hvpp2
	SEZ			;Установка флага Z
	RET

;___________ Количество строниц и байт в странице ______________________________________

Shift:	MOV	R21,R0
	LDI	R22,1
	LDI	R23,$00
	LSR	R21
	ANDI	R21,$07
Shift_1:	LSL	R22		;$0001 В R23-R22 сдвинуть влево на в R21
	ROL	R23		;R23-R22 количество байт в странице у микроконтроллера
	LSR	R3
	ROR	R2
	DEC	R21
	BRNE	Shift_1
	MOV	R21,R2		;Количество страниц
	RET

;___________ Инициализация таймера Т1 __________________________________________________

Init_T1:	LDI	R16,$21
	OUT	TCCR1A,R16
	LDI	R16,$B7
	OUT	OCR1BH,R29
	OUT	OCR1BL,R16
	LDI	R16,1
	OUT	TCCR1B,R16
	RET
;_______________________________________________________________________________________

.INCLUDE "HVSP.asm"
