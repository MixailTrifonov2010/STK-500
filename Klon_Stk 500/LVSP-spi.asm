

;____________ �������� ���������������� � ����� ����������������� ���������������� _____

Start_spi:	RCALL	Init_T2		;������������� ������� �2 � SPI ����������
	SBI	PORTD,3		;��������� +12v 
	LDI	R20,$0B
	RCALL	Read_N_byt		;������ �� ��� ���������� ���� � R0-R10
Start_spi1:	CBI	PORTD,5		;�������� +5v
	CBI	PORTD,2		;C����� Reset = 0 (�� ���� VT5)
	MOV	R16,R1
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
	LDI	R16,$B0
	OUT	DDRB,R16
	OUT	PORTB,R29
	SBI	PORTD,2		;C����� Reset = 1 (�� ���� VT5)
	MOV	R16,R1
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
	DEC	R3
	BREQ	Start_spi5
	MOV	R16,R7
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	MOV	R16,R8
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	MOV	R16,R9
	RCALL	Spi_In_Out		;��������/������� ���� �� SPI ����������
	MOV	R0,R16
	MOV	R16,R10
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
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
Start_spi4:	RJMP	Lead4_00		;�������� ��������� 4 � $00 � USART
Start_spi5:	RCALL	Leader_4		;�������� ��������� 4
	RCALL	Usart_C0		;��������� $C0 �� USART
	RJMP	Spi_close1		;������/����� ������ Reset �� �� � ��������� +12v

;___________ ��������� ������� �� �� ��������� _________________________________________

Spi_close:	RCALL	Lead4_00		;�������� ��������� 4 � $00 � USART
Spi_close1:	SBI	PORTD,5		;��������� +5v
	OUT	DDRB,R29
	OUT	PORTB,R29
	OUT	TCCR2,R29		;��������� ������ �2
	OUT	SPCR,R29		;��������� ��������� SPI ���������
	OUT	TCCR1A,R29	
	OUT	TCCR1B,R29		;��������� ������ �1
	CBI	PORTD,2		;C����� Reset = 0 (�� ���� VT5)
	RET

;___________ �������� ��������� ________________________________________________________

Chip_erase:	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	MOV	R16,R25
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
Ch_erase2:	RCALL	Ram_Spi_4		;������ ����� �� ��� �������� �� SPI
	TST	R24
	BREQ	Ch_erase3
	RCALL	RDY_Lvsp		;������ ����� ���������� ��������������� �����������
	BREQ	Ch_erase4
	RCALL	Leader_4		;�������� ��������� 4
	LDI	R16,$80
	RJMP	Usart_out		;��������� ���� �� R16 �� USART
Ch_erase3:	MOV	R16,R25
	RCALL	Delay		;����� ������������� 1 �� * (R16+1)
Ch_erase4:	RJMP	Lead4_00		;�������� ��������� 4 � $00 � USART

;___________ ������ ������ � ����� ������ ______________________________________________

F_defense:	RCALL	Ram_Spi_4		;������ ����� �� ��� �������� �� SPI
	LDI	R16,$03
	LDI	R17,$00
	RCALL	Leader_3		;�������� ��������� 3
	RJMP	Usart_00		;��������� $00 �� USART

;___________ ������ ��������� ���������������� �� SPI __________________________________
	; ����� ������, ��������������, ���������������� ����� � ������������
	; ������ ����������
Sign_LVSP:	RCALL	Read_byte
	MOV	R24,R16		;������ �� ��� ����� � R24
	RCALL	Ram_Spi_3		;��� ����� �� ��� �������� �� SPI
	MOV	R9,R16
	RCALL	Spi_Out_00		;������� ���� �� SPI ����������
	MOV	R8,R16
	LDI	R16,$04
	LDI	R17,$00
	RCALL	Leader_3		;�������� ��������� 3
	CPI	R24,3
	BRNE	Sign_LVSP2
	MOV	R16,R9
	RJMP	Sign_LVSP3
Sign_LVSP2:	MOV	R16,R8
Sign_LVSP3:	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	RJMP	Usart_00		;��������� $00 �� USART

;___________ ������ � EEPROM ��� Flash �� SPI __________________________________________

WR_spi_Fla:	LDI	R21,$55		;������������� Flash
	RJMP	Prog_wr
