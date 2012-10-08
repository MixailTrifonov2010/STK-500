



.DEVICE ATmega16			;� ������� �� 7,3728 ���

.equ 	 SREG	 =$3F		; ������� ���������
.equ 	 SPH	 =$3E		; ������� ���� �������� ��������� �����
.equ 	 SPL	 =$3D		; ������� ���� �������� ��������� �����
.equ 	 OCR0	 =$3C		; �������� ��������� ������� / �������� �0
.equ 	 GICR 	 =$3B		; ����� ������� ���������� ������������
.equ 	 GIFR	 =$3A		; ����� ������� ������ ����������
.equ 	 TIMSK	 =$39		; ������� ����� ���������� �������� / ���������
.equ 	 TIFR 	 =$38		; ������� ������ ���������� �������� / ���������
.equ 	 SPMCR	 =$37		; ������� ���������� ���������������������
.equ 	 TWCR	 =$36		; TWI ������� ��������(����������)
.equ 	 MCUCR	 =$35		; ������� ���������� � ��������� ����������������
.equ 	 MCUCSR	 =$34		; ������� ��������� ����������������
.equ 	 TCCR0	 =$33		; ������� ���������� ������� / �������� �0
.equ 	 TCNT0 	 =$32		; ������� ������� ������� / �������� �0
.equ 	 OSCCAL	 =$31		; ������� ���������� ����������� ����������
.equ 	 SFIOR	 =$30		; ������� ����������� ������� I/O 
.equ 	 TCCR1A	 =$2F		; ������� ���������� A ������� / �������� �1
.equ 	 TCCR1B	 =$2E		; ������� ���������� B ������� / �������� �1
.equ 	 TCNT1H	 =$2D		; ������� ������ ������� / �������� �1 ��. ����
.equ 	 TCNT1L	 =$2C		; ������� ������ ������� / �������� �1 ��. ����
.equ 	 OCR1AH	 =$2B		; ������� ��������� � ������� / �������� �1 ��. ����
.equ 	 OCR1AL	 =$2A		; ������� ��������� � ������� / �������� �1 ��. ����
.equ 	 OCR1BH	 =$29		; ������� ��������� � ������� / �������� �1 ��. ����
.equ 	 OCR1BL	 =$28		; ������� ��������� � ������� / �������� �1 ��. ����
.equ 	 ICR1H 	 =$27		; ������� ������� ������� / �������� �1 ��. ����
.equ 	 ICR1L 	 =$26		; ������� ������� ������� / �������� �1 ��. ����
.equ 	 TCCR2	 =$25		; ������� ���������� ������� / �������� �2
.equ 	 TCNT2	 =$24		; ������� ������� ������� / �������� �2
.equ 	 OCR2 	 =$23		; �������� ��������� ������� / �������� �2
.equ 	 ASSR 	 =$22		; ������� ������������ ������
.equ 	 WDTCR 	 =$21		; ������� ����������� �������
.equ 	 UBRRH	 =$20		; USART ��. ���� �������� �������� � ����� ?
.equ 	 UCSRC 	 =$20		; USART ��������(����������) � C �������� ���������
.equ 	 EEARH	 =$1F		; ������� ������ EEPROM ��. ����
.equ 	 EEARL	 =$1E		; ������� ������ EEPROM ��. ����
.equ 	 EEDR 	 =$1D		; ������� ������ EEPROM
.equ 	 EECR 	 =$1C		; ������� ���������� EEPROM
.equ 	 PORTA	 =$1B		; ������� ������ ���� A (�����)
.equ 	 DDRA 	 =$1A		; ������� ����������� ���� A
.equ 	 PINA 	 =$19		; ������ ���� A (����)
.equ 	 PORTB	 =$18		; ������� ������ ���� B (�����)
.equ 	 DDRB 	 =$17		; ������� ����������� ���� B
.equ 	 PINB 	 =$16		; ������ ���� B (����)
.equ 	 PORTC	 =$15		; ������� ������ ���� C (�����)
.equ 	 DDRC 	 =$14		; ������� ����������� ���� C
.equ 	 PINC 	 =$13		; ������ ���� C (����)
.equ 	 PORTD	 =$12		; ������� ������ ���� D (�����)
.equ 	 DDRD 	 =$11		; ������� ����������� ���� D
.equ 	 PIND 	 =$10		; ������ ���� D (����)
.equ 	 SPDR 	 =$0F		; SPI ������� ������
.equ 	 SPSR	 =$0E		; SPI ������� ���������
.equ 	 SPCR 	 =$0D		; SPI ������� ����������
.equ 	 UDR 	 =$0C		; USART ������� ������ ����� - ������
.equ 	 UCSRA 	 =$0B		; USART ������� ��������� � ���������� A
.equ 	 UCSRB	 =$0A		; USART ������� ��������� � ���������� B
.equ 	 UBRRL	 =$09		; USART ��. ���� �������� �������� � �����
.equ 	 ACSR 	 =$08		; ������� ���������� � ��������� ���������� ������������
.equ 	 ADMUX	 =$07		; ������� ���������� ��������������� ���
.equ 	 ADCSRA	 =$06		; ������� ���������� � ��������� ��� 
.equ 	 ADCH 	 =$05		; ��. ���� �������� ������ ���
.equ 	 ADCL 	 =$04		; ��. ���� �������� ������ ���
.equ 	 TWDR 	 =$03		; TWI ������� ������
.equ 	 TWAR 	 =$02		; TWI (�����������) ������� ������
.equ 	 TWSR 	 =$01		; TWI ������� ���������
.equ 	 TWBR 	 =$00		; TWI ������� �������� �������� � �����
.equ 	 RAMEND	 =$045F		; ������� ������� ������� ���

