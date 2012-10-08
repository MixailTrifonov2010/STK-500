
;_______________________________________________________________________________________

.DSEG 
.ORG $0060

Buffer_060:	.BYTE 1	;NAK = $5A ��� ���������� ������������ ���� �� $0C
Buffer_061:	.BYTE 1	;$00,$FF
Cur_addr0:	.BYTE 1	;������� ����� Flash ��� Eeprom ������ ��. ����
Cur_addr1:	.BYTE 1	;������� ����� Flash ��� Eeprom ������ ��. ����
Cur_addr2:	.BYTE 1	;������� ����� Flash ��� Eeprom ������ ���. ����
Cur_addr3:	.BYTE 1	;��������� �� ������� ��������������� ����� ������ (��� 7)
Buffer_066:	.BYTE 1	;���������� �������� ��������� � ������ HVSP 
Buffer_067:	.BYTE 1	;������ ����� ������ �� �� - $55
Buffer_068:	.BYTE 1	;$00,$40,$80
Buffer_069:	.BYTE 1	;$00 ��� ���������� ������������ ���� �� $08
Counter_N:	.BYTE 2	;������� ������������ ���� �� USB
Counter_K:	.BYTE 2	;����� ���������� ������������ ���� �� USB

.ORG $0070
Buffer_070:	.BYTE 1	;$02
Buffer_071:	.BYTE 1	;$02
Buffer_072:	.BYTE 1	;$0A - ������ �� �������������
Buffer_073:	.BYTE 1	;$FF
Buffer_074:	.BYTE 1	;$32 - ���
Buffer_075:	.BYTE 1	;$19 - ���
Buffer_076:	.BYTE 1	;����� ��������� ��������� ������� ������� �2
Buffer_077:	.BYTE 1	;���������� ������ �� ���������� ������� �2
Buffer_078:	.BYTE 1	;�������� �� SPI ���������
Buffer_079:	.BYTE 1	;$FF
Buffer_07A:	.BYTE 1	;$F2 - 74HC597
Buffer_07B:	.BYTE 1	;$FF
Buffer_07C:	.BYTE 1	;$32
Buffer_07D:	.BYTE 1	;PortB
Buffer_07E:	.BYTE 1	;$01
Buffer_07F:	.BYTE 1	;$FF
Buffer_080:	.BYTE 1	;���������� �������� ���� ������ ��. ����
Buffer_081:	.BYTE 1	;���������� �������� ���� ������ ��. ����
Buffer_082:	.BYTE 1	;����� ���������� ����������� ���� ������ ��. ����
Buffer_083:	.BYTE 1	;����� ���������� ����������� ���� ������ ��. ����
.ORG $0092
Preamble_I:	.BYTE 1	;��� ������ ��������� $1B - ������ ���� ��������� ������ OUT �� ��
Number_I:	.BYTE 1	;���������� ����� ������� � �������� ��������� �� USB �� ��
Amount_Ih:	.BYTE 1	;���������� ����������� ���� ������ ��. ���� �� ��
Amount_Il:	.BYTE 1	;���������� ����������� ���� ������ ��. ���� �� ��
Close_P:	.BYTE 1	;��� ��������� ��������� $0E �� ��
Code_In:	.BYTE 1	;��� ����������� ������� �� �� 
Spool_Inp:	.BYTE 276	;������ ���� ������ ������������� �� ��
.ORG $01B0
Preamble_O:	.BYTE 1	;��� ������ ��������� $1B
Number_O:	.BYTE 1	;���������� ����� ������� � �������� ��������� �� USB 
Amount_Oh:	.BYTE 1	;���������� ������������ ���� ������ ��. ����
Amount_Ol:	.BYTE 1	;���������� ������������ ���� ������ ��. ����
Ending:	.BYTE 1	;��� ��������� ��������� $0E
Code_Out:	.BYTE 1	;��� ����������� �������
Spool_Out:	.BYTE 282	;������ ���� ������ ������������� �� ������� ��
.ORG $02D5
Buffer_2D5:	.BYTE 1	;
Buffer_2D6:	.BYTE 1	;
Buffer_2D7:	.BYTE 1	;����� Data0 = $C3 ��� Data1 = $4B
Buffer_2D8:	.BYTE 8	;
Buffer_2E0:	.BYTE 2	;����������� ����� ������������� ���������
Buffer_2E2:	.BYTE 1	;NAK = $5A ��� ���������� ������������ ���� �� $0C
Buffer_2E3:	.BYTE 1	;����� Data0 = $C3 ��� Data1 = $4B
Buffer_2E4:	.BYTE 8	;8 ���� ������ ������������� �� ������� ��
Buffer_2EC:	.BYTE 2	;����������� ����� ������������� ���������
Buffer_2EE:	.BYTE 1	;����������� ����� �� ���� USB
Buffer_2EF:	.BYTE 1	;������������� ��������� ������ PID ($00, $E1 ��� $2D)
Buffer_2F0:	.BYTE 1	;������� �������� ����
Buffer_2F1:	.BYTE 1	;
Buffer_2F2:	.BYTE 1	;
Buffer_2F3:	.BYTE 1	;������� �������� ���� 2 ???
Buffer_2F4:	.BYTE 1	;����������� ����� �� ���� USB
Buffer_2F5:	.BYTE 1	;$00, $E1 - ����� Output ��� $2D - ����� Setup
Buffer_2F6:	.BYTE 1	;
Buffer_2F7:	.BYTE 1	;
Buffer_2F8:	.BYTE 1	;
Buffer_2F9:	.BYTE 1	;
Buffer_2FA:	.BYTE 1	;
Buffer_2FB:	.BYTE 1	;
Buffer_2FC:	.BYTE 1	;
Buffer_2FD:	.BYTE 1	;
Buffer_2FE:	.BYTE 1	;
Buffer_2FF:	.BYTE 1	;
Buffer_300:	.BYTE 1	;
Buffer_301:	.BYTE 1	;
Buffer_302:	.BYTE 1	;
Buffer_303:	.BYTE 1	;
Buffer_304:	.BYTE 1	;
Buffer_305:	.BYTE 1	;
Buffer_306:	.BYTE 1	;
Buffer_307:	.BYTE 1	;
Buffer_308:	.BYTE 1	;
Buffer_309:	.BYTE 1	;
Buffer_30A:	.BYTE 1	;
Buffer_30B:	.BYTE 1	;
Buffer_30C:	.BYTE 1	;
Buffer_30D:	.BYTE 1	;ACK = $D2 ��� NAK = $5A
Buffer_30E:	.BYTE 1	;
Buffer_30F:	.BYTE 1	;

;_______________________________________________________________________________________

