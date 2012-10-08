
;___________ ������� �������� ��������� ________________________________________________

Table:	RJMP	Name_out		;����� �� - STK500-2
	RJMP	Rate_WR		;��������� �������� ������� �2 � SPI
	RJMP	Rate_RD		;������ �������� ����������������
	RJMP	Answer		;������� �� ��������������
	RJMP	Answer		;�������� �� ������� �� � ������ LVSP
	RJMP	Burn_4		;��������� ������� ����� 4 �����
	RJMP	Answer		;������� �� ��������������
	RJMP	Answer		;������� �� ��������������
	RJMP	Answer		;������� �� ��������������
	RJMP	Answer		;������� �� ��������������

	RJMP	Answer		;������� �� ��������������
	RJMP	Answer		;������� �� ��������������
	RJMP	Answer		;������� �� ��������������
	RJMP	Answer		;������� �� ��������������
	RJMP	Answer		;������� �� ��������������
	RJMP	Start_spi		;���� � ����� LVSP
	RJMP	Spi_close		;��������� ������� �� ��  � ������ LVSP ��������� 
	RJMP	Chip_erase		;�������� ��������� � ������ LVSP
	RJMP	WR_spi_Fla		;������ �� Flash ������ � ������ LVSP
	RJMP	RD_F_LVSP		;������ Flash ������ � ������ LVSP

	RJMP	WR_spi_Eep		;������ � EEPROM � ������ LVSP
	RJMP	RD_E_LVSP		;������ EEPROM ������ � ������ LVSP
	RJMP	F_defense		;������ ���������������� ����� � ������ LVSP
	RJMP	Sign_LVSP		;������ ���������������� ����� � ������ LVSP
	RJMP	F_defense		;������ ����� ������ � ������ LVSP
	RJMP	Sign_LVSP		;������ ����� ������ � ������ LVSP
	RJMP	Sign_LVSP		;������ ��������� ���������������� � ������ LVSP
	RJMP	Sign_LVSP		;������ ������������� ������ � ������ LVSP
	RJMP	In_Out_Port		;���������� ������� A,B,C, �������� Reset � +5v
	RJMP	Answer		;������� �� ��������������

	RJMP	Answer		;������� �� ��������������
	RJMP	Start_HVPP		;���� ���������������� � ������ HVPP
	RJMP	HVPP_close		;��������� ������� �� �� � ������ HVPP ��������� 
	RJMP	Erase_HVPP		;�������� ��������� � ������ HVPP
	RJMP	WR_F_HVPP		;������ �� Flash ������ � ������ HVPP
	RJMP	RD_F_HVPP		;������ Flash ������ � ������ HVPP
	RJMP	WR_E_HVPP		;������ � EEPROM � ������ HVPSP
	RJMP	RD_E_HVPP		;������ EEPROM ������ � ������ HVPP
	RJMP	Conf_PPw		;������ ���������������� ����� � ������ HVPP
	RJMP	Conf_PPr		;������ ���������������� ����� � ������ HVPP

	RJMP	Prot_PPw		;������ ����� ������ �� HVPP
	RJMP	Prot_PPr		;������ ����� ������ �� HVPP
	RJMP	Sign_HVPP		;������ ��������� ���������������� � ������ HVPP
	RJMP	Calibr_PP		;������ ������������� ������ � ������ HVPP
	RJMP	Copy_32		;���������� ���� ������ ��������������� ���������������� 32 �����
	RJMP	Answer		;������� �� ��������������
	RJMP	Answer		;������� �� ��������������
	RJMP	Start_HVSP		;���� ���������������� � ������ HVSP
	RJMP	HVSP_close		;��������� ������� �� �� � ������ HVSP ��������� 
	RJMP	Erase_HVSP		;�������� ��������� � ������ HVSP

	RJMP	WR_F_HVSP		;������ Flash ������ � ������ HVSP
	RJMP	RD_F_HVSP		;������ Flash ������ � ������ HVSP
	RJMP	WR_E_HVSP		;������ EEPROM ������ � ������ HVSP
	RJMP	RD_E_HVSP		;������ EEPROM ������ � ������ HVSP
	RJMP	Conf_SPw		;������ ���������������� ����� � ������ HVSP
	RJMP	Conf_SPr		;������ ���������������� ����� � ������ HVSP
	RJMP	Prot_SPw		;������ ����� ������ � ������ HVSP
	RJMP	Prot_SPr		;������ ����� ������ � ������ HVSP
	RJMP	Sign_HVSP		;������ ��������� � ������ HVSP
	RJMP	Calibr_SP		;������ ������������� ������ � ������ HVSP