.CSEG
.ORG $000

Reset:	JMP	Start		; ��������� ������
	JMP	Reset		; ������� ���������� 0	
	JMP	Reset		; ������� ���������� 1
	JMP	Reset  		; ���������� �������/�������� �2
	JMP	Reset		; ������������ �������/�������� �2
	JMP	Reset	     	; ������ �������/�������� �1
	JMP	Reset		; ���������� � �������/�������� �1
	JMP	Reset		; ���������� � �������/�������� �1
	JMP	Reset  		; ������������ �������/�������� �1
	JMP	Reset		; ������������ �������/�������� �0
	JMP	Reset		; �������� �� SPI ���������
	RJMP	US_rxc		; USART, ���� ��������
	NOP
	RJMP	Us_udre		; ������� ������ USART ����
	NOP
	JMP	Reset		; USART, �������� ���������
	JMP	Reset		; �������������� ��� ���������
 	JMP	Reset 		; EEPROM ������
	JMP	Reset            	; ���������� ����������
	JMP	Reset		; ���������� �� ������ TWI
	JMP	Reset 		; ������� ���������� 2
	RJMP	MatchT0  		; ���������� �������/�������� �0
	NOP
	JMP	Reset		; ���������� SPM

Data_1:	.DB $00,$08,'S','T','K','5','0','0','_','2'

Data_s:	.DB $02,$02,$0A,$FF,$32,$19,$01,$00,$01,$FF,$F2,$FF,$FF,$FF,$01,$FF

;_______________________________________________________________________________________

Start:	LDI	R28,LOW(RAMEND)
	LDI	R29,HIGH(RAMEND)
	OUT	SPH,R29
	OUT	SPL,R28
	LDI	R26,LOW(Buffer_060)
	LDI	R27,HIGH(Buffer_060)	;R27-R26 = $0060
	; ������� ��� ����� ��������� ������� ��� ����������� ������.
Start_1:	ST	-Y,R27
	CP	R28,R26
	CPC	R29,R27
	BRCC	Start_1
	LDI	R30,LOW(Data_s*2)
	LDI	R31,HIGH(Data_s*2)
Start_2:	LPM	R0,Z+
	ST	X+,R0
	CPI	R26,$70
	BRNE	Start_2
	; ������������� ������ �����/������
	LDI	R16,$6C
	OUT	PORTD,R16		;C������ Reset=0,12v-����,Xtpl1=1
	LDI	R16,$BE
	OUT	DDRD,R16
	OUT	DDRA,R29
	LDI	R16,$FF
	OUT	PORTA,R16
	OUT	DDRB,R29
	OUT	PORTB,R29
	OUT	DDRC,R29
	OUT	PORTC,R29
	; ������������� ������� �0
	LDI	R16,$72
	OUT	OCR0,R16
	LDI	R16,$02
	OUT	TIMSK,R16
	LDI	R16,$0B
	OUT	TCCR0,R16
	; ������������� USART
	LDI	R16,3
	OUT	UBRRL,R16
	LDI	R16,$98
	OUT	UCSRB,R16

