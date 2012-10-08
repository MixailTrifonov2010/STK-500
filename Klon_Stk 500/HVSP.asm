

;___________ ���� ���������������� � ����� HVSP ________________________________________

Start_HVSP:	RCALL	Init_T1		;������������� ������� �1
	OUT	SPCR,R1		;��������� SPI ������
	SBI	PORTD,2		;C����� Reset = 1 (�� ���� VT5)
	OUT	TCCR2,R29		;��������� ������ �2
	CBI	PORTD,5		;�������� +5v
	SBI	PORTD,3		;��������� +12v
	CBI	PORTD,7		;C����� Xtpl1 = 1
	LDI	R20,$08	 
	RCALL	Read_N_byt		;������ �� ��� ������ ���� � R0-R7
	STD	Y+$16,R3		;���������� �������� ��������� � ������ HVSP
	SBI	PORTD,2		;C����� Reset = 1 (�� ���� VT5)
	MOV	R16,R0
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
	OUT	PORTB,R29
	LDI	R16,$07
	OUT	DDRB,R16
	MOV	R16,R0
	RCALL	Latency		;����� 1,628 ��� * (R16+1
	TST	R4
	BRNE	St_HVSP1
	LDI	R18,$0A
	RCALL	Takt_Hvsp1		;������ N = R18 �������� ���������
	TST	R4
	BREQ	St_HVSP2
St_HVSP1:	MOV	R16,R0
	RCALL	Latency		;����� 1,628 ��� * (R16+1)
	MOV	R18,R5
	RCALL	Takt_Hvsp1		;������ N = R18 �������� ���������
St_HVSP2:	CBI	PORTD,2		;C����� Reset = 0 (�� ���� VT5)
	MOV	R16,R0
	RCALL	Latency		;����� 1,628 ��� * (R16+1)
	CBI	PORTD,3		;�������� +12v
	LDI	R16,$63
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
	LDI	R16,$00
	RJMP	Lead4_00		;�������� ��������� 4 � $00 � USART

;___________ ��������� ������� �� �� �� HVSP ��������� _________________________________ 

HVSP_close:	SBI	PORTD,3		;��������� +12v 
	MOV	R16,R25
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
	SBI	PORTD,2		;C����� Reset = 1 (�� ���� VT5)
	OUT	DDRB,R29		;���� B �� ����
	OUT	PORTB,R29
	OUT	DDRC,R29		;���� � �� ����
	OUT	PORTC,R29
	MOV	R16,R24
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
	SBI	PORTD,5		;��������� +5v
	RJMP	Lead4_00		;�������� ��������� 4 � $00 � USART

;___________ �������� ��������� �� HVSP ________________________________________________

Erase_HVSP:	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	LDD	R17,Y+$20		;$4C - ������� 
	LDD	R16,Y+$34		;$80 - ������
	RCALL	Hvsp_m8
	RCALL	Hvsp_m0
	TST	R25
	BREQ	Er_HVSP2
	MOV	R16,R24
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
	RCALL	Hvsp_m6
Er_HVSP1:	RJMP	Usart_00		;��������� $00 �� USART
Er_HVSP2:	RCALL	Hvsp_m6
	MOV	R16,R24
	RCALL	RDY_Hvsp2		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	Er_HVSP1
	RJMP	Usart_81		;��������� $81 �� USART

;___________ ������ Flash ������ � ������ HVSP _________________________________________

WR_F_HVSP:	CLR	R11
	LDI	R21,1
	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	MOVW	R3:R2,R25:R24
	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	MOV	R0,R25
	MOV	R1,R24
	LDD	R17,Y+$20		;$4C - ������� 
	LDD	R16,Y+$37		;$10 - ������
	RCALL	Hvsp_m8
	MOVW	R23:R22,R3:R2        	;���������� ������������ ����
	MOV	R16,R0
	SBRS	R16,0
	RJMP	WR_F_HVSP5
	ANDI	R16,$0E
	BREQ	WR_F_HVSP1
	RCALL	Shift		;���������� ���������� ������� � ���� � ��������
WR_F_HVSP1:	LSR	R23
	ROR	R22         	;���������� ���� � �������� � ����������������
	RJMP	WR_F_HVSP8
WR_F_HVSP2:	RCALL	Read_byte		;������ �� ��� ����� � R16
	LDD	R17,Y+$24		;$3C - �������
	RCALL	Hvsp_m8
	LDI	R16,6
	RCALL	RDY_Hvsp		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVSP4
WR_F_HVSP3:	LDI	R16,$81
	MOV	R11,R16
WR_F_HVSP4:	RCALL	Addr_Inc1		;����������������� �������� ������ FLASH ��� Eeprom ������
	SUBI	R22,2
	SBCI	R23,0		;R23-R22 - 2
	BREQ	WR_F_HVSP10
WR_F_HVSP5:	LDD	R17,Y+$22		;$1C - �������
 	LDS	R16,Buffer_0A0+1	;������� ���� ������
	RCALL	Hvsp_m8
	LDD	R17,Y+$21		;$0C - �������
	LDS	R16,Buffer_0A0	;������� ���� ������
	RCALL	Hvsp_m4
	LDI	R16,5
	RCALL	RDY_Hvsp		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVSP2
	RJMP	WR_F_HVSP3
WR_F_HVSP6:	RCALL	Hvsp_m3
	RCALL	Read_byte		;������ �� ��� ����� � R16
	LDD	R17,Y+$24		;$3C - �������
	RCALL	Hvsp_m8
	LDI	R16,$11
	RCALL	Hvsp_m5
WR_F_HVSP7:	SBIW	R25:R24,1
	BRPL	WR_F_HVSP6
	MOV	R16,R0
	SBRS	R16,7
	RJMP	WR_F_HVSP8
	LDD	R17,Y+$22		;$1C - ������� 
	LDS	R20,Buffer_0A0
	LDS	R21,Buffer_0A0+1	;������� ����� Flash ��� Eeprom ������
	SUBI	R20,1
	SBCI	R21,0		;R21-R20 - 1
	MOV	R16,R21
	RCALL	Hvsp_m8
	LDI	R16,5
	RCALL	Hvsp_m5
WR_F_HVSP8:	SUBI	R21,1
	BRMI	WR_F_HVSP9
	MOVW	R25:R24,R23:R22
	RCALL	RDY_Hvsp1		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVSP7
	LDI	R16,$81
	MOV	R11,R16
	RJMP	WR_F_HVSP7
WR_F_HVSP9:	MOV	R16,R0
	SBRS	R16,6
	RJMP	Leader4_11		;�������� ��������� 4 � R11 ��������� ����������
	RCALL	RDY_Hvsp1		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVSP10
	LDI	R16,$81
	MOV	R11,R16
WR_F_HVSP10:RJMP	Leader4_11		;�������� ��������� 4 � R11 ��������� ����������

;___________ ������ Flash ������ _______________________________________________________

RD_F_HVSP:	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	LDD	R17,Y+$20		;$4C - �������
	LDI	R23,$00
	LDD	R16,Y+$3B		;$02 - ������
	RCALL	Leader_0		;������ � �� R17-�������,R16-������,�������� ��������� 0
	RJMP	RD_F_HVSP3
RD_F_HVSP1:	LDD	R16,Y+$16		;���������� �������� ��������� � ������ HVSP
	DEC	R16
	MOV	R17,R16
	LSL	R16
	LSL	R16
	ADD	R16,R17
	RCALL	Latency		;����� 1,628 ��� * (R16+1
	LDD	R17,Y+$21		;$0C - �������
	LDS	R16,Buffer_0A0	;������� ���� ������
	RCALL	Hvsp_m8
	TST	R23
	BRNE	RD_F_HVSP2
	LDD	R17,Y+$22		;$1C - �������
 	LDS	R16,Buffer_0A0+1	;������� ���� ������
	RCALL	Hvsp_m8
	LDI	R23,1
RD_F_HVSP2:	LDD	R17,Y+$28		;$68 - ������� 
	RCALL	Hvsp_m14
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	LDD	R17,Y+$29		;$78 - ������� 
	RCALL	Hvsp_m14
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	RCALL	Addr_Inc1		;����������������� �������� ������ FLASH ��� Eeprom ������
RD_F_HVSP3:	SBIW	R25:R24,2
	BRPL	RD_F_HVSP1
	RJMP	Usart_00		;��������� $00 �� USART

;___________ ������ EEPROM ������ � ������ HVSP ________________________________________

WR_E_HVSP:	CLR	R11
	LDI	R21,1
	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	MOVW	R3:R2,R25:R24
	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R0,R16
	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R1,R16
	MOV	R16,R0
	ANDI	R16,$0E
	BREQ	WR_E_HVSP2
	RCALL	Shift		;���������� ���������� ������� � ���� � ��������
	RJMP	WR_E_HVSP2
WR_E_HVSP1:	BST	R0,7		;�������� ��� �� ���� �
	BRTC	WR_E_HVSP2		;������� ���� ���� T �������
	LDI	R16,5
	RCALL	Hvsp_m5
WR_E_HVSP2:	SUBI	R21,1
	BRMI	WR_E_HVSP6
	RCALL	RDY_Hvsp1		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_E_HVSP3
	LDI	R16,$81
	MOV	R11,R16
WR_E_HVSP3:	LDD	R17,Y+$20		;$4C - ������� 
	LDD	R16,Y+$38		;$11 - ������
	RCALL	Hvsp_m8
	MOVW	R25:R24,R23:R22
	RJMP	WR_E_HVSP5
WR_E_HVSP4:	LDI	R16,$12
	RCALL	Hvsp_m5
WR_E_HVSP5:	SBIW	R25:R24,1
	BRMI	WR_E_HVSP1
	LDD	R17,Y+$22		;$1C - ������� 
	LDS	R16,Buffer_0A0+1	;������� ���� ������ - ������
	RCALL	Hvsp_m8
	RCALL	Hvsp_m3
	BST	R0,0		;�������� ��� �� ���� �
	BRTS	WR_E_HVSP4		;������� ���� ���� T ����������
	LDI	R16,5
	RCALL	Hvsp_m5
	RCALL	RDY_Hvsp1		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_E_HVSP5
	LDI	R16,$81
	MOV	R11,R16
	RJMP	WR_E_HVSP5
WR_E_HVSP6:	BST	R0,6		;�������� ��� �� ���� �
	BRTC	WR_E_HVSP7		;������� ���� ���� T �������
	RCALL	RDY_Hvsp1		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_E_HVSP7
	LDI	R16,$81
	MOV	R11,R16
WR_E_HVSP7:	RJMP	Leader4_11		;�������� ��������� 4 � R11 ��������� ����������

;___________ ������ EEPROM ������ ______________________________________________________

RD_E_HVSP:	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	LDD	R17,Y+$20		;$4C - �������
	LDI	R23,$00
	LDD	R16,Y+$3C		;$03 - ������
	RCALL	Leader_0		;������ � �� R17-�������,R16-������,�������� ��������� 0
	RJMP	RD_E_HVSP3
RD_E_HVSP1:	RCALL	Addr_Inc1
	MOVW	R21:R20,R17:R16
	LDD	R17,Y+$21		;$0C - ������� 
	RCALL	Hvsp_m8
	TST	R23
	BRNE	RD_E_HVSP2
	LDD	R17,Y+$22		;$1C - �������
 	LDS	R16,Buffer_0A0+1	;������� ���� ������
	RCALL	Hvsp_m8
	LDI	R23,1
RD_E_HVSP2:	LDD	R17,Y+$2E		;$68 - ������� 
	RCALL	Hvsp_m14
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
RD_E_HVSP3:	SBIW	R25:R24,1
	BRPL	RD_E_HVSP1
	RJMP	Usart_00		;��������� $00 �� USART

;___________ ������ ���������������� ����� � ������ HVSP _______________________________

Conf_SPw:	RCALL	Read_byte		;������ �� ��� ����� � R16
	TST	R16
	BRNE	Conf_SPw1
	LDI	R24,5
	RJMP	Conf_SPw3
Conf_SPw1:	CPI	R16,1
	BRNE	Conf_SPw2
	LDI	R24,6
	RJMP	Conf_SPw3
Conf_SPw2:	LDI	R24,7
Conf_SPw3:	LDD	R17,Y+$20		;$4C - ������� 
	LDD	R16,Y+$35		;$40 - ������
	RCALL	Hvsp_m4
	MOV	R16,R24
	RCALL	Hvsp_m1
	RCALL	Read_byte		;������ �� ��� ����� � R16
	RCALL	RDY_Hvsp2		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	Conf_SPw4
	RJMP	Usart_81		;��������� $81 �� USART
Conf_SPw4:	RJMP	Usart_00		;��������� $00 �� USART

;___________ ������ ���������������� ����� � ������ HVSP _______________________________

Conf_SPr:	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R24,R16
	LDD	R17,Y+$20		;$4C - ������� 
	LDD	R16,Y+$3A		;$04 - ������
	RCALL	Hvsp_m8
	LDI	R25,$00
	ADIW	R25:R24,$0B
	MOVW	R31:R30,R25:R24
	SUBI	R30,$E0
	SBCI	R31,$FE		;R31-R30 + $0020
	LD	R17,Z
	RCALL	Hvsp_m14
	RJMP	Rate_RD_2		;�������� ��������� 5 � ��������� $00 �� USART

;___________ ������ ����� ������ � ������ HVSP _________________________________________

Prot_SPw:	RCALL	Read_byte		;������ �� ��� ����� � R16
	LDD	R17,Y+$20		;$4C - ������� 
	LDD	R16,Y+$36		;$20 - ������
	RCALL	Hvsp_m4
	RCALL	Hvsp_m0
	RCALL	Read_byte		;������ �� ��� ����� � R16
	RCALL	RDY_Hvsp2		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	Prot_SPw1
	RJMP	Usart_81		;��������� $81 �� USART
Prot_SPw1:	RJMP	Usart_00		;��������� $00 �� USART

;___________ ������ ����� ������ � ������ HVSP _________________________________________

Prot_SPr:	RCALL	Read_byte		;������ �� ��� ����� � R16
	LDD	R17,Y+$20		;$4C - �������
	LDD	R16,Y+$3E		;$04 - ������
	RCALL	Hvsp_m8
	LDD	R17,Y+$30		;$78 - �������
	RCALL	Hvsp_m14
	RJMP	Rate_RD_2		;�������� ��������� 5 � ��������� $00 �� USART

;___________ ������ ��������� � ������ HVSP ____________________________________________

Sign_HVSP:	LDD	R17,Y+$20		;$4C - �������
	LDD	R16,Y+$39		;$08 - ������
	RCALL	Hvsp_m2
	LDD	R17,Y+$2A		;$68 - �������
	RCALL	Hvsp_m14
	RJMP	Rate_RD_2		;�������� ��������� 5 � ��������� $00 �� USART

;___________ ������ ������������� ������ � ������ HVSP _________________________________

Calibr_SP:	LDD	R17,Y+$20		;$4C - �������
	LDD	R16,Y+$3D		;$08 - ������
	RCALL	Hvsp_m2
	LDD	R17,Y+$2F		;$78 - �������
	RCALL	Hvsp_m14
	RJMP	Rate_RD_2		;�������� ��������� 5 � ��������� $00 �� USART

;___________ ��������� ������������ ��� HVSP ___________________________________________

Hvsp_m0:	LDI	R16,$05
Hvsp_m1:	RCALL	Hvsp_m5
Hvsp_m2:	RCALL	Hvsp_m8
	RCALL	Read_byte		;������ �� ��� ����� � R16
	LDD	R17,Y+$21		;$0C - �������
	RJMP	Hvsp_m8

Hvsp_m3:	RCALL	Addr_Inc1
	MOVW	R21:R20,R17:R16	;R16 ������� ���� ������ - ������
	LDD	R17,Y+$21		;$0C - �������
Hvsp_m4:	RCALL	Hvsp_m8
	RCALL	Read_byte		;������ �� ��� ����� � R16
	LDD	R17,Y+$23		;$2C - �������
	RJMP	Hvsp_m8

Hvsp_m5:	PUSH	R24
	MOV	R24,R16
	LDI	R26,LOW(Buffer_080)
	LDI	R27,HIGH(Buffer_080)	;R27-R26 = $0080
	ADD	R26,R16
	ADC	R27,R29		;R31-R30 = $0020 + R16
	LD	R17,X
	RCALL	Hvsp_m7
	LDI	R26,LOW(Buffer_080)
	LDI	R27,HIGH(Buffer_080)	;R27-R26 = $0080
	ADD	R26,R24
	ADC	R27,R29		;R31-R30 = $0020 + R24
	LD	R16,X
	LDD	R17,Y+$33		;$0C - �������
	OR	R17,R16
	RCALL	Hvsp_m7
	POP	R24
	RET

;___________ ������ ������� � R17 � ������ � R16 _______________________________________

Hvsp_m6:	LDD	R17,Y+$20		;$4C - �������
Hvsp_m7:	LDI	R16,$00
Hvsp_m8:	LDI	R19,$08
	RCALL	Takt_Hvsp		;������ N �������� ���������
Hvsp_m9:	BST	R17,7		;�������� ��� �� ���� �
	BRTC	Hvsp_m10		;������� ���� ���� T �������
	SBI	PORTB,1		;���������� ������ SII = 1
	RJMP	Hvsp_m11
Hvsp_m10:	CBI	PORTB,1		;���������� ������ SII = 0
Hvsp_m11:	BST	R16,7		;�������� ��� �� ���� �
	BRTC	Hvsp_m12		;������� ���� ���� T �������
	SBI	PORTB,0		;���������� ������ SDI = 1
	RJMP	Hvsp_m13
Hvsp_m12:	CBI	PORTB,0		;���������� ������ SDI = 0
Hvsp_m13:	LSL	R16
	LSL	R17
	RCALL	Takt_Hvsp		;������ N = R18 �������� ���������
	DEC	R19
	BRNE	Hvsp_m9
	RCALL	Takt_Hvsp		;������ N �������� ���������
	RJMP	Takt_Hvsp		;������ N �������� ���������

;___________ ������ ������� � ������� ������ � R16 _____________________________________

Hvsp_m14:	PUSH	R25
	PUSH	R24
	MOV	R25,R17
	LDI	R24,$08
	CBI	PORTB,0
	RCALL	Hvsp_m7
	LDD	R19,Y+$33		;$0C - �������
	OR	R19,R25
	LDI	R16,$00
	SBIC	PINB,2
	LDI	R16,$01
	RCALL	Takt_Hvsp		;������ N �������� ���������
Hvsp_m15:	BST	R19,7		;�������� ��� �� ���� �
	BRTC	Hvsp_m16		;������� ���� ���� T �������
	SBI	PORTB,1		;���������� ������ SII = 1
	RJMP	Hvsp_m17
Hvsp_m16:	CBI	PORTB,1		;���������� ������ SII = O
Hvsp_m17:	LSL	R16
	SBIC	PINB,2
	INC	R16
	LSL	R19
	RCALL	Takt_Hvsp		;������ N �������� ���������
	DEC	R24
	BRNE	Hvsp_m15
	RCALL	Takt_Hvsp		;������ N �������� ���������
	RCALL	Takt_Hvsp		;������ N �������� ���������
	POP	R24
	POP	R25
	RET

;___________ ������ N = R18 �������� ��������� _________________________________________

Takt_Hvsp:	LDD	R18,Y+$16		;���������� �������� ��������� � ������ HVSP
	RJMP	Takt_Hvsp2
Takt_Hvsp1:	RCALL	Takt_1		;������ �������� ������ Xtal1
Takt_Hvsp2:	SUBI	R18,1
	BRPL	Takt_Hvsp1
	RET

;___________ �������� ���������� �� ����������� Z = 0 ��� 1 HVSP _______________________

RDY_Hvsp:	RCALL	Hvsp_m5
RDY_Hvsp1:	MOV	R16,R1
RDY_Hvsp2:	MOV	R27,R16
	MOV	R20,R16
	LDI	R16,$0A
	PUSH	R0		;�������� R20*R16=R16
	PUSH	R1
	MUL	R20,R16
	MOV	R16,R0
	POP	R1
	POP	R0
	MOV	R26,R16
	TST	R27
	BRNE	RDY_Hvsp5
RDY_Hvsp3:	CLZ			;����� ����� Z
	RET	
RDY_Hvsp4:	LDI	R16,$63
	RCALL	Latency		;����� 1,628 ��� * (R16+1)
	SUBI	R26,1
	BRMI	RDY_Hvsp6
RDY_Hvsp5:	SBIS	PINB,2
	RJMP	RDY_Hvsp4
RDY_Hvsp6:	SBIC	PINB,2
	RJMP	RDY_Hvsp3
	SEZ			;��������� ����� Z
	RET

;_______________________________________________________________________________________

.INCLUDE "Timer_USART.asm"

