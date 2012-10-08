


.DEVICE ATmega16			;� ������� �� 12,0 ���

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
	RJMP	INterrupt0		; ������� ���������� 0
	NOP
	JMP	Reset		; ������� ���������� 1
	JMP	Reset  		; ���������� �������/�������� �2
	JMP	Reset		; ������������ �������/�������� �2
	JMP	Reset	     	; ������ �������/�������� �1
	JMP	Reset		; ���������� � �������/�������� �1
	JMP	Reset		; ���������� � �������/�������� �1
	JMP	Reset  		; ������������ �������/�������� �1
	JMP	Reset		; ������������ �������/�������� �0
	JMP	Reset		; �������� �� SPI ���������
	JMP	Reset		; USART, ���� ��������
	JMP	Reset		; ������� ������ USART ����
	JMP	Reset		; USART, �������� ���������
	JMP	Reset		; �������������� ��� ���������
 	JMP	Reset 		; EEPROM ������
	JMP	Reset            	; ���������� ����������
	JMP	Reset		; ���������� �� ������ TWI
	JMP	Reset 		; ������� ���������� 2
	RJMP	MatchT0  		; ���������� �������/�������� �0
	NOP
	JMP	Reset		; ���������� SPM
;_______________________________________________________________________________________


Data_0:	.DB $04,$03,$09,$04
Data_1:	.DB $12,$03,'o',$00,'b',$00,'d',$00,'e',$00,'v',$00,'.',$00,'a',$00,'t',$00
Data_2:	.DB $16,$03,'P',$00,'r',$00,'o',$00,'g',$00,'r',$00,'a',$00,'m',$00,'m',$00,'e',$00,'r',$00
Data_3:	.DB $14,$03,'U',$00,'n',$00,'i',$00,'v',$00,'e',$00,'r',$00,'s',$00,'a',$00,'l',$00

Data_4:	.DB $12,$01,$10,$01,$02,$00,$00,$08,$C0,$16,$E1,$05,$00,$01,$01,$02,$03,$01
Data_5:	.DB $09,$02,$43,$00,$02,$01,$00,$80,$64,	/*Configuration*/\
	    $09,$04,$00,$00,$01,$02,$02,$01,$00,	/*Configuration*/\
	    $05,$24,$00,$10,$01,		/*CDC Header Functional*/\
	    $04,$24,$02,$02,			/*CDC Abstract Control Management Functional*/\
	    $05,$24,$06,$00,$01,		/*CDC Union Functional*/\
	    $05,$24,$01,$03,$01,		/*Interface*/\
	    $07,$05,$83,$03,$08,$00,$01,		/*In-Endpoint*/\
	    $09,$04,$01,$00,$02,$0A,$00,$00,$00,	/*Configuration*/\
	    $07,$05,$01,$02,$08,$00,$00,		/*Endpoint-Out*/\
	    $07,$05,$81,$02,$08,$00,$00,$00		/*Endpoint-In*/\

Data_6:	.DB $08,'S','T','K','5','0','0','_','2',$00

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
	ADIW	R27:R26,16
Start_2:	LPM	R0,Z+
	ST	X+,R0
	CPI	R26,$80
	BRNE	Start_2
	; ������������� ������ �����/������
	LDI	R16,$FF
	LDI	R17,$F3
	LDI	R18,$B3
	OUT	PORTD,R18
	OUT	DDRD,R17
	OUT	PORTA,R16
	OUT	DDRA,R1
	OUT	PORTB,R16
	OUT	DDRB,R1
	OUT	PORTC,R16
	OUT	DDRC,R1
	LDI	R16,$64
	LDI	R20,$B8
	LDI	R21,$0B
	SBI	DDRD,3
	; ����� ������������� 100 ��
Start_3:	MOVW	R25:R24,R21:R20
Start_4:	SBIW	R25:R24,1
	BRNE	Start_4
	SUBI	R16,1
	BRNE	Start_3
	CBI	DDRD,3
	; ������������� ������� T0 
	LDI	R17,$BB
	OUT	OCR0,R17		; �������� ��������� �������/�������� �0
	LDI	R18,$0B
	OUT	TCCR0,R18
	LDI	R19,$02
	OUT	TIMSK,R19
	LDI	R24,3
	OUT	MCUCR,R24
	LDI	R24,$40
	OUT	GICR,R24
	LDI	R24,$4B
	LDI	R25,$5A
	STS	Buffer_2E3,R24
	STS	Buffer_30E,R24
	STS	Buffer_2E2,R25
	STS	Buffer_30D,R25
	SEI			;��������� ���������� ����������

;M0:	RCALL	Basic_2
;	RJMP	M0
;_______________________________________________________________________________________

Basic:	CLR	R1
	RCALL	In_Out_USB		;���� �� USB � ����� �� ������� Setup
	LDS	R24,Buffer_067	;������ ����� ������ �� �� - $55
	CPI	R24,$55
	BRNE	Basic_2
	STS	Buffer_067,R1	;�������� ������ ����� ������ �� �� - $00
	LDI	R28,$02
	LDI	R29,$00
	LDS	R24,Code_In		;��� ������� �� �� 
	STS	Code_Out,R24	;��� ����������� �������
	STS	Spool_Out,R1	;������ ���� ������ ������������� �� ������� ��
	SUBI	R24,1
	CPI	R24,$3C
	BRCS	Basic_1
	RCALL	Answer		;����� �� �� ������� - ������� �� ��������������
	RJMP	Basic_2
Basic_1:	LDI	R30,LOW(Table)
	LDI	R31,HIGH(Table)	;R31-R30 + ������ ������� �������� ���������
	ADD	R30,R24
	ADC	R31,R1
	ICALL

Basic_2:	LDS	R24,Buffer_2E2
	SBRS	R24,4
	RJMP	Basic
	LDI	R26,LOW(Buffer_2E4)
	LDI	R27,HIGH(Buffer_2E4)	;R27-R26 = $02E4
	CLR	R23
	LDS	R24,Counter_K
	LDS	R25,Counter_K+1	;����� ���������� ������������ ���� �� USB
Basic_3:	SBIW	R25:R24,0
	BREQ	Basic_5
	LDS	R30,Counter_N
	LDS	R31,Counter_N+1	;������� ������������ ���� �� USB
	ADIW	R30:R31,1
	STS	Counter_N,R30
	STS	Counter_N+1,R31	;������� ������������ ���� �� USB
	CP	R30,R24
	CPC	R31,R25
	BRCS	Basic_4
	CLR	R24
	CLR	R25
	STS	Counter_N,R24
	STS	Counter_N+1,R25	;������� ������������ ���� �� USB
	STS	Counter_K,R24
	STS	Counter_K+1,R25	;����� ���������� ������������ ���� �� USB
Basic_4:	SUBI	R30,$51
	SBCI	R31,$FE		;R31-R30 - (R31-R30 + $01AF)
	LD	R17,Z
	ST	X+,R17
	INC	R23
	CPI	R23,$08
	BRNE	Basic_3
Basic_5:	LDS	R22,Buffer_069	;$00 ��� ���������� ������������ ���� �� $08
	OR	R22,R23
	BREQ	Basic_7
Basic_6:	STS	Buffer_069,R23	;$00 ��� ���������� ������������ ���� �� $08
	LDI	R26,LOW(Buffer_2E2)
	LDI	R27,HIGH(Buffer_2E2)	;NAK = $5A ��� ���������� ������������ ���� �� $0C
	MOV	R22,R23		;���������� ������������ ����
	SUBI	R23,$FC		;R23 + 4
	ST	X+,R23		;���������� ������������ ���� + 4
	LD	R24,X
	LDI	R25,$88
	EOR	R24,R25
	ST	X+,R24
	RCALL	CRC16		;������� ����������� ����� CRC16