;___________ ����� �� - STK500-2 _______________________________________________________

Name_out:	LDI	R24,LOW(Spool_Out+1)
	LDI	R25,HIGH(Spool_Out+1)	;������ ���� ������ ������������� �� ������� ��
	MOVW	R27:R26,R25:R24
	LDI	R30,LOW(Data_6*2)
	LDI	R31,HIGH(Data_6*2)	;STK500_2
Name_out_1:	LPM	R0,Z+
	ST	X+,R0
	TST	R0
	BRNE	Name_out_1
	LDI	R28,$0B
	RJMP	Answer_3		;����� �� �� �������

;____________ ��������� �������� ������� �2 � SPI ______________________________________

Rate_WR:	LDS	R30,Spool_Inp	;����� ������� ��������� ����� ��������� �� ��
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
	RJMP	Answer_3		;����� �� �� �������

;___________ ������ �������� ���������������� �� SPI ___________________________________
	; ��������� ��� ��������������, ����� 74HC597,�������� ������� �2
	; �������� �� SPI ���������,��������� ����� �

Rate_RD:	LDS	R30,Spool_Inp	;����� ������� ��������� ����� ��������� �� ��
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
	RJMP	Answer_3		;����� �� �� �������

;___________ ���������� ������� A,B,C, �������� Reset � +5v ____________________________

In_Out_Port:LDI	R19,$07
	RCALL	Read_N_byt		;������ �� ��� ���� ���� � R2-R8
	IN	R9,PINA
	OUT	DDRA,R2		;�������� ����� ����� �
	OUT	PORTA,R3		;������ �������� ���� � ���� � (���/���� ��������)
	IN	R2,PINB
	OUT	DDRB,R4		;�������� ����� ����� B
	OUT	PORTB,R5		;������ �������� ���� � ���� B (���/���� ��������)
	IN	R3,PINC
	OUT	DDRC,R6		;�������� ����� ����� C
	OUT	PORTC,R7		;������ �������� ���� � ���� C (���/���� ��������)
	MOV	R25,R8
	ANDI	R25,$21
	IN	R24,PORTD
	ANDI	R24,$DE
	OR	R24,R25
	OUT	PORTD,R24		;���/���� +5v (PIND5 0-���, 1-����. PIND2=0 �� Reset=1, PIND2=1 �� Reset=0)
	LDI	R30,LOW(Spool_Out+1)
	LDI	R31,HIGH(Spool_Out+1)	;������ ���� ������ ������������� �� ������� ��
	ST	Z+,R9
	ST	Z+,R2
	ST	Z+,R3
	IN	R24,PIND
	ST	Z+,R24
	LDI	R28,$07
	RJMP	Answer_3		;����� �� �� �������

;____________ ��������� ������� ����� 4 ����� __________________________________________

Burn_4:	LDS	R24,Spool_Inp
	STS	Cur_addr3,R24	;��������� �� ������� ��������������� ����� ������ (��� 7) 
	LDS	R24,Spool_Inp+1
	STS	Cur_addr2,R24	;������� ����� Flash ��� Eeprom ������ ���. ����
	LDS	R24,Spool_Inp+2
	STS	Cur_addr1,R24	;������� ����� Flash ��� Eeprom ������ ��. ����
	LDS	R24,Spool_Inp+3
	STS	Cur_addr0,R24	;������� ����� Flash ��� Eeprom ������ ��. ����
	RJMP	Answer_3		;����� �� �� �������

;____________ ���� � ����� LVSP ________________________________________________________

Start_spi:	RCALL	Init_T2		;������������� ������� �2 � SPI ����������
	SBI	PORTD,1		;��������� +12v 
	LDI	R19,$07
	RCALL	Read_N_byt		;������ �� ��� ���� ���� � R2-R8
