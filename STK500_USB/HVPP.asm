
;___________ Копировать коды команд высоковольтного программирования 32 байта __________

Copy_32:	LDI	R26,$00
	LDI	R27,$04
	LDI	R19,$20
Copy_32_1:	RCALL	Copy_N		;Чтение из ОЗУ N байт и запись по адресу в R27-R26
	RJMP	Erase_HVPP1		;Ответ ПК на команду - Команда выполнена

;___________ Ввод микроконтроллера в режим HVPP ________________________________________

Start_HVPP:	RCALL	Init_T1		;Инициализация таймера Т1
	OUT	SPCR,R1		;Отключить SPI модуль
	OUT	TCCR2,R1		;Выключить таймер Т2
	CBI	PORTD,5		;Включить +5v
	SBI	PORTD,1		;Выключить +12v 
	CBI	PORTD,7		;Cигнал Xtpl1 = 1 
	LDI	R19,$0E
	OUT	PORTC,R19
	LDI	R20,$FD
	OUT	DDRC,R20		;Порт С на вывод
	LDI	R19,$04	 
	RCALL	Read_N_byt		;Чтение из ОЗУ четырёх байт в R2-R5
	MOV	R24,R2
	RCALL	Delay		;Пауза длительностью 1 мс * (R24+1)
	SBI	PORTD,0		;Cигнал Reset = 1 (на базу VT3)
	TST	R5
	BRNE	St_HVPP2
St_HVPP1:	RCALL	Takt_1		;Выдать тактовый сигнал Xtal1
	DEC	R4
	BRNE	St_HVPP1
St_HVPP2:	CBI	PORTD,0		;Cигнал Reset = 0 (на базу VT3)
	SER	R25
	OUT	PORTB,R25		;Cигналы-Data7...0 = 0
	OUT	DDRB,R25		;Порт В на вывод
	CBI	PORTD,1		;Включить +12v 
	CLR	R24
	RCALL	Delay		;Пауза длительностью 1 мс * (R24+1)
	RJMP	Erase_HVPP1		;Ответ ПК на команду - Команда выполнена

;___________ Последняя команда от ПК по HVPP завершена _________________________________ 

HVPP_close:	SBI	PORTD,1		;Выключить +12v 
	OUT	TCCR1A,R1	
	OUT	TCCR1B,R1		;Выключить таймер Т1
	OUT	PORTB,R1
	OUT	DDRB,R1		;Порт В на ввод
	OUT	PORTC,R1
	OUT	DDRC,R1		;Порт С на ввод
	SBI	PORTD,5		;Выключить +5v
	SBI	PORTD,0		;Cигнал Reset = 1 (на базу VT3)
	RJMP	Erase_HVPP1		;Ответ ПК на команду - Команда выполнена

;___________ Стирание кристалла по HVPP ________________________________________________

Erase_HVPP:	RCALL	Addr_HVPP		;Адрес команд высоковольтного программирования	и первого байта данных от ПК 
	LDI	R24,$80
	RCALL	Hvpp_m0		;Загрузка команды R24 (Стирание,запись,чтение) в МК
	LD	R5,Z+		;Чтение из ОЗУ байта
	RCALL	Hvpp_m8
	LD	R5,Z+		;Чтение из ОЗУ байта
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	Erase_HVPP1
	RJMP	Answer		;Ответ ПК на команду - Команда не выполнена
Erase_HVPP1:CLR	R24
	RJMP	Answer_1		;Ответ ПК на команду - Команда выполнена

;___________ Чтение сигнатуры микроконтроллера в режиме HVPP ___________________________

Sign_HVPP:	RCALL	Calibr_PP3
	LDD	R25,Y+20		;$6A (XA1 = XA0 = WR = R/B = 1)
	RJMP	Calibr_PP1		;Ответ ПК на команду - Команда выполнена

;___________ Чтение калибровочной ячейки в режиме HVPP _________________________________

