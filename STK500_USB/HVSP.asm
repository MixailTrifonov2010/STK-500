
;___________ ���� ���������������� � ����� HVSP ________________________________________

Start_HVSP:	RCALL	Init_T1		;������������� ������� �1
	OUT	SPCR,R1		;��������� SPI ������
	OUT	TCCR2,R1		;��������� ������ �2
	CBI	PORTD,5		;�������� +5v
	SBI	PORTD,1		;��������� +12v 
	CBI	PORTD,7		;C����� Xtpl1 = 1 
	LDI	R19,$08	 
	RCALL	Read_N_byt		;������ �� ��� ������ ���� � R2-R9
	STS	Buffer_066,R5	;���������� �������� ��������� � ������ HVSP
	SBI	PORTD,0		;C����� Reset = 1 (�� ���� VT3)
	MOV	R24,R2
	RCALL	Delay		;����� ������������� 1 �� * (R24+1)
	LDI	R25,$00
	OUT	PORTB,R25
	LDI	R24,$07
	OUT	DDRB,R24
	TST	R6
	BRNE	St_HVSP1
	MOV	R18,R4
	RCALL	Takt_Hvsp1		;������ N = R18 �������� ���������
	MOV	R24,R3
	RCALL	Delay		;����� ������������� 1 �� * (R24+1)
	MOV	R18,R7
	RCALL	Takt_Hvsp1		;������ N = R18 �������� ���������
St_HVSP1:	CBI	PORTD,0		;C����� Reset = 0 (�� ���� VT3)
	MOV	R1,R4
	RCALL	Latency		;����� 1 ��� * R1
	CBI	PORTD,1		;�������� +12v 
	MOV	R24,R2
	RCALL	Delay		;����� ������������� 1 �� * (R24+1)
	CBI	DDRB,2
	SBI	PORTB,2		;������ SDO
	RJMP	Answer_3		;����� �� �� ������� - ������� ���������

;___________ ��������� ������� �� �� �� HVSP ��������� _________________________________ 

HVSP_close:	CBI	PORTD,0		;C����� Reset = 1 (�� ���� VT3)
	SBI	PORTD,1		;��������� +12v 
	LDI	R19,$02	 
	RCALL	Read_N_byt		;������ �� ��� � R2-R3
	OUT	TCCR1A,R1	
	OUT	TCCR1B,R1		;��������� ������ �1
	MOV	R1,R2
	RCALL	Latency		;����� 1 ��� * R1
	OUT	PORTB,R1
	SBI	PORTD,5		;��������� +5v
	MOV	R24,R3
	RCALL	Delay		;����� ������������� 1 �� * (R24+1)
	SBI	PORTD,0		;C����� Reset = 1 (�� ���� VT3)
	OUT	DDRB,R1		;���� � �� ����
	RJMP	Answer_3		;����� �� �� ������� - ������� ���������

;___________ �������� ��������� �� HVSP ________________________________________________

Erase_HVSP:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	LDD	R25,Y+0		;$4C - ������� 
	LDD	R24,Y+20		;$80 - ������
	RCALL	Hvsp_m8
	RCALL	Hvsp_m0
	LD	R25,Z+
	TST	R25
	BREQ	Er_HVSP2
	LD	R24,Z+
	RCALL	Delay		;����� ������������� 1 �� * (R24+1)
	RCALL	Hvsp_m6
Er_HVSP1:	LDI	R28,$02
	LDI	R29,$00
	RJMP	Answer_3		;����� �� �� ������� - ������� ���������
Er_HVSP2:	RCALL	Hvsp_m6
	LD	R24,Z+
	RCALL	RDY_Hvsp2		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	Er_HVSP1
	RJMP	Answer		;����� �� �� ������� - ������� �� ���������

;___________ ������ ��������� � ������ HVSP ____________________________________________

Sign_HVSP:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	LDD	R25,Y+0		;$4C - �������
	LDD	R24,Y+25		;$08 - ������
	RCALL	Hvsp_m2
	LDD	R25,Y+10		;$68 - �������
	RJMP	Prot_SPr_1		;����� �� �� ������� - ������� ���������

;___________ ������ ���������������� ����� � ������ HVSP _______________________________