Start_spi1:	CBI	PORTD,5		;�������� +5v
	MOV	R24,R3
	RCALL	Delay		;����� ������������� 1 �� * (R24+1)
	LDI	R25,$B0
	OUT	DDRB,R25
	OUT	PORTB,R1	
	CBI	PORTD,0		;C����� Reset = 0 (�� ���� VT3)
	MOV	R24,R3
	RCALL	Delay		;����� ������������� 1 �� * (R24+1)
	SBI	PORTD,0		;C����� Reset = 1 (�� ���� VT3)
	MOV	R24,R3
	RCALL	Delay		;����� ������������� 1 �� * (R24+1)
	DEC	R5
	BREQ	Start_spi5
	LDS	R24,Spool_Inp+7
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	LDS	R24,Spool_Inp+8
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	LDS	R24,Spool_Inp+9
	RCALL	Spi_In_Out		;��������/������� ���� �� SPI ����������
	MOV	R6,R24
	LDS	R24,Spool_Inp+10
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
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
Start_spi4:	RJMP	Answer_3		;����� �� �� ������� - ���������� �� SPI �������
Start_spi5:	SBI	PORTD,0		;C����� Reset = 1 (�� ���� VT3)
	CLR	R24
	OUT	PORTB,R24
	OUT	DDRB,R24
	OUT	TCCR2,R24		;��������� ������ �2
	OUT	SPCR,R24		;��������� ��������� SPI ���������
	OUT	TCCR1A,R24	
	OUT	TCCR1B,R24		;��������� ������ �1
	SBI	PORTD,5		;��������� +5v
	RJMP	Answer		;����� �� �� ������� - ���������� �� ��������

;___________ ��������� ������� �� �� ��������� _________________________________________

Spi_close:	SBI	PORTD,0		;C����� Reset = 1 (�� ���� VT3)
	CLR	R24
	OUT	PORTB,R24
	OUT	DDRB,R24
	OUT	TCCR2,R24		;��������� ������ �2
	OUT	SPCR,R24		;��������� ��������� SPI ���������
	OUT	TCCR1A,R24	
	OUT	TCCR1B,R24		;��������� ������ �1
	SBI	PORTD,5		;��������� +5v
	RJMP	Answer_3		;����� �� �� �������

;___________ �������� ��������� ________________________________________________________

Chip_erase:	LDI	R19,$02
	RCALL	Read_N_byt		;������ �� ��� � R2-R3
	MOV	R24,R3
	RCALL	Delay		;����� ������������� 1 �� * (R24+1)
Ch_erase2:	RCALL	Ram_Spi_4		;������ ����� �� ��� �������� �� SPI
	TST	R24
	BREQ	Ch_erase3
	MOV	R24,R2
	RCALL	RDY_Lvsp		;������ ����� ���������� ��������������� �����������
	BREQ	Ch_erase3
	LDI	R24,$80
	RJMP	Answer_1		;����� �� �� ������� - ������� �� ���������
Ch_erase3:	RJMP	Answer_3		;����� �� �� ������� - ������� ���������

;___________ ������ ������ � ����� ������ ______________________________________________

F_defense:	LDI	R30,LOW(Spool_Inp)
	LDI	R31,HIGH(Spool_Inp)	;������ ���� ������ �� ��
	RCALL	Ram_Spi_4		;������ ����� �� ��� �������� �� SPI
	LDI	R28,$03
	CLR	R29
	RJMP	Answer_3		;����� �� �� ������� - ������� ���������

;___________ ������ ��������� ���������������� �� SPI __________________________________
	; ����� ������, �������������� � ���������������� ����� � ������������
	; ������ ����������

Sign_LVSP:	LDI	R30,LOW(Spool_Inp)
	LDI	R31,HIGH(Spool_Inp)	;������ ���� ������ �� ��
	LD	R23,Z+
	RCALL	Ram_Spi_3		;��� ����� �� ��� �������� �� SPI
	MOV	R9,R24
	RCALL	Spi_Out_00		;������� ���� �� SPI ����������
	CPI	R23,3
	BRNE	Sign_LVSP2
	MOV	R24,R9
Sign_LVSP2:	LDI	R28,$04
	CLR	R29
	STS	Spool_Out+1,R24
	STS	Spool_Out+2,R29
	RJMP	Answer_3		;����� �� �� ������� - ������� ���������

;___________ ������ Flash ��� EEPROM ������ �� SPI _____________________________________

RD_F_LVSP:	CLR	R3		;������ - Flash
	COM	R3
	RJMP	M_spi_rw
RD_E_LVSP:	CLR	R3		;������ - EEPROM
M_spi_rw:	CLR	R19
	LDS	R27,Spool_Inp
	LDS	R26,Spool_Inp+1	;R27-R26 - ���������� �������� ����
	LDS	R2,Spool_Inp+2	;��� �������� ������ Flash ��� EEPROM ������
	MOVW	R29:R28,R27:R26
	ADIW	R29:R28,3
	LDI	R30,LOW(Spool_Out+1)
	LDI	R31,HIGH(Spool_Out+1)	;������ ���� ������ ������������� �� ������� ��
	LDS	R4,Cur_addr3	;��������� �� ������� ��������������� ����� ������ (��� 7) 
	SBRC	R4,7
	RCALL	Spare_addr		;�������� ��������������� ����� ������
	RJMP	M_spi_rw_3