WR_spi_Eep:	LDI	R21,$AA		;������������� EEPROM
Prog_wr:	LDI	R20,$09
	RCALL	Read_N_byt		;������ �� ��� ������ ���� � R0-R8
	LDS	R22,Buffer_0A0
	LDS	R23,Buffer_0A0+1	;������� ����� Flash ��� Eeprom ������
	LDI	R17,$08		;��� ������ ������� - ������� ���� ������
	MOV	R10,R17		;��� ������ ������� - ������� ���� ������
	CLR	R11
            CLR         R24
	CLR	R25
	LDS	R16,Buffer_0A0+3	;�������������� ����� ������ ��� 7 
	SBRC	R16,7
	RCALL	Spare_addr		;�������� ��������������� ����� ������ ��� ATmega256
	SBRS	R2,0		;���� ������ - 0 = ������ �������, 1 = ��������� 
	RJMP	Prog_comp		;����� ���������� ������ �� Flash ��� Eeprom
	; ����� ���������� ������ �� Flash ��� Eeprom
	RJMP	Prog_page4
Prog_page:	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R9,R16
	MOV	R16,R4		;R4 - ������� ������ � �������� Flash $40 ��� Eeprom $C1
	RCALL	LVSP_m2		;�������� �������,������ � ����� ������ �� SPI
	CPI	R21,$55		;������������� FLASH ?
	BRNE	Prog_page1
	EOR	R4,R10		;����������� �������� ������� ��� ������� ���� ������
Prog_page1:	SBRC	R24,0
	RJMP	Prog_page2
	CPI	R21,$AA		;������������� EEPROM ?
	BRNE	Prog_page3
Prog_page2:	RCALL	Addr_Inc1		;����������������� �������� ������ ������	
Prog_page3:	ADIW	R25:R24,1
Prog_page4:	CP	R24,R1
	CPC	R25,R0		;� R25-R24 ���������� ������������ ���� � ��
	BRCS	Prog_page
	; ������ ������� ������ �������� �� Flash ��� Eeprom
	SBRS	R2,7		;���� ������ - ������ ���������� ?
	RJMP	Prog_out
	MOV	R16,R5		;R5 - ������� ������ �������� � Flash $4C ��� Eeprom $C2
	RCALL	Spi_In_Out		;�������� ������� �� SPI
	MOV	R16,R23
	RCALL	Spi_In_Out		;�������� �������� ����� ������ �� SPI
	MOV	R16,R22
	RCALL	Spi_In_Out		;�������� �������� ����� ������ �� SPI
	RCALL	Spi_Out_00		;�������� $00 ����������/����������� SPI
	MOV	R16,R2		;���� ������ �������� ������
	ANDI	R16,$F0
	SBRS	R16,5		;����� - �������� ���� �� �� � �������� � R9 ?
	RJMP	Prog_page5
	LDI	R16,$11		;���������� ��� - ����� ������������� 1,0 ��*R16
Prog_page5:	RCALL	C_program
	RJMP	Prog_out
	; ����� ���������� ������ �� Flash ��� Eeprom
Prog_word:	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R9,R16
	MOV	R16,R4		;R6 - ������� ������ � �������� Flash $40 ��� Eeprom $C1
	RCALL	LVSP_m2		;�������� �������,������ � ����� ������ �� SPI
	CPI	R21,$55		;������������� FLASH ?
	BRNE	Prog_word1
	EOR	R4,R10		;����������� �������� ������� ��� ������� ���� ������
Prog_word1:	MOV	R16,R2
	CP	R9,R8		;R8 = $00 ��� $FF
	BRNE	Prog_word2
	SBRC	R16,3
	RJMP	Prog_word2
	LDI	R16,$02		;���������� ��� - ����� ������������� 1,0 ��*R16
Prog_word2:	RCALL	C_program
	TST	R11
	BRNE	Prog_out		;����� �� ������ ����������������
	SBRC	R24,0
	RJMP	Prog_word3
	CPI	R21,$AA		;������������� EEPROM ?
	BRNE	Prog_word4
Prog_word3:	RCALL	Addr_Inc1		;����������������� �������� ������ ������
Prog_word4:	ADIW	R25:R24,1
Prog_comp:	CP	R24,R1
	CPC	R25,R0		;� R25-R24 ���������� ������������ ���� � ��
	BRCS	Prog_word
Prog_out:	RJMP	Leader4_11		;�������� ��������� 4 � R11 ��������� ����������
	; ����������� �������� �� ��������� ���������������� ��������� � R11 = $80,$00 