Conf_SPr:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	LDD	R25,Y+0		;$4C - ������� 
	LDD	R24,Y+26		;$04 - ������
	RCALL	Hvsp_m8
	LD	R26,Z+
	LDI	R27,$00
	ADIW	R27:R26,$0B
	ADD	R26,R28
	ADC	R27,R29		;R27-R26 + $0400
	LD	R25,X
	RJMP	Prot_SPr_1		;����� �� �� ������� - ������� ���������

;___________ ������ ����� ������ � ������ HVSP _________________________________________

Prot_SPr:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	LDD	R25,Y+0		;$4C - �������
	LDD	R24,Y+30		;$04 - ������
	RCALL	Hvsp_m8
	LDD	R25,Y+16		;$78 - �������
Prot_SPr_1:	RCALL	Hvsp_m14
	LDI	R28,$03
	LDI	R29,$00
	STS	Spool_Out+1,R24
	RJMP	Answer_3		;����� �� �� ������� - ������� ���������

;___________ ������ ������������� ������ � ������ HVSP _________________________________

Calibr_SP:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	LDD	R25,Y+0		;$4C - �������
	LDD	R24,Y+29		;$08 - ������
	RCALL	Hvsp_m2
	LDD	R25,Y+15		;$78 - �������
	RJMP	Prot_SPr_1		;����� �� �� ������� - ������� ���������

;___________ ������ EEPROM ������ ______________________________________________________

RD_E_HVSP:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	LD	R27,Z+
	LD	R26,Z+
	MOVW	R3:R2,R27:R26
	LDI	R30,LOW(Spool_Out+1)
	LDI	R31,HIGH(Spool_Out+1)	;������ ���� ������ ������������� �� ������� ��
	LDI	R23,$00
	LDD	R25,Y+0		;$4C - �������
	LDD	R24,Y+28		;$03 - ������
	RCALL	Hvsp_m8
	RJMP	RD_E_HVSP3
RD_E_HVSP1:	RCALL	Addr_Inc1
	LDD	R25,Y+1		;$0C - ������� 
	RCALL	Hvsp_m8
	TST	R23
	BRNE	RD_E_HVSP2
	LDS	R24,Cur_addr1	;������� ����� Flash ��� Eeprom ������ ��. ����
	LDD	R25,Y+2		;$1C - �������
	RCALL	Hvsp_m8
	LDI	R23,1
RD_E_HVSP2:	LDD	R25,Y+14		;$68 - ������� 
	RCALL	Hvsp_m14
	ST	Z+,R24
RD_E_HVSP3:	SBIW	R27:R26,1
	BRPL	RD_E_HVSP1
	RJMP	RD_F_HVSP4		;����� �� �� ������� - ������� ���������

;___________ ������ Flash ������ _______________________________________________________

RD_F_HVSP:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	LD	R27,Z+
	LD	R26,Z+
	MOVW	R3:R2,R27:R26
	LDI	R30,LOW(Spool_Out+1)
	LDI	R31,HIGH(Spool_Out+1)	;������ ���� ������ ������������� �� ������� ��
	LDI	R23,$00
	LDD	R25,Y+0		;$4C - �������
	LDD	R24,Y+27		;$02 - ������
	RCALL	Hvsp_m8
	RJMP	RD_F_HVSP3
RD_F_HVSP1:	LDS	R1,Buffer_066	;���������� �������� ��������� � ������ HVSP
	DEC	R1
	MOV	R0,R1
	LSL	R1
	LSL	R1
	ADD	R1,R0
	RCALL	Latency		;����� 1 ��� * R1
	LDD	R25,Y+1		;$0C - �������
	LDS	R24,Cur_addr0	;������� ����� Flash ��� Eeprom ������ ��. ����
	RCALL	Hvsp_m8
	TST	R23
	BRNE	RD_F_HVSP2
	LDD	R25,Y+2		;$1C - �������
 	LDS	R24,Cur_addr1	;������� ����� Flash ��� Eeprom ������ ��. ����
	RCALL	Hvsp_m8
	LDI	R23,1
RD_F_HVSP2:	LDD	R25,Y+8		;$68 - ������� 
	RCALL	Hvsp_m14
	ST	Z+,R24
	LDD	R25,Y+9		;$78 - ������� 
	RCALL	Hvsp_m14
	ST	Z+,R24
	RCALL	Addr_Inc1		;����������������� �������� ������ FLASH ��� Eeprom ������
RD_F_HVSP3:	SBIW	R27:R26,2
	BRPL	RD_F_HVSP1