M_spi_rw_1:	RCALL	LVSP_m0		;�������� �������,������ � ���� ����� ������ �� SP
	ST	Z+,R24
	TST	R3
	BREQ	M_spi_rw_2		;���� $00 EEPROM ����� ������ Flash
	MOV	R24,R2
	ORI	R24,8
	RCALL	LVSP_m1		;�������� �������,������ � ���� ����� ������ �� SP
	ST	Z+,R24
	SBIW	R27:R26,1
M_spi_rw_2:	RCALL	Addr_Inc1		;����������������� �������� ������ FLASH ��� Eeprom ������
	SBRS	R4,7		;�������������� ���� ������ ��� 7 
	RJMP	M_spi_rw_3
	TST	R22
	BRNE	M_spi_rw_3
	LDS	R25,Cur_addr0	;������� ����� Flash ��� Eeprom ������ ��. ����
	TST	R25
	BRNE	M_spi_rw_3
	RCALL	Spare_addr		;�������� ��������������� ����� ������
M_spi_rw_3:	SBIW	R27:R26,1
	BRPL	M_spi_rw_1
	ST	Z,R1
	RJMP	Answer_3		;����� �� �� ������� - ������� ���������

;___________ ������ � EEPROM ��� Flash �� SPI __________________________________________

WR_spi_Fla:	LDI	R21,$55		;������������� Flash
	RJMP	Prog_wr
WR_spi_Eep:	LDI	R21,$AA		;������������� EEPROM
Prog_wr:	LDI	R19,$09
	RCALL	Read_N_byt		;������ �� ��� ������ ���� � R2-R10
	LDS	R22,Cur_addr0	;������� ����� Flash ��� Eeprom ������ ��. ����
	LDS	R23,Cur_addr1	;������� ����� Flash ��� Eeprom ������ ��. ����
	LDI	R20,$08
	MOV	R9,R20		;��� ������ ������� - ������� ���� ������
	CLR	R20
            CLR         R26
	CLR	R27
	LDS	R24,Cur_addr3	;��������� �� ������� ��������������� ����� ������ (��� 7) 
	SBRC	R24,7
	RCALL	Spare_addr		;�������� ��������������� ����� ������ ��� ATmega256
	SBRS	R4,0		;���� ������ - 0 = ������ �������, 1 = ��������� 
	RJMP	Prog_comp		;����� ���������� ������ �� Flash ��� Eeprom
	; ����� ���������� ������ �� Flash ��� Eeprom
	RJMP	Prog_page4
Prog_page:	MOV	R24,R6		;R6 - ������� ������ � �������� Flash $40 ��� Eeprom $C1
	LD	R19,Z+		;������ �� ��� ����� � R19
	RCALL	LVSP_m1		;�������� �������,������ � ����� ������ �� SPI
	CPI	R21,$55		;������������� FLASH ?
	BRNE	Prog_page1
	EOR	R6,R9		;����������� ��. ��� ��. ���� ������
Prog_page1:	SBRC	R26,0
	RJMP	Prog_page2
	CPI	R21,$AA		;������������� EEPROM ?
	BRNE	Prog_page3
Prog_page2:	RCALL	Addr_Inc1		;����������������� �������� ������ ������	
Prog_page3:	ADIW	R27:R26,1
Prog_page4:	CP	R26,R3
	CPC	R27,R2		;� R27-R26 ���������� ������������ ���� � ��
	BRCS	Prog_page
	; ������ ������� ������ �������� �� Flash ��� Eeprom
	SBRS	R4,7		;���� ������ - ������ ���������� ?
	RJMP	Prog_out
	MOV	R24,R7		;R7 - ������� ������ �������� � Flash $4C ��� Eeprom $C2
	RCALL	Spi_In_Out		;�������� ������� �� SPI
	MOV	R24,R23
	RCALL	Spi_In_Out		;�������� �������� ����� ������ �� SPI
	MOV	R24,R22
	RCALL	Spi_In_Out		;�������� �������� ����� ������ �� SPI
	RCALL	Spi_Out_00		;�������� $00 ����������/����������� SPI
	MOV	R25,R4		;���� ������ �������� ������
	ANDI	R25,$F1
	SBRC	R25,5		;����� - �������� ���� �� �� � �������� � R19 ?
	LDI	R25,$11		;���������� ��� - ����� ������������� 1,0 ��*R13