C_program:	MOV	R15,R3		;������������ �����
	SBRC	R16,0		;���� ������	
	RJMP	C_prog_1
	SBRC	R16,3
	RJMP	C_prog_5		;�������� RDY/~BSY �� ��
	SBRC	R16,1
	RJMP	Delay_1		;����� ������������� 1 �� * R15
	SBRC	R16,2
	RJMP	C_prog_2		;�������� ���� �� �� � �������� � R9
	RJMP	Delay_1		;����� ������������� 1 �� * R15
C_prog_1:	SBRC	R16,6	
	RJMP	C_prog_5		;�������� RDY/~BSY �� ��
	SBRC	R16,4	
	RJMP	Delay_1		;����� ������������� 1 �� * R15
	SBRS	R16,5	
	RJMP	Delay_1		;����� ������������� 1 �� * R15
	; �������� ���� �� �� � �������� � R9
C_prog_2:	CLR	R15
	COM	R15
C_prog_3:	MOV	R16,R6		;������� ������ �� Flash $20 ��� Eeprom $A0 
	CPI	R21,$55		;������������� FLASH ?
	BRNE	C_prog_4
	MOV	R16,R4
	ANDI	R16,$08
	OR	R16,R6
	EOR	R16,R10		;����������� �������� ������� ��� ������� ���� ������
C_prog_4:	RCALL	LVSP_m1		;�������� �������,������ � ���� ����� ������ �� SP
	CP	R16,R9		;R9 = ��������� ���������� ���� ������
	BREQ	C_prog_7
	TST	R15
	BRNE	C_prog_3
	RJMP	C_prog_6
C_prog_5:	RCALL	RDY_Lvsp1		;�������� RDY/~BSY �� ��
	BREQ	C_prog_7
C_prog_6:	LDI	R16,$80
	MOV	R11,R16
C_prog_7:	RET

;___________ ������ Flash ��� EEPROM ������ �� SPI _____________________________________

M_spi_rw:	LDI	R16,$00		;������ EEPROM ������
M_spi_rw_1:	MOV	R5,R16		;������ Flash ������
	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R4,R16
M_spi_rw_2:	LDS	R6,Buffer_0A0+3	;�������������� ����� ������ ��� 7 
	SBRC	R6,7
	RCALL	Spare_addr		;�������� ��������������� ����� ������
	RCALL	Leader_1		;�������� ��������� 1
	RJMP	M_spi_rw_5
M_spi_rw_3:	RCALL	LVSP_mO		;�������� ��� �������, ��. � ��. ����� ������
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	TST	R5
	BREQ	M_spi_rw_4		;���� $00 EEPROM ����� ������ Flash
	MOV	R16,R4
	ORI	R16,8
	RCALL	LVSP_m1		;�������� ��� �������, ��. � ��. ����� ������
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	SBIW	R25:R24,1
M_spi_rw_4:	RCALL	Addr_Inc1		;����������������� �������� ������ FLASH ��� Eeprom ������
	SBRS	R6,7		;�������������� ����� ������ ��� 7 
	RJMP	M_spi_rw_5
	TST	R17
	BRNE	M_spi_rw_5
	LDS	R16,Buffer_0A0	;������� ����� Flash ��� Eeprom ������
	TST	R16
	BRNE	M_spi_rw_5
	RCALL	Spare_addr		;�������� ��������������� ����� ������
M_spi_rw_5:	SBIW	R25:R24,1
	BRPL	M_spi_rw_3
	RJMP	Usart_00		;��������� $00 �� USART

;___________ �������/�������� ���� �� SPI ���������� ___________________________________

Spi_Out_00:	CLR	R16
Spi_In_Out:	IN	R17,SPCR		;SPI ���������: 0 - �����������, => $50 - ���������
	TST	R17
	BREQ	Spi_2
	IN	R17,SPSR		;������� ��������� SPI
	IN	R17,SPDR		;������� ������ SPI
	OUT	SPDR,R16		;������� ������ SPI
Spi_1:	SBIS	SPSR,7		;������� ��������� SPI
	RJMP	Spi_1
	IN	R16,SPDR		;������� ������ SPI
	RET
Spi_2:	MOV	R26,R16
	LDI	R27,8
