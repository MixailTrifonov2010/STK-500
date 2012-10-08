

;___________ Совпадение таймера/счётчика Т0 ____________________________________________

MatchT0:	PUSH	R24
	IN	R24,SREG
	TST	R15
	BREQ	Timer0_z
	DEC	R15
Timer0_z:	OUT	SREG,R24
	POP	R24
	RETI

;___________ Пауза длительностью 1 мс * (R16+1) ________________________________________

Delay:	MOV	R15,R16
	INC	R15
Delay_1:	TST	R15
	BRNE	Delay_1
	RETI

;___________ Пауза 1,628 мкс * (R16+1) _________________________________________________

Latency:	LPM	R17,Z
	LPM	R17,Z
	LPM	R17,Z
	SUBI	R16,1
	BRPL	Latency
	RETI

;___________ Прерывание USART - приём завершен _________________________________________

US_rxc:	PUSH	R25
	PUSH	R24
	PUSH	R31
	PUSH	R30
	PUSH	R20
	IN	R20,SREG
	IN	R24,UDR
	LDD	R25,Y+$1C
	EOR	R25,R24
	STD	Y+$1C,R25   	;Контрольная сумма принятого сообщеня по USART
	LDD	R25,Y+$19	            ;Номер байта принятой преамбулы
	TST	R25
	BREQ	US_rxc4
	DEC	R25
	BREQ	US_rxc5
	DEC	R25
	BREQ	US_rxc6
	DEC	R25
	BREQ	US_rxc7
	DEC	R25
	BREQ	US_rxc8
	DEC	R25
	BREQ	US_rxc1
	DEC	R25
	BRNE	US_rxc11
	RJMP	US_rxc9
US_rxc1:	LDD	R30,Y+$12
	LDD	R31,Y+$13
	ADIW	R31:R30,1
	STD	Y+$12,R30
	STD	Y+$13,R31		;Счётчик принимаемых байт данных по USART
	SUBI	R30,$01
	SBCI	R31,$FF		;R31-R30 + $00FF
	ST	Z,R24		;Сохранить очередной принятый байт
 	LDD	R24,Y+$12
	LDD	R25,Y+$13
	LDD	R30,Y+$10
	LDD	R31,Y+$11		;Общее количетво принимаемых байт данных по USART
	CP	R24,R30
	CPC	R25,R31
	BRCC	US_rxc3
US_rxc2:	LDI	R24,5
	RJMP	US_rxc12
US_rxc3:	LDI	R24,6
	RJMP	US_rxc12
US_rxc4:	CPI	R24,$1B		;Первый принятый байт преамбулы
	BRNE	US_rxc11
	STD	Y+$1C,R24   	;Контрольная сумма принятого сообщеня по USART
	LDI	R24,1
	RJMP	US_rxc12
US_rxc5:	STD	Y+$18,R24		;Порядковый номер команды в принятом сообщении по USART
	LDI	R24,2
	RJMP	US_rxc12
US_rxc6:	STD	Y+$11,R24		;Третий принятый байт (ст. байт кол. прин. байт)
	LDI	R24,3
	RJMP	US_rxc12
US_rxc7:	STD	Y+$10,R24		;Четвёртый принятый байт (млт. байт кол. прин. байт)
	LDI	R24,4
	RJMP	US_rxc12
US_rxc8:	CPI	R24,$0E		;Пятый принятый байт (конец преамбулы)
	BRNE	US_rxc11
	STD	Y+$12,R29
	STD	Y+$13,R29		;Счётчик принимаемых байт данных по USART
	RJMP	US_rxc2
US_rxc9:	LDD	R24,Y+$1C   	;Контрольная сумма принятого сообщеня по USART 
	TST	R24
	LDI	R24,1
	BRNE	US_rxc10
	STD	Y+$1A,R24		;Принят пакет данных ($01)
	RJMP	US_rxc11
US_rxc10:	STD	Y+$1B,R24		;Ошибка в принятом сообщении ($01)
US_rxc11:	LDI	R24,$00
US_rxc12:	STD	Y+$19,R24   	;Номер байта принятой преамбулы
	OUT	SREG,R20
	POP	R20
	POP	R30
	POP	R31
	POP	R24
	POP	R25
	RETI

;___________ Сохранить байт отправляемый по USART в буфере _____________________________

Usart_C0:	LDI	R16,$C0
	RJMP	Usart_out
Usart_81:	LDI	R16,$81
	RJMP	Usart_out
Usart_00:	LDI	R16,$00
Usart_out:	LDI	R27,$00
	LDD	R26,Y+$1E		;Счётчик записанных байт в буфер USART
	INC	R26
	ANDI	R26,$3F
Usart_out1:	LDD	R17,Y+$1F		;Счётчик переданных байт по USART
	CP	R26,R17
	BREQ	Usart_out1
            MOV         R17,R26
	SUBI	R26,$50
	SBCI	R27,$FF		;R27-R26 + $00B0
	ST	X,R16
	STD	Y+$1E,R17		;Счётчик записанных байт в буфер USART
	SBI	UCSRB,5		;Разрешить прерывание Регистр данных USART пуст
	LDD	R17,Y+$1D
	EOR	R17,R16
	STD	Y+$1D,R17		;Контрольная сумма отправленного сообщения по USART 
	RETI

;___________ Прерывание Регистр данных USART пуст ______________________________________

Us_udre:	PUSH	R31
	PUSH	R30
	PUSH	R18
	IN	R18,SREG
	LDD	R31,Y+$1E		;Счётчик записанных байт в буфер USART
	LDD	R30,Y+$1F		;Счётчик переданных байт по USART
	CP	R31,R30
	BRNE	Us_udre1
	CBI	UCSRB,5		;Запретить прерывание Регистр данных USART пуст
	RJMP	Us_udre2
Us_udre1:	INC	R30
	ANDI	R30,$3F
	STD	Y+$1F,R30		;Счётчик переданных байт по USART
	LDI	R31,$00
	SUBI	R30,$50
	SBCI	R31,$FF		;R31-R30 + $00B0
	LDD	R30,Z+0
	OUT	UDR,R30
Us_udre2:	OUT	SREG,R18
	POP	R18
	POP	R30
	POP	R31
	RETI
;_______________________________________________________________________________________

.INCLUDE "Memory.asm"