Prog_page5:	RCALL	C_program
	RJMP	Prog_out
	; ����� ���������� ������ �� Flash ��� Eeprom
Prog_word:	MOV	R24,R6		;R6 - ������� ������ � �������� Flash $40 ��� Eeprom $C0
	LD	R19,Z+		;������ �� ��� ����� � R19
	RCALL	LVSP_m1		;�������� �������,������ � ����� ������ �� SPI
	CPI	R21,$55		;������������� FLASH ?
	BRNE	Prog_word1
	EOR	R6,R9		;����������� ��. ��� ��. ���� ������
Prog_word1:	MOV	R25,R4
	CP	R19,R10		;R10 = $00 ��� $FF
	BRNE	Prog_word2
	SBRS	R25,3
	LDI	R25,$02		;���������� ��� - ����� ������������� 1,0 ��*R13
Prog_word2:	RCALL	C_program
	TST	R20
	BRNE	Prog_out		;����� �� ������ ����������������
	SBRC	R26,0
	RJMP	Prog_word3
	CPI	R21,$AA		;������������� EEPROM ?
	BRNE	Prog_word4
Prog_word3:	RCALL	Addr_Inc1		;����������������� �������� ������ ������
Prog_word4:	ADIW	R27:R26,1
Prog_comp:	CP	R26,R3
	CPC	R27,R2		;� R25-R24 ���������� ������������ ���� � ��
	BRCS	Prog_word
Prog_out:	MOV	R24,R20
	RJMP	Answer_2		;����� �� �� �������
	; ����������� �������� �� ��������� ���������������� ��������� � R20 = $80,$00 	 
C_program:	MOV	R13,R5		;������� ������� �0 - 1 �� * R13 ������������ �����
	SBRC	R25,0		;���� ������	
	RJMP	C_prog_1
	SBRC	R25,3
	RJMP	C_prog_5		;�������� RDY/~BSY �� ��
	SBRC	R25,1
	RJMP	Delay_1		;����� ������������� 1 �� * R13
	SBRC	R25,2
	RJMP	C_prog_2		;�������� ���� �� �� � �������� � R19
	RJMP	Delay_1		;����� ������������� 1 �� * R13
C_prog_1:	SBRC	R25,6	
	RJMP	C_prog_5		;�������� RDY/~BSY �� ��
	SBRC	R25,4	
	RJMP	Delay_1		;����� ������������� 1 �� * R13
	SBRS	R25,5	
	RJMP	Delay_1		;����� ������������� 1 �� * R13
	; �������� ���� �� �� � �������� � R19
C_prog_2:	CLR	R13
	COM	R13
C_prog_3:	MOV	R24,R8		;������� ������ �� Flash $20 ��� Eeprom $A0 
	CPI	R21,$55		;������������� FLASH ?
	BRNE	C_prog_4
	MOV	R24,R6
	ANDI	R24,$08
	OR	R24,R8
	EOR	R24,R9		;����������� ��. ��� ��. ���� ������
C_prog_4:	RCALL	LVSP_m1		;�������� �������,������ � ���� ����� ������ �� SP
	CP	R24,R19		;R19 = ��������� ���������� ���� ������
	BREQ	C_prog_7
	TST	R13		;������� ������� �0 - 1 �� * R13
	BRNE	C_prog_3
	RJMP	C_prog_6
C_prog_5:	RCALL	RDY_Lvsp1		;�������� RDY/~BSY �� ��
	BREQ	C_prog_7
C_prog_6:	LDI	R20,$80
C_prog_7:	RET

;___________ �������� �������,������ � ����/�������� ����� ������ �� SPI ______________

LVSP_m0:	MOV	R24,R2		;��� ������
LVSP_m1:	RCALL	Spi_In_Out		;�������� ������� �� SPI
	LDS	R24,Cur_addr1	;������� ����� Flash ��� Eeprom ������ ��. ����
	RCALL	Spi_In_Out		;�������� �������� ����� ������ �� SPI
	LDS	R24,Cur_addr0	;������� ����� Flash ��� Eeprom ������ ��. ����
	RCALL	Spi_In_Out		;�������� �������� ����� ������ �� SPI
	MOV	R24,R19		;������ �� ��� ����� � R24
	RJMP	Spi_In_Out		;�������� ����� ������ �� SPI