Basic_7:	RJMP	Basic

;___________ ���� �� USB � ����� �� ������� Setup _____________________________________

In_Out_USB:	LDS	R22,Buffer_2F3
	SUBI	R22,3
	SBRC	R22,7		;������� ����� 3� ���� ?
	RJMP	Out_USB_5
	LDS	R24,Buffer_2F0
	LDI	R30,LOW(Buffer_303)
	LDI	R31,HIGH(Buffer_303)
	SUB	R30,R24
	SBC	R31,R1		;R31-R30 = $0303 - R24 
	LDS	R24,Buffer_2EF
	CPI	R24,$10
	BRCC	Out_USB
	MOV	R17,R22
USB_In:	LD	R18,Z+
	RCALL	USB_Data		;�������� ������� �� ��������� � ���� ������
	SUBI	R17,1
	BRNE	USB_In
USB_In_1:	RJMP	Out_USB_4

Out_USB:	LDI	R28,LOW(Buffer_2D8)
	LDI	R29,HIGH(Buffer_2D8)	;R29-R28 = $02D8
	CPI	R24,$2D
	BREQ	Out_USB_1
	LDS	R24,Buffer_068	;$00,$40,$80
	SBRS	R24,7
	RJMP	Out_USB_4
	RJMP	Out_USB_2
Out_USB_1:	CPI	R22,$08		;������ ������ Setup ?
	BRNE	USB_In_1

;___________ ����� �� ������� Setup ____________________________________________________

Setup:	LDI	R24,$C3
	STS	Buffer_2D7,R24	;����� Data0 = $C3
	LDI	R25,$5A
	STS	Buffer_060,R25	;NAK = $5A ��� ���������� ������������ ���� �� $0C
	STS	Buffer_068,R1	;$00,$40,$80
	LDD	R25,Z+0
	LDD	R24,Z+1
	LDD	R23,Z+2
	LDD	R22,Z+3
	LDD	R21,Z+6
	LDD	R20,Z+7
	MOV	R17,R25
	ANDI	R25,$60
	BREQ	Setup_2
	CLR	R18
	CPI	R25,$20
	BRNE	Setup_1
	LDS	R19,Buffer_2D6
	TST	R19
	BRNE	Setup_1
	CPI	R24,$22
	BRCC	Setup_1
	STS	Buffer_2D5,R1
	SER	R18
	SBRC	R17,7
	MOV	R18,R21
	LDI	R19,$80
	STS	Buffer_068,R19	;$00,$40,$80
	RJMP	Setup_19
Setup_1:	RJMP	Setup_18

Setup_2:	TST	R24
	BRNE	Setup_3
	LDI	R18,$02
	RJMP	Setup_16

Setup_3:	CPI	R24,$05
	BRNE	Setup_4
	STS	Buffer_2F4,R23	;����������� ����� �� ���� USB
	RJMP	Setup_15

Setup_4:	CPI	R24,$06
	BRNE	Setup_6
	CPI	R22,1
	BRNE	Setup_5
	LDI	R24,LOW(Data_4*2)
	LDI	R25,HIGH(Data_4*2)	;Device Descriptor
	LDI	R18,$12
	RJMP	Setup_13

Setup_5:	CPI	R22,$02
	BRNE	Setup_9
	LDI	R24,LOW(Data_5*2)
	LDI	R25,HIGH(Data_5*2)	;Configuration
	LDI	R18,$43
	RJMP	Setup_13

Setup_6:	LDI	R18,$01
	CPI	R24,$08
	BRNE	Setup_7
	LDI	R24,LOW(Buffer_2F6)
	LDI	R25,HIGH(Buffer_2F6)	;R25-R24 = $02F6
	RJMP	Setup_17