RD_F_HVSP4:	MOVW	R29:R28,R3:R2
	ADIW	R29:R28,3
	RJMP	Answer_3		;����� �� �� ������� - ������� ���������

;___________ ������ ���������������� ����� � ������ HVSP _______________________________

Conf_SPw:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	LDI	R23,5
	LD	R22,Z+		;������ �� ��� ����� � R22
	TST	R22
	BREQ	Conf_SPw1
	LDI	R23,6
	CPI	R22,1
	BREQ	Conf_SPw1
	LDI	R23,7
Conf_SPw1:	LDD	R25,Y+0		;$4C - ������� 
	LDD	R24,Y+21		;$40 - ������
	RCALL	Hvsp_m4
	MOV	R24,R23
	RCALL	Hvsp_m1
	LD	R24,Z+		;������ �� ��� ����� � R24
	RCALL	RDY_Hvsp2		;�������� ���������� �� ����������� Z = 0 ��� 1
	LDI	R28,$02
	LDI	R29,$00
	BRNE	Conf_SPw2
	RJMP	Answer		;����� �� �� ������� - ������� �� ���������
Conf_SPw2:	RJMP	Answer_3		;����� �� �� ������� - ������� ���������

;___________ ������ ����� ������ � ������ HVSP _________________________________________

Prot_SPw:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	LD	R23,Z+		;������ �� ��� ����� � R23
	LDD	R25,Y+0		;$4C - ������� 
	LDD	R24,Y+22		;$20 - ������
	RCALL	Hvsp_m4
	RCALL	Hvsp_m0
	LD	R24,Z+		;������ �� ��� ����� � R24
	RCALL	RDY_Hvsp2		;�������� ���������� �� ����������� Z = 0 ��� 1
	LDI	R28,$02
	LDI	R29,$00
	BRNE	Prot_SPw1
	RJMP	Answer		;����� �� �� ������� - ������� �� ���������
Prot_SPw1:	RJMP	Answer_3		;����� �� �� ������� - ������� ���������

;___________ ������ EEPROM ������ � ������ HVSP ________________________________________

WR_E_HVSP:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	CLR	R20
	LDI	R21,1		;���������� �������
	LD	R3,Z+
	LD	R2,Z+
	LD	R4,Z+
	LD	R5,Z+
	MOV	R24,R4
	ANDI	R24,$0E
	BREQ	WR_E_HVSP2
	RCALL	Shift		;���������� ���������� ������� � ���� � ��������
	RJMP	WR_E_HVSP2
WR_E_HVSP1:	BST	R4,7		;�������� ��� �� ���� �
	BRTC	WR_E_HVSP2		;������� ���� ���� T �������
	LDI	R24,5
	RCALL	Hvsp_m5
WR_E_HVSP2:	SUBI	R21,1		;���������� �������
	BRMI	WR_E_HVSP6
	RCALL	RDY_Hvsp1		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_E_HVSP3
	LDI	R20,$81
WR_E_HVSP3:	LDD	R25,Y+0		;$4C - ������� 
	LDD	R24,Y+24		;$11 - ������
	RCALL	Hvsp_m8
	MOVW	R27:R26,R23:R22
	RJMP	WR_E_HVSP5
WR_E_HVSP4:	LDI	R24,$12
	RCALL	Hvsp_m5
WR_E_HVSP5:	SBIW	R27:R26,1
	BRMI	WR_E_HVSP1
	LDD	R25,Y+1		;$0C - ������� 
	LDS	R24,Cur_addr1	;������� ����� Flash ��� Eeprom ������ ��. ����
	RCALL	Hvsp_m8
	RCALL	Hvsp_m3
	BST	R4,0		;�������� ��� �� ���� �
	BRTS	WR_E_HVSP4		;������� ���� ���� T ����������
	LDI	R24,5
	RCALL	Hvsp_m5
	RCALL	RDY_Hvsp1		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_E_HVSP5
	LDI	R20,$81
	RJMP	WR_E_HVSP5
WR_E_HVSP6:	BST	R4,6		;�������� ��� �� ���� �
	BRTC	WR_E_HVSP7		;������� ���� ���� T �������
	RCALL	RDY_Hvsp1		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_E_HVSP7
	LDI	R20,$81
WR_E_HVSP7:	MOV	R24,R20
	LDI	R28,$02
	LDI	R29,$00
	RJMP	Answer_2		;����� �� �� ������� - ������� ���������

;___________ ������ Flash ������ � ������ HVSP _________________________________________

WR_F_HVSP:	RCALL	Addr_HVPP		;����� ������ ��������������� ����������������	� ������� ����� ������ �� �� 
	CLR	R20
	LDI	R21,1		;���������� �������
	LD	R3,Z+
	LD	R2,Z+
	LD	R4,Z+
	LD	R5,Z+
	LDS	R8,Cur_addr1	;������� ����� Flash ��� Eeprom ������ ��. ����
	MOVW	R23:R22,R3:R2
	MOVW	R27:R26,R3:R2
	LDD	R25,Y+0		;$4C - ������� 
	LDD	R24,Y+23		;$10 - ������
	RCALL	Hvsp_m8
	LSR	R23
	ROR	R22
	MOV	R24,R4
	SBRS	R24,0
	RJMP	WR_F_HVSP5
	ANDI	R24,$0E
	BRNE	WR_F_HVSP1
	RJMP	WR_F_HVSP8
WR_F_HVSP1:	RCALL	Shift		;���������� ���������� ������� � ���� � ��������
	LSR	R23
	ROR	R22	            ;���������� ���� � �������� � ����������������
	RJMP	WR_F_HVSP8
	;�������� �� Flash ������
WR_F_HVSP2:	LD	R24,Z+
	LDD	R25,Y+4		;$3C - �������
	RCALL	Hvsp_m8
	LDI	R24,6
	RCALL	RDY_Hvsp		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVSP4
WR_F_HVSP3:	LDI	R20,$81
WR_F_HVSP4:	SBIW	R27:R26,2
	BREQ	WR_E_HVSP6		;����� �� �� ������� - ������� ���������
WR_F_HVSP5:	LDD	R25,Y+2		;$1C - �������
 	LDS	R24,Cur_addr1	;������� ����� Flash ��� Eeprom ������ ��. ����
	RCALL	Hvsp_m8
	RCALL	Hvsp_m3
	LDI	R24,5
	RCALL	RDY_Hvsp		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVSP2
	RJMP	WR_F_HVSP3
	;�������� � ����� ��������
WR_F_HVSP6:	RCALL	Hvsp_m3
	LD	R24,Z+
	LDD	R25,Y+4		;$3C - �������
	RCALL	Hvsp_m8
	LDI	R24,$11
	RCALL	Hvsp_m5
WR_F_HVSP7:	SBIW	R27:R26,1
	BRPL	WR_F_HVSP6
	SBRS	R4,7
	RJMP	WR_F_HVSP8
	LDD	R25,Y+2		;$1C - ������� 
	MOV	R24,R8		;������� ���� ������ Flash ������
	RCALL	Hvsp_m8
	LDI	R24,5
	RCALL	Hvsp_m5
WR_F_HVSP8:	SUBI	R21,1
	BRMI	WR_F_HVSP9		;����� �� �� ������� - ������� ���������
	MOVW	R27:R26,R23:R22
	RCALL	RDY_Hvsp1		;�������� ���������� �� ����������� Z = 0 ��� 1
	BRNE	WR_F_HVSP7
	LDI	R20,$81
	RJMP	WR_F_HVSP7
WR_F_HVSP9:	RJMP	WR_E_HVSP6		;����� �� �� ������� - ������� ���������

;___________ ��������� ������������ ��� HVSP ___________________________________________

Hvsp_m0:	LDI	R24,$05
Hvsp_m1:	RCALL	Hvsp_m5
Hvsp_m2:	RCALL	Hvsp_m8
	LD	R24,Z+		;������ �� ��� ����� � R24
	LDD	R25,Y+1		;$0C - �������
	RJMP	Hvsp_m8

Hvsp_m3:	RCALL	Addr_Inc1
	LDD	R25,Y+1		;$0C - �������
Hvsp_m4:	RCALL	Hvsp_m8
	LD	R24,Z+		;������ �� ��� ����� � R24
	LDD	R25,Y+3		;$2C - �������
	RJMP	Hvsp_m8

Hvsp_m5:	MOV	R0,R24
	MOVW	R7:R6,R27:R26
	MOVW	R27:R26,R29:R28
	ADD	R26,R24
	ADC	R27,R1
	LD	R25,X
	RCALL	Hvsp_m7
	MOVW	R27:R26,R29:R28
	ADD	R26,R0
	ADC	R27,R1
	LD	R24,X
	LDD	R25,Y+19		;$0C - �������
	OR	R25,R24
	MOVW	R27:R26,R7:R6
	RJMP	Hvsp_m7