Calibr_PP:	RCALL	Calibr_PP3
	LDD	R25,Y+21		;$7A (XA1 = XA0 = BS1 = WR = R/B = 1)
Calibr_PP1:	RCALL	Hvpp_m5
Calibr_PP2:	LDI	R28,$03
	LDI	R29,$00
	STS	Spool_Out+1,R24
	RJMP	Answer_3		;Ответ ПК на команду - Команда выполнена
Calibr_PP3:	RCALL	Addr_HVPP		;Адрес команд высоковольтного программирования	и первого байта данных от ПК 
	LDI	R24,$08		;Команда чтение идентификатора
	RCALL	Hvpp_m0		;Загрузка команды R24 (Стирание,запись,чтение) в МК
	LDD	R25,Y+0
	RJMP	Hvpp_m2		;R25 в порт C из ОЗУ в R24 в порт C и Xtal1

;___________ Чтение байта защиты по HVPP _______________________________________________

Prot_PPr:	LDI	R24,$03
	STS	Spool_Inp,R24

;___________ Чтение конфигурационных ячеек _____________________________________________

Conf_PPr:	RCALL	Addr_HVPP		;Адрес команд высоковольтного программирования	и первого байта данных от ПК 
	LDI	R24,$04
	RCALL	Hvpp_m0		;Загрузка команды R24 (Стирание,запись,чтение) в МК
	LD	R23,Z+		;Чтение из ОЗУ байта
	LDD	R25,Y+20		;$6A (XA1 = XA0 = WR = R/B = 1)
	TST	R23
	BREQ	Calibr_PP1
	LDD	R25,Y+23		;$7B (XA1 = XA0 = BS1 = WR = R/B = BS2 = 1)
	DEC	R23
	BREQ	Calibr_PP1
	LDD	R25,Y+22		;$6B (XA1 = XA0 = WR = R/B = BS2 = 1)
	DEC	R23
	BREQ	Calibr_PP1
	LDD	R25,Y+21		;$7A (XA1 = XA0 = BS1 = WR = R/B = 1)
	DEC	R23
	BREQ	Calibr_PP1
	RJMP	Answer		;Ответ ПК на команду - Команда не поддерживается

;___________ Чтение EEPROM памяти по HVPP ______________________________________________

RD_E_HVPP:	LDS	R27,Spool_Inp
	LDS	R26,Spool_Inp+1	;R27-R26 - количество читаемых байт
	MOVW	R3:R2,R27:R26
	LDI	R30,LOW(Spool_Out+1)
	LDI	R31,HIGH(Spool_Out+1)	;Первый байт ответа программатора на команду ПК
	LDI	R28,$00
	LDI	R29,$04		;Адрес команд высоковольтного программирования 
	LDI	R24,$03
	RCALL	Hvpp_m0		;Загрузка команды R24 (Стирание,запись,чтение) в МК
	RJMP	RD_E_HVPP2
RD_E_HVPP1:	RCALL	Hvpp_m10
	LDD	R25,Y+0		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R25
	RCALL	Hvpp_m4
	ST	Z+,R24
RD_E_HVPP2:	SBIW	R27:R26,1
	BRPL	RD_E_HVPP1
RD_E_HVPP3:	MOVW	R29:R28,R3:R2
	ADIW	R29:R28,3
	RJMP	Answer_3		;Ответ ПК на команду - Команда выполнена

;___________ Чтение Flash памяти по HVPP _______________________________________________

RD_F_HVPP:	LDS	R27,Spool_Inp
	LDS	R26,Spool_Inp+1	;R27-R26 - количество читаемых байт
	LDS	R5,Spool_Inp+2
	MOVW	R3:R2,R27:R26
	LDI	R28,$00
	LDI	R29,$04		;Адрес команд высоковольтного программирования 
	LDD	R4,Y+3
	LDI	R30,LOW(Spool_Out+1)
	LDI	R31,HIGH(Spool_Out+1)	;Первый байт ответа программатора на команду ПК
	LDI	R24,$02
	RCALL	Hvpp_m0		;Загрузка команды R24 (Стирание,запись,чтение) в МК
	BST	R4,7		;Записать бит во флаг Т
	BRTC	RD_F_HVPP1		;Переход если флаг T сброшен
	LDD	R25,Y+2		;$0F (WR = RD = R/B = BS2 = 1)
	OUT	PORTC,R25
	OUT	PORTB,R5
	RCALL	Takt		;Выдать тактовый сигнал Xtal1