;___________ ����� ������������ ________________________________________________________

Select:	SEI			;��������� ���������� ����������
	LDI	R28,$60
	LDI	R29,$00         	;����� ������� ���
	LDD	R16,Y+$1B		;������ � �������� ��������� ($01)
	TST	R16
	BREQ	Select_1
	RCALL	Leader_4		;�������� ��������� 4
	LDI	R16,$B0
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	LDI	R16,$C1
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	RJMP	Sel_out
Select_1:	LDD	R17,Y+$1A		;������ ����� ������ ($01)
	TST	R17
	BREQ	Select
Select_2:	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R14,R16		;��� ������� �������� �� ��
	STD	Y+$1E,R29		;������� ���������� ���� � ����� USART
	STD	Y+$1F,R29		;������� ���������� ���� �� USART
	DEC	R16
	CPI	R16,$3C
	BRCS	Select_3
	RCALL	Table_err
	RJMP	Sel_out
Select_3:	LDI	R30,LOW(Table)
	LDI	R31,HIGH(Table)
	ADD	R30,R16
	ADC	R31,R29
	ICALL

Sel_out:	LDD	R16,Y+$1D		;����������� ����� ������������� �������� �� USART 
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	STD	Y+$12,R29
	STD	Y+$13,R29		;������� ����������� ���� ������ �� USART
	STD	Y+$14,R29
	STD	Y+$15,R29		;������� ������������ ���� ������ �������� �� USART
	STD	Y+$1D,R29		;����������� ����� ������������� ��������� �� USART 
	STD	Y+$1C,R29		;����������� ����� ��������� �������� �� USART 
	STD	Y+$1B,R29		;�������� ������ � �������� ��������� ($00)
	STD	Y+$1A,R29		;�������� - ������ ����� ������ ($00)
	STD	Y+$19,R29		;����� ����� �������� ���������
	RJMP	Select

;___________ ������� �������� ��������� ________________________________________________

Table:	RJMP	Name_out		;����� �� - STK500-2
	RJMP	Rate_WR		;��������� �������� ������� �2
	RJMP	Rate_RD		;������ �������� ����������������
	RJMP	Table_err		;������� �� ��������������
	RJMP	Table_err		;�������� �� ������� �� � ������ LVSP
	RJMP	Burn		;��������� ������� ����� 4 �����
	RJMP	Table_err		;������� �� ��������������
	RJMP	Table_err		;������� �� ��������������
	RJMP	Table_err		;������� �� ��������������
	RJMP	Table_err		;������� �� ��������������

	RJMP	Table_err		;������� �� ��������������
	RJMP	Table_err		;������� �� ��������������
	RJMP	Table_err		;������� �� ��������������
	RJMP	Table_err		;������� �� ��������������
	RJMP	Table_err		;������� �� ��������������
	RJMP	Start_spi		;���� � ����� LVSP
	RJMP	Spi_close		;��������� ������� �� ��  � ������ LVSP ��������� 
	RJMP	Chip_erase		;�������� ��������� � ������ LVSP
	RJMP	WR_spi_Fla		;������ �� Flash ������ � ������ LVSP
	RJMP	M_spi_rw_1		;������ Flash ������ � ������ LVSP

	RJMP	WR_spi_Eep		;������ � EEPROM � ������ LVSP
	RJMP	M_spi_rw		;������ EEPROM ������ � ������ LVSP
	RJMP	F_defense		;������ ���������������� ����� � ������ LVSP
	RJMP	Sign_LVSP		;������ ���������������� ����� � ������ LVSP
	RJMP	F_defense		;������ ����� ������ � ������ LVSP
	RJMP	Sign_LVSP		;������ ����� ������ � ������ LVSP
	RJMP	Sign_LVSP		;������ ��������� ���������������� � ������ LVSP
	RJMP	Sign_LVSP		;������ ������������� ������ � ������ LVSP
	RJMP	In_Out_Port		;���������� ������� A,B,C, �������� Reset � +5v
	RJMP	Table_err		;������� �� ��������������

	RJMP	Table_err		;������� �� ��������������
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
	RJMP	Table_err		;������� �� ��������������
	RJMP	Table_err		;������� �� ��������������
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