Spi_3:	BST	R26,7		;�������� ��� �� ���� �
	BRTC	Spi_4		;������� ���� ���� T �������
	SBI	PORTB,5		;������ MOSI = 1
	RJMP	Spi_5
Spi_4:	CBI	PORTB,5		;������ MOSI = 0
Spi_5:	LSL	R26
	LDD	R16,Y+$08		;�������� �� SPI ���������
	RCALL	Latency		;����� 1,628 ��� * (R16+1)
	SBIC	PINB,6		;������ MIS0
	SBR	R26,1
	SBI	PORTB,7		;������ SCK = 1
	LDD	R16,Y+$08		;�������� �� SPI ���������
	RCALL	Latency		;����� 1,628 ��� * (R16+1)
	CBI	PORTB,7		;������ SCK = 0
	DEC	R27
	BRNE	Spi_3
	MOV	R16,R26
	RET
	
;___________ ������ ����� ���������� ���������������� ����������� LVSP _________________

RDY_Lvsp:	MOV	R15,R24		;���������� ��������
RDY_Lvsp1:	LDI	R16,$F0
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	RCALL	Spi_Out_00		;�������� $00 �� SPI ����������
	RCALL	Spi_Out_00		;�������� $00 �� SPI ����������
	RCALL	Spi_Out_00		;�������� $00 �� SPI ����������
	BST	R16,0		;�������� ��� �� ���� �
	BRTC	RDY_Lvsp2		;������� ���� ���� T �������
	TST	R15
	BRNE	RDY_Lvsp1
RDY_Lvsp2:	CLR	R15
	ANDI	R16,1
	RET

;___________ ������������� ������� �2 � SPI ���������� _________________________________

Init_T2:	LDI	R18,$18		;������������� ������� �2 
	LDD	R17,Y+$07		;���������� ������ �� ���������� ������� �2
	LDD	R16,Y+$06		;����� ��������� ��������� ������� ������� �2
	OUT	TCCR2,R18
	OUT	OCR2,R17
	ANDI	R16,7
	ORI	R16,$18
	OUT	TCCR2,R16		;��� D7 ����� D �������� Xtal1
	LDS	R17,Buffer_068	;�������� �� SPI ���������
	CPI	R17,$04
	BRCC	Spi_init
	SBI	PORTB,4
	SBI	DDRB,4
	ORI	R17,$50
	RJMP	Spi_init_1
Spi_init:	CLR	R17
Spi_init_1:	OUT	SPCR,R17		;������� ���������� SPI
	RET

;___________ ������ ����� �� ��� �������� �� SPI _______________________________________

Ram_Spi_4:	RCALL	Read_byte		;������ �� ��� ����� � R16
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
Ram_Spi_3:	RCALL	Read_byte		;������ �� ��� ����� � R16
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	RCALL	Read_byte		;������ �� ��� ����� � R16
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	RCALL	Read_byte		;������ �� ��� ����� � R16
	RJMP	Spi_In_Out		;�������� ���� �� SPI ����������

;___________ �������� ��������������� ����� ������ _____________________________________

Spare_addr:	LDI	R16,$4D
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	RCALL	Spi_Out_00		;�������� $00 �� SPI ����������
	LDS	R16,Buffer_0A0+2	;Buffer_0A2
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	RJMP	Spi_Out_00		;�������� $00 �� SPI ����������

;___________ �������� �������,������ � ���� ����� ������ �� SPI _______________________

LVSP_mO:	MOV	R16,R4		;��� ������
LVSP_m1:	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	LDS	R16,Buffer_0A0+1	;������� ���� ������
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	LDS	R16,Buffer_0A0	;������� ���� ������
	RCALL	Spi_In_Out		;�������� ���� �� SPI ����������
	RJMP	Spi_Out_00		;�������� $00 �� SPI ����������

;___________ �������� �������,������ � ����� ������ �� SPI _____________________________

LVSP_m2:	RCALL	Spi_In_Out		;�������� ������� �� SPI
	LDS	R16,Buffer_0A0+1
	RCALL	Spi_In_Out		;�������� �������� ����� ������ �� SPI
	LDS	R16,Buffer_0A0
	RCALL	Spi_In_Out		;�������� �������� ����� ������ �� SPI
	MOV	R16,R9		;������ �� ��� ����� � R24
	RJMP	Spi_In_Out		;�������� ����� ������ �� SPI
;_______________________________________________________________________________________

.INCLUDE "HVPP.asm"