RD_F_HVPP1:	RCALL	Hvpp_m10
	RJMP	RD_F_HVPP3
RD_F_HVPP2:	LDD	R25,Y+0		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R25
	RCALL	Hvpp_m4
	ST	Z+,R24
	SBIW	R27:R26,1
	BRMI	RD_F_HVPP3
	LDD	R25,Y+23		;$7B (XA1 = XA0 = BS1 = WR = R/B = BS2 = 1)
	RCALL	Hvpp_m5
	ST	Z+,R24
RD_F_HVPP3:	SBIW	R27:R26,1
	BRPL	RD_F_HVPP2
	RJMP	RD_E_HVPP3		;Ответ ПК на команду - Команда выполнена

;___________ Запись конфигурационных ячеек _____________________________________________

Conf_PPw:	RCALL	Addr_HVPP		;Адрес команд высоковольтного программирования	и первого байта данных от ПК 
	LD	R23,Z+		;Чтение из ОЗУ байта
	LDI	R24,$40
	RCALL	Hvpp_m1
	LDD	R24,Y+16		;$66 (XA1 = XA0 = RD = R/B = 1)
	LDD	R25,Y+12		;$6E (XA1 = XA0 = WR = RD = R/B = 1)
	TST	R23
	BREQ	Conf_PPw1
	LDD	R24,Y+17		;$76 (XA1 = XA0 = BS1 = RD = R/B = 1)
	LDD	R25,Y+13		;$7E (XA1 = XA0 = BS1 = WR = RD = R/B = 1)
	DEC	R23
	BREQ	Conf_PPw1
	LDD	R24,Y+18		;$67 (XA1 = XA0 = RD = R/B = BS2 = 1)
	LDD	R25,Y+14		;$6F (XA1 = XA0 = WR = RD = R/B = BS2 = 1)
	DEC	R23
	BREQ	Conf_PPw1
	RJMP	Conf_PPw2
Conf_PPw1:	OUT	PORTC,R24
	LD	R1,Z+		;Чтение из ОЗУ байта
	RCALL	Latency		;Пауза 1 мкс * R1
	OUT	PORTC,R25
Conf_PPw2:	LD	R5,Z+		;Чтение из ОЗУ байта
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	Conf_PPw3
	RJMP	Answer		;Ответ ПК на команду - Команда не выполнена
Conf_PPw3:	CLR	R24
	RJMP	Answer_1		;Ответ ПК на команду - Команда выполнена

;___________ Запись байта защиты _______________________________________________________

Prot_PPw:	RCALL	Addr_HVPP		;Адрес команд высоковольтного программирования	и первого байта данных от ПК 
	LD	R25,Z+		;Чтение из ОЗУ байта
	LDI	R24,$20
	RCALL	Hvpp_m1		;Загрузка команды R24 (Стирание,запись,чтение) в МК
	RCALL	Hvpp_m8
Prot_PPw1:	RJMP	Conf_PPw3		;Ответ ПК на команду - Команда выполнена

;___________ Запись во Flash память по HVPP ____________________________________________

