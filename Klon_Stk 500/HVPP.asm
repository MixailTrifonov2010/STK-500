

;___________ ���� ���������������� � ����� HVPP ________________________________________

Start_HVPP:	RCALL	Init_T1		;������������� ������� �1
	OUT	SPCR,R29		;��������� SPI ������
	OUT	TCCR2,R29		;��������� ������ �2
	CBI	PORTD,5		;�������� +5v
	SBI	PORTD,3		;��������� +12v 
	CBI	PORTD,7		;C����� Xtpl1 = 1 
	LDI	R17,$0E
	LDI	R18,$FD
	OUT	PORTC,R17
	OUT	DDRC,R18
	LDI	R20,$04	 
	RCALL	Read_N_byt		;������ �� ��� ������ ���� � R0-R3
	MOV	R16,R0
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
	SBI	PORTD,2		;C����� Reset = 1 (�� ���� VT5)
	TST	R3
	BRNE	St_HVPP2
St_HVPP1:	RCALL	Takt		;������ �������� ������ Xtal1
	DEC	R2
	BRNE	St_HVPP1
St_HVPP2:	CBI	PORTD,2		;C����� Reset = 0 (�� ���� VT5)
	SER	R16
	OUT	PORTB,R16		;C������-Data7...0 = 0
	OUT	DDRB,R16		;���� � �� �����
	CBI	PORTD,3		;�������� +12v (�� ���� VT1)
	LDI	R16,$01
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
	RJMP	Lead4_00		;�������� ��������� 4 � $00 � USART

;___________ ��������� ������� �� �� �� HVPP ��������� _________________________________ 

HVPP_close:	SBI	PORTD,3		;��������� +12v
	OUT	TCCR1A,R29	
	OUT	TCCR1B,R29		;��������� ������ �1
	OUT	PORTB,R29
	OUT	DDRB,R29		;���� � �� ����
	OUT	PORTC,R29
	OUT	DDRC,R29		;���� � �� ����
	SBI	PORTD,5		;��������� +5v
	CLR	R16
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
	SBI	PORTD,2		;C����� Reset = 1 (�� ���� VT5)
	RJMP	Lead4_00		;�������� ��������� 4 � $00 � USART

;___________ �������� ��������� �� HVPP ________________________________________________

Erase_HVPP:	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	LDI	R16,$80
	RCALL	Hvpp_m0		;�������� ������� R16 (��������,������,������) � ��
	RCALL	Hvpp_m8
	MOV	R16,R24
	RCALL	RDY_Hvpp1		;�������� RDY/BSY �� ����������� Z = 0 ��� 1
	BRNE	Lead4_00		;�������� ��������� 4 � $00 � USART
	RJMP	Usart_81		;��������� $81 �� USART
Lead4_00:	RCALL	Leader_4		;�������� ��������� 4
	RJMP	Usart_00		;��������� $00 �� USART

;___________ ������ ��������� ���������������� � ������ HVPP ___________________________

Sign_HVPP:	RCALL	Calibr_PP1
	LDD	R17,Y+$34		;$6A (XA1 = XA0 = WR = R/B = 1)
	RJMP	Conf_PPr1		;�������� ��������� 5 � ��������� $00 �� USART

;___________ ������ ������������� ������ � ������ HVPP _________________________________

Calibr_PP:	RCALL	Calibr_PP1
	LDD	R17,Y+$35		;$7A (XA1 = XA0 = BS1 = WR = R/B = 1)
	RJMP	Conf_PPr1
Calibr_PP1:	LDI	R16,$08		;������� ������ ��������������
	RCALL	Hvpp_m0		;�������� ������� R16 (��������,������,������) � ��
	LDD	R17,Y+$20
	RJMP	Hvpp_m2		;R16 � ���� C �� ��� � R16 � ���� C � Xtal1

;___________ ������ ����� ������ �� HVPP _______________________________________________