Setup_7:	CPI	R24,$09
	BRNE	Setup_8
	RJMP	Setup_15

Setup_8:	CPI	R24,$0A
	BRNE	Setup_14
	RJMP	Setup_16

Setup_9:	CLR	R18
	CPI	R22,$03
	BRNE	Setup_13
	TST	R23
	BRNE	Setup_10
	LDI	R24,LOW(Data_0*2)
	LDI	R25,HIGH(Data_0*2)	;Get Descriptor(String)
	LDI	R18,$04
	RJMP	Setup_13

Setup_10:	CPI	R24,$01
	BRNE	Setup_11
	LDI	R24,LOW(Data_1*2)
	LDI	R25,HIGH(Data_1*2)	;obdev.at
	LDI	R18,$12
	RJMP	Setup_13

Setup_11:	CPI	R24,$02
	BRNE	Setup_12
	LDI	R24,LOW(Data_2*2)
	LDI	R25,HIGH(Data_2*2)	;Programmer
	LDI	R18,$16
	RJMP	Setup_13

Setup_12:	CPI	R24,$03
	BRNE	Setup_13
	LDI	R24,LOW(Data_3*2)
	LDI	R25,HIGH(Data_3*2)	;Universal
	LDI	R18,$14
Setup_13:	LDI	R26,$40
	STS	Buffer_068,R26	;$00,$40,$80
	RJMP	Setup_17

Setup_14:	CPI	R24,$0B
	BRNE	Setup_15
	LDI	R24,$4B
	STS	Buffer_2E3,R24
	STS	Buffer_30E,R24
Setup_15:	CLR	R18
Setup_16:	LDI	R24,LOW(Buffer_2E0)
	LDI	R25,HIGH(Buffer_2E0)	;R25-R24 = $02E0
Setup_17:	STS	Buffer_2F2,R25
	STS	Buffer_2F1,R24
Setup_18:	TST	R20
	BRNE	Setup_19
	CP	R21,R18
	BRCS	Setup_20
Setup_19:	MOV	R21,R18
Setup_20:	STS	Buffer_061,R21	;$00,$FF
	RJMP	Out_USB_4

;___________ ����� �� ������� Setup � ���� �� USB _____________________________________

Out_USB_2:	LDS	R24,Buffer_2D5
	STS	Buffer_061,R1	;$00,$FF
	TST	R24
	BRNE	Out_USB_4
	MOVW	R27:R26,R29:R28	;R27-R26 = $02D8
	LDI	R24,$07
Out_USB_3:	LD	R25,Z+
	ST	X+,R25
	SUBI	R24,1
	BRNE	Out_USB_3
Out_USB_4:	STS	Buffer_2F3,R1
Out_USB_5:	LDS	R24,Buffer_060	;NAK = $5A ��� ���������� ������������ ���� �� $0C
	SBRS	R24,4
	RJMP	Out_USB_13
	LDS	R24,Buffer_061	;$00,$FF
	CPI	R24,$FF
	BRNE	Out_USB_6
	RJMP	Out_USB_13

Out_USB_6:	MOV	R17,R24
	CPI	R24,$09
	BRCS	Out_USB_7
	LDI	R17,$08
Out_USB_7:	MOVW	R27:R26,R29:R28	;R27-R26 = $02D8
	SUB	R24,R17
	STS	Buffer_061,R24	;$00,$FF
	TST	R17
	BREQ	Out_USB_11
	LDS	R24,Buffer_068	;$00,$40,$80
	SBRS	R24,7
	RJMP	Out_USB_8
	LDI	R17,$07
	LDS	R24,Buffer_2D5
	TST	R24
	BREQ	Out_USB_11
	CLR	R17
	RJMP	Out_USB_11

Out_USB_8:	LDS	R18,Buffer_2F1
	LDS	R19,Buffer_2F2
	MOVW	R31:R30,R19:R18
	ADD	R18,R17
	ADC	R19,R1
	STS	Buffer_2F1,R18
	STS	Buffer_2F2,R19
	MOV	R25,R17
	SBRS	R24,6
	RJMP	Out_USB_10