WR_F_HVPP:	RCALL	Addr_HVPP		;Адрес команд высоковольтного программирования	и первого байта данных от ПК 
	LD	R3,Z+
	LD	R2,Z+
	LD	R4,Z+
	LD	R5,Z+
	CLR	R20
	LDI	R21,$01		;R21 количество страниц
	LDS	R6,Cur_addr1	;Текущий адрес Flash или Eeprom памяти ст. байт
	MOVW	R27:R26,R3:R2
	LDI	R24,$10
	RCALL	Hvpp_m0		;Загрузка команды R24 (Стирание,запись,чтение) в МК
	MOV	R24,R4
	SBRS	R24,0
	RJMP	WR_F_HVPP5
	ANDI	R24,$0E
	BRNE	WR_F_HVPP1
	RJMP	WR_F_HVPP9
WR_F_HVPP1:	RCALL	Shift		;Вычисление количество строниц и байт в странице
	LSR	R23
	ROR	R22		;R23-R22 количество слов в странице у микроконтроллера
	RJMP	WR_F_HVPP9
	;Загрузка во Flash память
WR_F_HVPP2:	LDD	R25,Y+5		;$3E (XA0 = BS1 = WR = RD = R/B = 1)
	RCALL	Hvpp_m2		;R25 в порт C из ОЗУ в R24 в порт C и Xtal1
	LDD	R25,Y+17		;$76 (XA1 = XA0 = BS1 = RD = R/B = 1)
	OUT	PORTC,R25		;Выдать команду WR
	LDI	R24,$0A
	MOV	R1,R24
	RCALL	Latency		;Пауза 1 мкс * R1
	RCALL	Hvpp_m7		;$7E (XA1 = XA0 = BS1 = WR = RD = R/B = 1) в порт С
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_F_HVPP4
WR_F_HVPP3:	LDI	R20,$81
WR_F_HVPP4:	SBIW	R27:R26,2		;R3-R2 количество байт в странице у микроконтроллера
	BREQ	WR_F_HVPP11		;Ответ ПК на команду
WR_F_HVPP5:	RCALL	Hvpp_m11
	RCALL	Hvpp_m8		;Запись во Flash память
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_F_HVPP2
	RJMP	WR_F_HVPP3
	;Загрузка в буфер страницы
WR_F_HVPP6:	LDD	R25,Y+0		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R25
	RCALL	Addr_Inc		;Инкрементирование текущего адреса FLASH памяти
	RCALL	Takt_1		;Выдать тактовый сигнал Xtal1
	LDD	R25,Y+4		;$2E (XA0 = WR = RD = R/B = 1)
	OUT	PORTC,R25
	LD	R24,Z+		;Чтение из ОЗУ байта
	RCALL	Hvpp_m3		;R24 в порт В и выдать Xtal1
	LDD	R25,Y+5		;$3E (XA0 = BS1 = WR = RD = R/B = 1)
	RCALL	Hvpp_m2		;R25 в порт C из ОЗУ в R24 в порт B и Xtal1
	RCALL	Hvpp_m6		;Выдать импульс PAGEL
WR_F_HVPP7:	SBIW	R27:R26,1		;Количество слов в странице у микроконтроллера
	BRPL	WR_F_HVPP6
	SBRS	R4,7
	RJMP	WR_F_HVPP9
	LDD	R25,Y+1		;$1E (BS1 = WR = RD = R/B = 1)
	OUT	PORTC,R25
	MOV	R24,R6		;Старший байт адреса Flash памяти
	RCALL	Hvpp_m3		;R24 в порт В и выдать Xtal1
	LDS	R24,Cur_addr3	;Указатель на наличие дополнительного байта адреса (бит 7) 
	SBRS	R24,7
	RJMP	WR_F_HVPP8
	LDD	R25,Y+2		;$0F (WR = RD = R/B = BS2 = 1)
	OUT	PORTC,R25
	LDS	R24,Cur_addr2	;Текущий адрес Flash или Eeprom памяти доп. байт
	RCALL	Hvpp_m3		;R24 в порт В и выдать Xtal1
WR_F_HVPP8:	RCALL	Hvpp_m8		;Запись страницы во Flash память
WR_F_HVPP9:	SUBI	R21,1		;Количество страниц
	BRMI	WR_F_HVPP10
	MOVW	R27:R26,R23:R22	;R23-R22 количество слов в странице у микроконтроллера
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_F_HVPP7
	LDI	R20,$81
	RJMP	WR_F_HVPP7