Table_err:	LDI	R16,1
	RCALL	Leader_5		;�������� ��������� 5
	LDI	R16,$C9
	RJMP	Usart_out		;��������� ���� �� R16 �� USART

;___________ ����� �� - STK500-2 _______________________________________________________

Name_out:	LDI	R16,$0B
	RCALL	Leader_5		;�������� ��������� 5
	LDI	R30,LOW(Data_1*2)
	LDI	R31,HIGH(Data_1*2)
	LDI	R19,$0A
Name_out_1:	LPM	R16,Z+
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	DEC	R19
	BRNE	Name_out_1
	RET

;___________ ��������� �������� SPI � ������� ������� �2 _______________________________

Rate_WR:	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	MOV	R30,R25
	RCALL	Leader_4		;�������� ��������� 4
	ANDI	R30,$0F
	CLR	R31
	CPI	R30,$06
	BRNE	Rate_WR_1
	ANDI	R24,$07
Rate_WR_1:	CPI	R30,$0E
	BRNE	Rate_WR_3
	TST	R24
	LDD	R24,Z+$00
	BREQ	Rate_WR_2
	ORI	R24,8
	RJMP	Rate_WR_3
Rate_WR_2:	ANDI	R24,$F7
Rate_WR_3:	SUBI	R30,$A0
	SBCI	R31,$FF		;R31-R30 + $0060
	STD	Z+$00,R24
	RJMP	Usart_00		;��������� $00 �� USART

;___________ ������ �������� ���������������� �� SPI ___________________________________
	; ��������� ��� ��������������, ����� 74HC597,�������� ������� �2
	; �������� �� SPI ���������,��������� ����� �
Rate_RD:	IN	R16,PINB
	STD	Y+$0D,R16
	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R30,R16
	ANDI	R30,$1F
	CLR	R31
	SBRC	R30,4	
	RJMP	Rate_RD_1
	LDI	R16,$09
	TST	R30
	BREQ	Rate_RD_2		;�������� ��������� 5 � ��������� $00 �� USART
	CLR	R16
	RJMP	Rate_RD_2		;�������� ��������� 5 � ��������� $00 �� USART
Rate_RD_1:	ANDI	R30,$0F
	SUBI	R30,$A0
	SBCI	R31,$FF		;R31-R30 + $0060
	LDD	R16,Z+$00
Rate_RD_2:	MOV	R24,R16
	LDI	R16,$03
	RCALL	Leader_5		;�������� ��������� 5
	RCALL	Usart_00		;��������� $00 �� USART
	MOV	R16,R24
	RJMP	Usart_out		;��������� ���� �� R16 �� USART

;___________ ��������� ������� ����� 4 ����� ___________________________________________

Burn:	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	STS	Buffer_0A0+2,R24
	STS	Buffer_0A0+3,R25
	RCALL	Read_2byte		;������ �� ��� ���� ���� � R25-R24
	STS	Buffer_0A0,R24
	STS	Buffer_0A0+1,R25
	RJMP	Lead4_00		;�������� ��������� 4 � $00 � USART

;___________ ���������� ���� ������ ��������������� ���������������� 32 ����� __________

Copy_32:	LDI	R26,$80
	LDI	R27,$00
	LDI	R20,$20
Copy_32_1:	RCALL	Read_10_1		;������ �� ��� N ���� � ������ �� ������ � R27-R26
	RJMP	Lead4_00		;�������� ��������� 4 � $00 � USART

;___________ ���������� ������� A,B,C, �������� Reset � +5v ____________________________