Out_USB_9:	LPM	R24,Z+
	ST	X+,R24
	SUBI	R25,1
	BRNE	Out_USB_9
	RJMP	Out_USB_11

Out_USB_10:	LD	R24,Z+
	ST	X+,R24
	SUBI	R25,1
	BRNE	Out_USB_10
Out_USB_11:	MOVW	R27:R26,R29:R28	;R27-R26 = $02D8
	LDS	R24,Buffer_2D7
	LDI	R25,$88
	EOR	R24,R25
	STS	Buffer_2D7,R24	;����� Data0 = $C3 ��� Data1 = $4B
	MOV	R22,R17		;���������� ������������ ����
	RCALL	CRC16		;������� ����������� ����� CRC16
	SUBI	R17,$FC		;���������� ������������ ���� + 4
	CPI	R17,$0C
	BREQ	Out_USB_12
	SER	R24
	STS	Buffer_061,R24	;$00,$FF
Out_USB_12:	STS	Buffer_060,R17	;NAK = $5A ��� ���������� ������������ ���� �� $0C
Out_USB_13:	LDI	R25,$14
Out_USB_14:	IN	R24,PIND
	ANDI	R24,$0C
	BRNE	Out_USB_15
	SUBI	R25,1
	BRNE	Out_USB_14
	STS	Buffer_2F4,R1	;����������� ����� �� ���� USB
	STS	Buffer_2EE,R1	;����������� ����� �� ���� USB
Out_USB_15:	RETI

;___________ ������� ����������� ����� CRC16 ������� $A001 _____________________________

CRC16:	CLR	R24
	CLR	R25
	LDI	R20,$01
	LDI	R21,$A0
	COM	R22		;R22 ���������� ���� ������
CRC16_1:	SUBI	R22,$FF		;R22 + 1
	BRCC	CRC16_3
	LD	R18,X+
	LDI	R19,$F8
	EOR	R24,R18
CRC16_2:	ROR	R25
	ROR	R24
	BRCS	loc_215
	EOR	R24,R20
	EOR	R25,R21
loc_215:	SUBI	R19,$FF
	BRCS	CRC16_2
	RJMP	CRC16_1
CRC16_3:	ST	X+,R24
	ST	X+,R25		;R25-R24 ����������� ����� CRC16
	RET

;___________ �������� ������� �� ���������  � ���� ������ ______________________________

USB_Data:	TST	R11		;������� ������� �0 - 63 �� * R11
	BRNE	USB_Data_1
	STS	Buffer_080,R1
	STS	Buffer_081,R1
USB_Data_1:	LDS	R28,Buffer_080	;���������� �������� ���� ������ ��. ����
	LDS	R29,Buffer_081	;���������� �������� ���� ������ ��. ����
	SBIW	R29:R28,0
	BRNE	USB_Data_2
	CPI	R18,$1B		;��� ������ ��������� $1B
	BRNE	USB_Data_4
	STS	Preamble_I,R18
	LDI	R28,$01
	LDI	R29,$00
	STS	Buffer_080,R28	;���������� �������� ���� ������ ��. ����
	STS	Buffer_081,R29	;���������� �������� ���� ������ ��. ����
	RJMP	USB_Data_4