WR_F_HVPP10:BST	R4,6		;Записать бит во флаг Т
	BRTC	WR_F_HVPP11		;Переход если флаг T сброшен
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_F_HVPP11
	LDI	R20,$81
WR_F_HVPP11:MOV	R24,R20
	LDI	R28,$02
	LDI	R29,$00
	RJMP	Answer_2		;Ответ ПК на команду

;___________ Запись в EEPROM по HVPP ___________________________________________________

WR_E_HVPP:	RCALL	Addr_HVPP		;Адрес команд высоковольтного программирования	и первого байта данных от ПК 
	LD	R3,Z+
	LD	R2,Z+
	LD	R4,Z+
	LD	R5,Z+
	CLR	R20
	LDI	R21,$01		;R21 количество страниц
	MOV	R24,R4
	ANDI	R24,$0E
	BREQ	WR_E_HVPP2
	RCALL	Shift		;Вычисление количество строниц и байт в странице
	RJMP	WR_E_HVPP2
WR_E_HVPP1:	SBRC	R4,7
	RCALL	Hvpp_m8		;Запись страницы EEPROM
WR_E_HVPP2:	SUBI	R21,1		;Количество страниц
	BRMI	WR_F_HVPP10
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_E_HVPP3
	LDI	R20,$81
WR_E_HVPP3:	LDI	R24,$11		;Команда Запись EEPROM памяти
	RCALL	Hvpp_m0		;Загрузка команды R24 (Стирание,запись,чтение) в МК
	MOVW	R27:R26,R23:R22	;Количество байт в странице
	RJMP	WR_E_HVPP5
WR_E_HVPP4:	RCALL	Hvpp_m6		;Выдать импульс PAGEL
WR_E_HVPP5:	SBIW	R27:R26,1
	BRMI	WR_E_HVPP1
	RCALL	Hvpp_m11
	BST	R4,0		;Записать бит во флаг Т
	BRTS	WR_E_HVPP4		;Переход если флаг T установлен
	RCALL	Hvpp_m8		;Запись страницы EEPROM
	RCALL	RDY_Hvpp		;Ожидание RDY/BSY от контроллера Z = 0 или 1
	BRNE	WR_E_HVPP5
	LDI	R20,$81
	RJMP	WR_E_HVPP5

;___________ Служебные подпрограммы для HVPP ___________________________________________

Hvpp_m0:	LDD	R25,Y+8		;$4E (XA1 = WR = RD = R/B = 1 загрузка команды)
	OUT	PORTC,R25
	RJMP	Hvpp_m3		;R24 в порт В и выдать Xtal1
Hvpp_m1:	RCALL	Hvpp_m0		;Загрузка команды R24 (Стирание,запись,чтение) в МК
	LDD	R25,Y+4		;$2E (XA0 = WR = RD = R/B = 1)
Hvpp_m2:	OUT	PORTC,R25
	LD	R24,Z+		;Чтение из ОЗУ байта в R24
Hvpp_m3:	OUT	PORTB,R24
	RJMP	Takt		;Выдать тактовый сигнал Xtal1

Hvpp_m4:	RCALL	Addr_Inc		;Инкрементирование текущего адреса FLASH или Eeprom памяти
	RCALL	Takt		;Выдать тактовый сигнал Xtal1
	LDD	R25,Y+20		;$6A (XA1 = XA0 = WR = R/B = 1)
Hvpp_m5:	LDI	R24,$00
	OUT	DDRB,R24		;Порт В на ввод
	SER	R24
	OUT	PORTB,R24
	OUT	PORTC,R25
	CLR	R1
	INC	R1
	RCALL	Latency		;Пауза 1 мкс * R1
	IN	R24,PINB
	LDD	R25,Y+0		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R25
	SER	R25
	OUT	DDRB,R25		;Порт В на вывод
	LDI	R25,$00
	OUT	PORTB,R25
	RET