;___________ ������ ������� � R25 � ������ � R24 _______________________________________

Hvsp_m6:	LDD	R25,Y+0		;$4C - �������
Hvsp_m7:	LDI	R24,$00		;$00 - ������
Hvsp_m8:	OUT	PORTB,R1
	LDI	R19,$08		;������� ������� 
	RCALL	Takt_Hvsp		;������ N �������� ���������
Hvsp_m9:	BST	R25,7		;�������� ��� �� ���� �
	BRTC	Hvsp_m10		;������� ���� ���� T �������
	SBI	PORTB,1		;���������� ������ SII = 1
	RJMP	Hvsp_m11
Hvsp_m10:	CBI	PORTB,1		;���������� ������ SII = 0
Hvsp_m11:	BST	R24,7		;�������� ��� �� ���� �
	BRTC	Hvsp_m12		;������� ���� ���� T �������
	SBI	PORTB,0		;���������� ������ SDI = 1
	RJMP	Hvsp_m13
Hvsp_m12:	CBI	PORTB,0		;���������� ������ SDI = 0
Hvsp_m13:	LSL	R24
	LSL	R25
	RCALL	Takt_Hvsp		;������ N R18 �������� ���������
	DEC	R19		;������� ������� 
	BRNE	Hvsp_m9
	OUT	PORTB,R1
	RCALL	Takt_Hvsp		;������ N �������� ���������
	RJMP	Takt_Hvsp		;������ N �������� ���������

;___________ ������ ������� � R25 � ������� ������ � R24 _______________________________

Hvsp_m14:	MOV	R17,R25
	RCALL	Hvsp_m7
	LDD	R25,Y+19		;$0C - �������
	OR	R25,R17
	LDI	R19,$08		;������� ������� 
	CLR	R24
	SBIC	PINB,2
	INC	R24
	RCALL	Takt_Hvsp		;������ N �������� ���������
Hvsp_m15:	BST	R25,7		;�������� ��� �� ���� �
	BRTC	Hvsp_m16		;������� ���� ���� T �������
	SBI	PORTB,1		;���������� ������ SII = 1
	RJMP	Hvsp_m17
Hvsp_m16:	CBI	PORTB,1		;���������� ������ SII = O
Hvsp_m17:	LSL	R24
	SBIC	PINB,2
	INC	R24
	LSL	R25
	RCALL	Takt_Hvsp		;������ N �������� ���������
	DEC	R19		;������� ������� 
	BRNE	Hvsp_m15
	OUT	PORTB,R1
	RCALL	Takt_Hvsp		;������ N �������� ���������
	RCALL	Takt_Hvsp		;������ N �������� ���������
	RET

;___________ �������� ���������� �� ����������� Z = 0 ��� 1 HVSP _______________________

RDY_Hvsp:	RCALL	Hvsp_m5
RDY_Hvsp1:	MOV	R24,R5
RDY_Hvsp2:	LDI	R18,$0A
	CLI			;��������� ���������� ����������
	MUL	R18,R24		;�������� R18*R24=R24
	MOV	R18,R0
	CLR	R1
	SEI			;��������� ���������� ����������
	TST	R24
	BRNE	RDY_Hvsp5
RDY_Hvsp3:	CLZ			;����� ����� Z
	RET
		
RDY_Hvsp4:	LDI	R24,$64
	MOV	R1,R24
	RCALL	Latency		;����� 1 ��� * R1
	SUBI	R18,1
	BRMI	RDY_Hvsp6
RDY_Hvsp5:	SBIS	PINB,2
	RJMP	RDY_Hvsp4
RDY_Hvsp6:	SBIC	PINB,2
	RJMP	RDY_Hvsp3
	SEZ			;��������� ����� Z
	RET

;___________ ������ N = R18 �������� ��������� _________________________________________

Takt_Hvsp:	LDS	R18,Buffer_066	;���������� �������� ��������� � ������ HVSP
Takt_Hvsp1:	RCALL	Takt_1		;������ �������� ������ Xtal1
	SUBI	R18,1
	BRNE	Takt_Hvsp1
	RET
;_______________________________________________________________________________________

.INCLUDE "Memory.asm"