USB_Data_2:	LDI	R19,$01
	CPI	R28,$19
	CPC	R29,R19
	BRCC	USB_Data_3
	SUBI	R28,$6E
	SBCI	R29,$FF		;R29-R28 = R31-R30 + (Preamble_I = $0092)
	STD	Y+0,R18
	SUBI	R28,$92
	SBCI	R29,$00		;R29-R28 = R31-R30 - (Preamble_I = $0092)
	ADIW	R29:R28,1
	STS	Buffer_080,R28	;���������� �������� ���� ������ ��. ����
	STS	Buffer_081,R29	;���������� �������� ���� ������ ��. ����
	CPI	R28,$05
	CPC	R29,R1
	BRCS	USB_Data_4
	BRNE	USB_Data_5
	CPI	R18,$0E		;��� ��������� ��������� $0E
	BRNE	USB_Data_3
	LDS	R28,Amount_Il	;���������� ����������� ���� ������ ��. ���� �� ��
	LDS	R29,Amount_Ih	;���������� ����������� ���� ������ ��. ���� �� ��
	ADIW	R29:R28,6
	STS	Buffer_082,R28
	STS	Buffer_083,R29	;����� ���������� ����������� ���� ������
	SUBI	R28,$1A
	SBCI	R29,1
	BRCS	USB_Data_4
USB_Data_3:	STS	Buffer_080,R1	;���������� �������� ���� ������ ��. ����
	STS	Buffer_081,R1	;���������� �������� ���� ������ ��. ����
USB_Data_4:	LDI	R24,$C8
	MOV	R11,R24		;������� ������� �0 - 63 �� * R11
	RET

USB_Data_5:	LDS	R24,Buffer_082
	LDS	R25,Buffer_083	;����� ���������� ����������� ���� ������
	CP	R28,R24
	CPC	R29,R25
	BRNE	USB_Data_4
	; ������ ����� ������ �� ��
	CLR	R25
	LDI	R26,LOW(Preamble_I)
	LDI	R27,HIGH(Preamble_I)	;R27-R26 = Preamble_I
	SBIW	R29:R28,0
	BREQ	USB_Data_7
USB_Data_6:	LD	R24,X+
	EOR	R25,R24
	SBIW	R29:R28,1
	BRNE	USB_Data_6
	TST	R25
	BREQ	USB_Data_7
	; ������ ����� ������ �� �� � �������
	LDI	R24,$B0
	STS	Code_Out,R24	;��� ����������� �������
	RCALL	Answer_1		;����� ��
	RJMP	USB_Data_4
	; ������ ����� ������ �� �� ��� ������
USB_Data_7:	LDI	R24,$55
	STS	Buffer_067,R24	;������ ����� ������ �� �� - $55
	RJMP	USB_Data_3

;___________ ����� ������������� �� ������� ____________________________________________

Answer:	LDI	R24,$C0
Answer_1:	LDI	R28,$02
	LDI	R29,$00
Answer_2:	STS	Spool_Out,R24	;������ ���� ������ ������������� �� ������� ��
Answer_3:	LDI	R18,$1B
	LDI	R30,LOW(Preamble_O)
	LDI	R31,HIGH(Preamble_O)	;����� - ��� ��������� $1B
	STD	Z+0,R18		;��� ������ ��������� $1B
	LDS	R18,Number_I	;���������� ����� ������� � �������� ��������� �� USB
	STD	Z+1,R18		;���������� ����� ������� � �������� ��������� �� USB 
	STD	Z+2,R29		;���������� ������������ ���� ������ ��. ����
	STD	Z+3,R28		;���������� ������������ ���� ������ ��. ����
	LDI	R18,$0E
	STD	Z+4,R18		;��� ��������� ��������� $0E
	ADIW	R29:R28,6
	STS	Counter_K,R28
	STS	Counter_K+1,R29	;����� ���������� ������������ ���� �� USB
	SBIW	R29:R28,1
	CLR	R25
	STS	Counter_N,R25
	STS	Counter_N+1,R25	;������� ������������ ���� �� USB
Answer_4:	LD	R24,Z+		;������� ����������� ����� ������������ ���� �� USB
	EOR	R25,R24
	SBIW	R29:R28,1
	BRNE	Answer_4
	STD	Z+0,R25
	RET
;_______________________________________________________________________________________

.INCLUDE "Interrupt.asm"