Hvpp_m6:	LDD	R25,Y+24		;$BE (PAGEL = XA0 = BS1 = WR = RD = R/B = 1)
	OUT	PORTC,R25
	LPM	R25,Z
Hvpp_m7:	LDD	R25,Y+13		;$7E (XA1 = XA0 = BS1 = WR = RD = R/B = 1)
	RJMP	Hvpp_m9

Hvpp_m8:	LDD	R25,Y+16		;$66 (XA1 = XA0 = RD = R/B = 1)
	OUT	PORTC,R25
	LDI	R24,$03
	MOV	R1,R24
	RCALL	Latency		;Пауза 1 мкс * R1
	LDD	R25,Y+12		;$6E (XA1 = XA0 = WR = RD = R/B = 1)
Hvpp_m9:	OUT	PORTC,R25
	RET

Hvpp_m10:	LDS	R24,Cur_addr1	;Текущий адрес Flash или Eeprom памяти ст. байт
	LDD	R25,Y+1		;$1E (BS1 = WR = RD = R/B = 1)
	RJMP	Hvpp_m12

Hvpp_m11:	RCALL	Hvpp_m10
	RCALL	Addr_Inc		;Инкрементирование текущего адреса FLASH или Eeprom памяти
	LDD	R25,Y+0		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R25
	RCALL	Takt		;Выдать тактовый сигнал Xtal1
	LD	R24,Z+		;Чтение из ОЗУ байта
	LDD	R25,Y+4		;$2E (XA0 = WR = RD = R/B = 1)
Hvpp_m12:	OUT	PORTB,R24
	OUT	PORTC,R25

;___________ Выдать один импульс тактового сигнала _____________________________________

Takt:	LPM	R24,Z		;Выдать один импульс тактового сигнала 
	LPM	R24,Z
Takt_1:	SBI	PORTD,7		;Cигнал Xtpl1 = 0 
	SBIW	R25:R24,0
	SBIW	R25:R24,0
	CBI	PORTD,7		;Cигнал Xtpl1 = 1
	RET

Addr_HVPP:	LDI	R30,LOW(Spool_Inp)
	LDI	R31,HIGH(Spool_Inp)	;Первый байт данных от ПК
	LDI	R28,$00
	LDI	R29,$04		;Адрес команд высоковольтного программирования 
	RET

;___________ Ожидание RDY/BSY от контроллера Z = 0 или 1 _______________________________

RDY_Hvpp:	LDI	R25,$0A
	CLI			;Запретить глобальное прерывание
	MUL	R25,R5
	MOVW	R19:R18,R1:R0
	CLR	R1
	SEI			;Разрешить глобальное прерывание
	TST	R5
	BRNE	RDY_Hvpp5
RDY_Hvpp3:	CLZ			;Сброс флага Z
	RET
RDY_Hvpp4:	LDI	R24,$64
	MOV	R1,R24
	RCALL	Latency		;Пауза 1 мкс * R1
	SUBI	R18,$01
	SBCI	R19,$00
	BRMI	RDY_Hvpp6
RDY_Hvpp5:	SBIS	PINC,1
	RJMP	RDY_Hvpp4
RDY_Hvpp6:	SBIC	PINC,1
	RJMP	RDY_Hvpp3
	SEZ			;Установка флага Z
	RET

;___________ Инициализация таймера Т1 __________________________________________________

Init_T1:	LDI	R24,$21
	OUT	TCCR1A,R24
	LDI	R24,$77
	OUT	OCR1BH,R1
	OUT	OCR1BL,R24
	LDI	R24,1
	OUT	TCCR1B,R24
	RET

;___________ Количество строниц и байт в странице ______________________________________

Shift:	MOV	R21,R4
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
;_______________________________________________________________________________________

.INCLUDE "HVSP.asm"