Prot_PPr:	LDI	R16,$04
	RCALL	Hvpp_m0		;�������� ������� R16 (��������,������,������) � ��
	LDD	R17,Y+$35		;$7A (XA1 = XA0 = BS1 = WR = R/B = 1)
	RJMP	Conf_PPr1

;___________ ������ ���������������� ����� _____________________________________________

Conf_PPr:	LDI	R16,$04
	RCALL	Hvpp_m0		;�������� ������� R16 (��������,������,������) � ��
	RCALL	Read_byte		;������ �� ��� ����� � R16
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
	RJMP	Rate_RD_2		;�������� ��������� 5 � ��������� $C0 �� USART
Conf_PPr1:	RCALL	Hvpp_m5
	RJMP	Rate_RD_2		;�������� ��������� 5 � ��������� $00 �� USART

;___________ ������ ���������������� ����� _____________________________________________

Conf_PPw:	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R24,R16
	LDI	R16,$40
	RCALL	Hvpp_m1
	RCALL	Read_byte		;������ �� ��� ����� � R16
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
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
Conf_PPw2:	RCALL	Leader_4		;�������� ��������� 4
	RCALL	Read_byte		;������ �� ��� ����� � R16
	RCALL	RDY_Hvpp1		;�������� RDY/BSY �� ����������� Z = 0 ��� 1
	BRNE	Conf_PPw5
	RJMP	Usart_81		;��������� $81 �� USART
Conf_PPw5:	RJMP	Usart_00		;��������� $00 �� USART

;___________ ������ ����� ������ _______________________________________________________

Prot_PPw:	RCALL	Read_byte		;������ �� ��� ����� � R16
	LDI	R16,$20
	RCALL	Hvpp_m1		;�������� ������� R16 (��������,������,������) � ��
	RCALL	Read_byte		;������ �� ��� ����� � R16
	RCALL	Hvpp_m8
	RCALL	Read_byte		;������ �� ��� ����� � R16
	LSL	R16
	RCALL	RDY_Hvpp1		;�������� RDY/BSY �� ����������� Z = 0 ��� 1
	BRNE	Prot_PPw1
	RJMP	Usart_81		;��������� $81 �� USART
Prot_PPw1:	RJMP	Lead4_00		;�������� ��������� 4 � $00 � USART

;___________ ������ �� Flash ������ �� HVPP ____________________________________________

WR_F_HVPP:	CLR	R11
	LDS	R10,Buffer_0A0+1	;������� ����� Flash ��� Eeprom ������
	LDI	R21,1		;R21 ���������� �������
	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	MOVW	R3:R2,R25:R24
	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	MOV	R0,R25
	MOV	R1,R24
	LDI	R16,$10
	RCALL	Hvpp_m0		;�������� ������� R16 (��������,������,������) � ��
	MOVW	R23:R22,R3:R2        	;���������� ������������ ����
	MOV	R16,R0
	SBRS	R16,0
	RJMP	WR_F_HVPP5
	ANDI	R16,$0E
	BREQ	WR_F_HVPP1
	RCALL	Shift		;���������� ���������� ������� � ���� � ��������
WR_F_HVPP1:	LSR	R23
	ROR	R22         	;���������� ���� � �������� � ����������������
	RJMP	WR_F_HVPP9