;___________ �������� ��������������� ����� ������ _____________________________________

Spare_addr:	LDI	R24,$4D
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	RCALL	Spi_Out_00		;�������� $00 �� SPI ����������
	LDS	R24,Cur_addr2	;������� ����� Flash ��� Eeprom ������ ���. ����
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	RJMP	Spi_Out_00		;�������� $00 �� SPI ����������

;___________ ������ ����� �� ��� �������� �� SPI _______________________________________

Ram_Spi_4:	LD	R24,Z+		;������ �� ��� ����� � R24
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
Ram_Spi_3:	LD	R24,Z+		;������ �� ��� ����� � R24
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	LD	R24,Z+		;������ �� ��� ����� � R24
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	LD	R24,Z+		;������ �� ��� ����� � R24
	RJMP	Spi_In_Out		;�������� ���� �� SPI ����������

;___________ ��������/������� ���� �� SPI ���������� ___________________________________

Spi_Out_00:	CLR	R24
Spi_In_Out:	IN	R25,SPCR		;SPI ���������: 0 - �����������,  => $50 - ���������
	TST	R25
	BREQ	Spi_2
	IN	R25,SPSR		;������� ��������� SPI
	IN	R25,SPDR		;������� ������ SPI
	OUT	SPDR,R24		;������� ������ SPI
Spi_1:	SBIS	SPSR,7		;������� ��������� SPI
	RJMP	Spi_1
	IN	R24,SPDR		;������� ������ SPI
	RET
Spi_2:	LDI	R25,8
Spi_3:	BST	R24,7		;�������� ��� �� ���� �
	BRTC	Spi_4		;������� ���� ���� T �������
	SBI	PORTB,5		;������ MOSI = 1
	RJMP	Spi_5
Spi_4:	CBI	PORTB,5		;������ MOSI = 0
Spi_5:	LSL	R24
	LDS	R1,Buffer_078	;�������� �� SPI ���������
	MOV	R0,R1
	LSL	R1
	SUB	R1,R0		;R1 * 1,5
	RCALL	Latency		;����� 1 ��� * R1
	SBIC	PINB,6		;������ MIS0
	SBR	R24,1
	SBI	PORTB,7		;������ SCK = 1
	LDS	R1,Buffer_078	;�������� �� SPI ���������
	MOV	R0,R1
	LSL	R1
	SUB	R1,R0		;R1 * 1,5
	RCALL	Latency		;����� 1 ��� * R1
	CBI	PORTB,7		;������ SCK = 0
	DEC	R25
	BRNE	Spi_3
	RETI

;___________ ������ ����� ���������� ���������������� ����������� LVSP _________________

RDY_Lvsp:	MOV	R13,R24		;������� ������� �0 - 1 �� * R13
RDY_Lvsp1:	LDI	R24,$F0
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	RCALL	Spi_Out_00		;�������� $00 �� SPI ����������
	RCALL	Spi_Out_00		;�������� $00 �� SPI ����������
	RCALL	Spi_Out_00		;�������� $00 �� SPI ����������
	BST	R24,0		;�������� ��� �� ���� �
	BRTC	RDY_Lvsp2		;������� ���� ���� T �������
	TST	R13
	BRNE	RDY_Lvsp1
RDY_Lvsp2:	CLR	R13
	ANDI	R24,1
	RETI
	
;___________ ������������� ������� �2 � SPI ���������� _________________________________

Init_T2:	LDI	R18,$18		;������������� ������� �2 
	LDS	R25,Buffer_077	;���������� ������ �� ���������� ������� �2
	LDS	R24,Buffer_076	;����� ��������� ��������� ������� ������� �2
	OUT	TCCR2,R18
	OUT	OCR2,R25
	ANDI	R24,7
	ORI	R24,$18
	OUT	TCCR2,R24		;��� D7 ����� D �������� Xtal1
	LDS	R25,Buffer_078	;�������� �� SPI ���������
	CPI	R25,$04
	BRCC	Spi_init
	SBI	PORTB,4
	SBI	DDRB,4
	ORI	R25,$50
	RJMP	Spi_init_1
Spi_init:	CLR	R25
Spi_init_1:	OUT	SPCR,R25		;������� ���������� SPI
	RETI
;_______________________________________________________________________________________

.INCLUDE "HVPP.asm"