In_Out_Port:LDI	R20,$07
	RCALL	Read_N_byt		;������ �� ��� ���� ���� � R0-R6
	IN	R7,PINA
	IN	R8,PINB
	IN	R9,PINC
	IN	R10,PIND
	OUT	DDRA,R0		;�������� ����� ����� �
	OUT	PORTA,R1		;������ �������� ���� � ���� � (���/���� ��������)
	OUT	DDRB,R2		;�������� ����� ����� B
	OUT	PORTB,R3		;������ �������� ���� � ���� B (���/���� ��������)
	OUT	DDRC,R4		;�������� ����� ����� C
	OUT	PORTC,R5		;������ �������� ���� � ���� C (���/���� ��������)
	MOV	R17,R6
	ANDI	R17,$24
	IN	R16,PORTD
	ANDI	R16,$DB
	OR	R16,R17
	OUT	PORTD,R16		;���/���� +5v (PIND5 0-���, 1-����. PIND2=0 �� Reset=1, PIND2=1 �� Reset=0)
	LDI	R16,$07
	RCALL	Leader_5		;�������� ��������� 5
	RCALL	Usart_00		;��������� $00 �� USART
	MOV	R16,R7
	RCALL	Usart_out		;��������� ��������� ����� � (����) �� USART
	MOV	R16,R8
	RCALL	Usart_out		;��������� ��������� ����� B (����) �� USART
	MOV	R16,R9
	RCALL	Usart_out		;��������� ��������� ����� C (����) �� USART
	MOV	R16,R10
	RJMP	Usart_out		;��������� ��������� ����� D (����) �� USART

;___________ �������� ��������� � �������������� ���� �� USART _________________________

Leader_0:	RCALL	Hvsp_m7		;������ � �� R17-�������,R16-������,�������� ��������� 0
Leader_1:	MOVW	R17:R16,R25:R24	;�������� ��������� 1
Leader_2:	SUBI	R16,$FD		;�������� ��������� 2
	SBCI	R17,$FF		;R17-R16 + 3
Leader_3:	RCALL	Leader_6		;�������� ��������� 3
	RJMP	Usart_00		;��������� $00 �� USART

Leader_4:	LDI	R16,$02		;�������� ��������� 4
Leader_5:	LDI	R17,$00		;�������� ��������� 5
	; ��������� �� USART - $1B,(Y+$18),R17,R16,$0E,��� �������
Leader_6:	PUSH	R25
	PUSH	R24
	MOVW	R25:R24,R17:R16
	LDI	R16,$1B
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	LDD	R16,Y+$18		;���������� ����� ������� � �������� ��������� �� USART
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	MOV	R16,R25
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	MOV	R16,R24
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	LDI	R16,$0E
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	MOV	R16,R14		;��� ������� �������� �� ��
	RCALL	Usart_out		;��������� ���� �� R16 �� USART
	POP	R24
	POP	R25
	RET

;___________ ����������������� �������� ������ FLASH ��� Eeprom ������ _________________

Addr_Inc:	LDS	R16,Buffer_0A0
	OUT	PORTB,R16
Addr_Inc1:	LDS	R16,Buffer_0A0
	LDS	R17,Buffer_0A0+1
	LDS	R18,Buffer_0A0+2	;������� ����� Flash ��� Eeprom ������
	SUBI	R16,$FF
	SBCI	R17,$FF
	SBCI	R18,$FF		;R18-R16 + 1
	STS	Buffer_0A0,R16
	STS	Buffer_0A0+1,R17
	STS	Buffer_0A0+2,R18	;������� ����� Flash ��� Eeprom ������
	RET

;___________ ������ �� ��� N ���� � R0-Rn ______________________________________________

Read_N_byt:	LDI	R27,$00
	LDI	R26,$00
Read_10_1:  MOVW	R19:R18,R27:R26
	RCALL	Read_byte		;������ �� ��� ����� � R16
            MOVW	R27:R26,R19:R18
	ST	X+,R16
	DEC	R20
	BRNE	Read_10_1
	RET

;___________ ������ �� ��� ���� ���� � R25-R24 _________________________________________

Read_2byte:	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R25,R16
	RCALL	Read_byte		;������ �� ��� ����� � R16
	MOV	R24,R16
	RET

;___________ ������ �� ��� ����� � R16 _________________________________________________

Read_byte:	LDD	R16,Y+$12
	LDD	R17,Y+$13		;������� ����������� ���� ������ �� USART
	LDD	R26,Y+$14
	LDD	R27,Y+$15		;������� ������������ ���� ������ �������� �� USART
	CP	R16,R26
	CPC	R17,R27
	BREQ	Read_byte
	ADIW	R27:R26,1
	STD	Y+$14,R26
	STD	Y+$15,R27		;������� ������������ ���� ������ �������� �� USART
	SUBI	R26,$01
	SBCI	R27,$FF		;R27-R26 + $00FF
	LD	R16,X
	RET
;_______________________________________________________________________________________

.INCLUDE "LVSP-spi.asm"