WR_F_HVPP2:	LDD	R17,Y+$25		;$3E (XA0 = BS1 = WR = RD = R/B = 1)
	RCALL	Hvpp_m2		;R16 � ���� C �� ��� � R16 � ���� C � Xtal1
	LDD	R17,Y+$31		;$76 (XA1 = XA0 = BS1 = RD = R/B = 1)
	OUT	PORTC,R17		;������ ������� WR
	LDI	R16,$00
	RCALL	Latency		;����� 1,628 ��� * (R16+1
	RCALL	Hvpp_m7		;$7E (XA1 = XA0 = BS1 = WR = RD = R/B = 1) � ���� �
	RCALL	RDY_Hvpp		;�������� RDY/BSY �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVPP4
WR_F_HVPP3:	LDI	R16,$81
	MOV	R11,R16
WR_F_HVPP4:	SUBI	R22,2
	SBCI	R23,0		;R23-R22 - 2
	BREQ	Leader4_11
WR_F_HVPP5:	RCALL	Hvpp_m12
	RCALL	Hvpp_m8		;������ ��������
	RCALL	RDY_Hvpp		;�������� RDY/BSY �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVPP2
	RJMP	WR_F_HVPP3
	;�������� ������ ��������
WR_F_HVPP6:	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R17
	RCALL	Addr_Inc		;����������������� �������� ������ FLASH ������
	RCALL	Takt		;������ �������� ������ Xtal1
	LDD	R17,Y+$24		;$2E (XA0 = WR = RD = R/B = 1)
	OUT	PORTC,R17
	RCALL	Read_byte		;������ �� ��� ����� � R16
	RCALL	Hvpp_m3		;R16 � ���� C � Xtal1
	LDD	R17,Y+$25		;$3E (XA0 = BS1 = WR = RD = R/B = 1)
	RCALL	Hvpp_m2		;R16 � ���� C �� ��� � R16 � ���� C � Xtal1
	RCALL	Hvpp_m6		;������ ������� PAGEL
WR_F_HVPP7:	SBIW	R25:R24,1		;���������� ���� � �������� � ����������������
	BRPL	WR_F_HVPP6
	SBRS	R0,7
	RJMP	WR_F_HVPP9
	LDD	R17,Y+$21		;$1E (BS1 = WR = RD = R/B = 1)
	OUT	PORTC,R17
	MOV	R16,R10
	RCALL	Hvpp_m3		;R16 � ���� � � ������ Xtal1
	LDS	R16,Buffer_0A0+3	;�������������� ����� ������ ��� 7 
	SBRS	R16,7
	RJMP	WR_F_HVPP8
	LDD	R17,Y+$22		;$0F (WR = RD = R/B = BS2 = 1)
	OUT	PORTC,R17
	LDS	R16,Buffer_0A0+2	;������� ����� Flash ��� Eeprom ������
	RCALL	Hvpp_m3		;R16 � ���� � � ������ Xtal1
WR_F_HVPP8:	RCALL	Hvpp_m8		;������ �������� �� Flash ������
WR_F_HVPP9:	SUBI	R21,1		;���������� �������
	BRMI	WR_F_HVPP10
	MOVW	R25:R24,R23:R22	;���������� ���� � �������� � ����������������
	RCALL	RDY_Hvpp		;�������� RDY/BSY �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVPP7
	LDI	R16,$81
	MOV	R11,R16
	RJMP	WR_F_HVPP7
WR_F_HVPP10:MOV	R16,R0
	SBRS	R16,6
	RJMP	Leader4_11
	RCALL	RDY_Hvpp		;�������� RDY/BSY �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVPP11
	LDI	R16,$81
	MOV	R11,R16
WR_F_HVPP11:LDI	R16,$00
	RCALL	Hvpp_m0		;�������� ������� R16 (��������,������,������) � ��
Leader4_11:	RCALL	Leader_4		;�������� ��������� 4
	MOV	R16,R11
	RJMP	Usart_out		;��������� ���� �� R16 �� USART

;___________ ������ Flash ������ �� HVPP _______________________________________________

RD_F_HVPP:	LDS	R0,Buffer_0A0+3	;�������������� ����� ������ ��� 7 
	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	LDI	R16,$02
	RCALL	Hvpp_m0		;�������� ������� R16 (��������,������,������) � ��
	BST	R0,7		;�������� ��� �� ���� �
	BRTC	RD_F_HVPP1		;������� ���� ���� T �������
	LDD	R17,Y+$22		;$0F (WR = RD = R/B = BS2 = 1)
	OUT	PORTC,R17
	LDD	R18,Z+2
	OUT	PORTB,R18
	RCALL	Takt		;������ �������� ������ Xtal1
RD_F_HVPP1:	RCALL	Hvpp_m11
	RCALL	Takt		;������ �������� ������ Xtal1
	RCALL	Leader_1		;�������� ��������� 1
	RJMP	RD_F_HVPP3
RD_F_HVPP2:	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R17
	RCALL	Hvpp_m4
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	SBIW	R25:R24,1
	BRMI	RD_F_HVPP3
	LDD	R17,Y+$37		;$7B (XA1 = XA0 = BS1 = WR = R/B = BS2 = 1)
	RCALL	Hvpp_m5
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
RD_F_HVPP3:	SBIW	R25:R24,1
	BRPL	RD_F_HVPP2
	RJMP	Usart_00		;��������� $00 �� USART

;___________ ������ � EEPROM �� HVPP ___________________________________________________

WR_E_HVPP:	LDI	R21,$01		;R23 ���������� �������
	CLR	R11
	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	MOVW	R3:R2,R25:R24
	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	MOV	R0,R25
	MOV	R1,R24
	MOV	R16,R0
	ANDI	R16,$0E
	BREQ	WR_E_HVPP2
	RCALL	Shift		;���������� ���������� ������� � ���� � ��������
	RJMP	WR_E_HVPP2
WR_E_HVPP1:	SBRC	R0,7
	RCALL	Hvpp_m8		;������ �������� EEPROM
WR_E_HVPP2:	SUBI	R21,1		;���������� �������
	BRMI	WR_E_HVPP6
	RCALL	RDY_Hvpp		;�������� RDY/BSY �� ����������� Z = 0 ��� 1
	BRNE	WR_E_HVPP3
	LDI	R16,$81
	MOV	R11,R16
WR_E_HVPP3:	LDI	R16,$11		;������� ������ EEPROM ������
	RCALL	Hvpp_m0		;�������� ������� R16 (��������,������,������) � ��
	MOVW	R25:R24,R23:R22	;���������� ���� � ��������
	RJMP	WR_E_HVPP5
WR_E_HVPP4:	RCALL	Hvpp_m6		;������ ������� PAGEL
WR_E_HVPP5:	SBIW	R25:R24,1
	BRMI	WR_E_HVPP1
	RCALL	Hvpp_m12
	BST	R0,0		;�������� ��� �� ���� �
	BRTS	WR_E_HVPP4		;������� ���� ���� T ����������
	RCALL	Hvpp_m8		;������ �������� EEPROM
	RCALL	RDY_Hvpp		;�������� RDY/BSY �� ����������� Z = 0 ��� 1
	BRNE	WR_E_HVPP5
	LDI	R16,$81
	MOV	R11,R16
	RJMP	WR_E_HVPP5
WR_E_HVPP6:	BST	R0,6		;�������� ��� �� ���� �
	BRTC	WR_E_HVPP7		;������� ���� ���� T �������
	RCALL	RDY_Hvpp		;�������� RDY/BSY �� ����������� Z = 0 ��� 1
	BRNE	WR_E_HVPP7
	LDI	R16,$81
	MOV	R11,R16
WR_E_HVPP7:	RJMP	Leader4_11		;�������� ��������� 4 � R11 ��������� ����������

;___________ ������ EEPROM ������ �� HVPP ______________________________________________

RD_E_HVPP:	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	RCALL	Leader_1		;�������� ��������� 1
	LDI	R16,$03
	RCALL	Hvpp_m0		;�������� ������� R16 (��������,������,������) � ��
	RJMP	RD_E_HVPP2
RD_E_HVPP1:	RCALL	Hvpp_m11
	RCALL	Takt		;������ �������� ������ Xtal1
	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R17
	RCALL	Hvpp_m4
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
RD_E_HVPP2:	SBIW	R25:R24,1
	BRPL	RD_E_HVPP1
	RJMP	Usart_00		;��������� $00 �� USART

;___________ ��������� ������������ ��� HVPP ___________________________________________

Hvpp_m0:	LDD	R17,Y+$28		;$4E (XA1 = WR = RD = R/B = 1)
	OUT	PORTC,R17
	RJMP	Hvpp_m3		;R16 � ���� � � ������ Xtal1
Hvpp_m1:	RCALL	Hvpp_m0		;�������� ������� R16 (��������,������,������) � ��
	LDD	R17,Y+$24		;$2E (XA0 = WR = RD = R/B = 1)
Hvpp_m2:	OUT	PORTC,R17
	RCALL	Read_byte		;������ �� ��� ����� � R16
Hvpp_m3:	OUT	PORTB,R16
	RJMP	Takt		;������ �������� ������ Xtal1

Hvpp_m4:	RCALL	Addr_Inc		;����������������� �������� ������ FLASH ��� Eeprom ������
	RCALL	Takt		;������ �������� ������ Xtal1
	LDD	R17,Y+$34		;$6A (XA1 = XA0 = WR = R/B = 1)
Hvpp_m5:	OUT	PORTC,R17
	OUT	DDRB,R29		;���� � �� ����
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
	RCALL	Latency		;����� 1,628 ��� * (R16+1)
	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
Hvpp_m10:	OUT	PORTC,R17
	RET

Hvpp_m11:	LDS	R16,Buffer_0A0+1	;������� ����� Flash ��� Eeprom ������
	LDD	R17,Y+$21		;$1E (BS1 = WR = RD = R/B = 1)
	RJMP	Hvpp_m13

Hvpp_m12:	RCALL	Hvpp_m11
	RCALL	Takt		;������ �������� ������ Xtal1
	RCALL	Addr_Inc		;����������������� �������� ������ FLASH ��� Eeprom ������
	LDD	R17,Y+$20		;$0E (WR = RD = R/B = 1)
	OUT	PORTC,R17
	RCALL	Takt		;������ �������� ������ Xtal1
	RCALL	Read_byte		;������ �� ��� ����� � R16
	LDD	R17,Y+$24		;$2E (XA0 = WR = RD = R/B = 1)
Hvpp_m13:	OUT	PORTB,R16
	OUT	PORTC,R17

;___________ ������ ������� ��������� ������� __________________________________________

Takt:	LPM	R16,Z
	LPM	R16,Z
Takt_1:	SBI	PORTD,7		;C����� Xtpl1 = 0 
	SBIW	R27:R26,0
	SBIW	R27:R26,0
	CBI	PORTD,7		;C����� Xtpl1 = 1
	RET

;___________ �������� RDY/BSY �� ����������� Z = 0 ��� 1 HVPP __________________________

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
RDY_Hvpp2:	CLZ			;����� ����� Z
	RET
RDY_Hvpp3:	LDI	R16,$63
	RCALL	Latency		;����� 1,628 ��� * (R16+1)
	SBIW	R27:R26,1
	BRMI	RDY_Hvpp5
RDY_Hvpp4:	SBIS	PINC,1
	RJMP	RDY_Hvpp3
RDY_Hvpp5:	SBIC	PINC,1
	RJMP	RDY_Hvpp2
	SEZ			;��������� ����� Z
	RET

;___________ ���������� ������� � ���� � �������� ______________________________________

Shift:	MOV	R21,R0
	LDI	R22,1
	LDI	R23,$00
	LSR	R21
	ANDI	R21,$07
Shift_1:	LSL	R22		;$0001 � R23-R22 �������� ����� �� � R21
	ROL	R23		;R23-R22 ���������� ���� � �������� � ����������������
	LSR	R3
	ROR	R2
	DEC	R21
	BRNE	Shift_1
	MOV	R21,R2		;���������� �������
	RET

;___________ ������������� ������� �1 __________________________________________________

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
