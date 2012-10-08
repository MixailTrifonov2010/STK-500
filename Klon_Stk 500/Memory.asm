
;_______________________________________________________________________________________

.DSEG
.ORG $0060

Buffer_060:	.BYTE 1	;$02
Buffer_061:	.BYTE 1	;$02
Buffer_062:	.BYTE 1	;$0A - Версия ПО программатора
Buffer_063:	.BYTE 1	;
Buffer_064:	.BYTE 1	;$32 - АЦП
Buffer_065:	.BYTE 1	;$19 - АЦП
Buffer_066:	.BYTE 1	;$01 - Выбор источника тактового сигнала таймера Т2
Buffer_067:	.BYTE 1	;$00 - Количество тактов до совпадения таймера Т2
Buffer_068:	.BYTE 1	;$01 - Скорость по SPI интефейсу (460,8 кгц)
Buffer_069:	.BYTE 1	;
Buffer_06A:	.BYTE 1	;$F2 - SN74164
Buffer_06B:	.BYTE 1	;
Buffer_06C:	.BYTE 1	;$32
Buffer_06D:	.BYTE 1	;PortB
Buffer_06E:	.BYTE 1	;
Buffer_06F:	.BYTE 1	;
Buffer_070:	.BYTE 1	;
Buffer_071:	.BYTE 1	;Общее количетво принимаемых байт данных по USART
Buffer_072:	.BYTE 1	;
Buffer_073:	.BYTE 1	;Счётчик принимаемых байт данных по USART
Buffer_074:	.BYTE 1	;
Buffer_075:	.BYTE 1	;Счётчик обработанных байт данных принятых по USART
Buffer_076:	.BYTE 1	;Количество тактовых импульсов в режиме HVSP
Buffer_077:	.BYTE 1	;
Buffer_078:	.BYTE 1	;Порядковый номер команды в принятом сообщении по USART
Buffer_079:	.BYTE 1	;Номер байта принятой преамбулы
Buffer_07A:	.BYTE 1	;Принят пакет данных ($01) по USART
Buffer_07B:	.BYTE 1	;Ошибка в принятом сообщении ($01) по USART
Buffer_07C:	.BYTE 1	;Контрольная сумма принятого сообщеня по USART 
Buffer_07D:	.BYTE 1	;Контрольная сумма отправленного сообщения по USART 
Buffer_07E:	.BYTE 1	;Счётчик записанных байт в буфер USART
Buffer_07F:	.BYTE 1	;Счётчик переданных байт по USART

.ORG $0080
	;Коды команд при паралельном программировании
Buffer_080:	.BYTE 1	;$0E (WR = RD = R/B = 1)		Y+0
Buffer_081:	.BYTE 1	;$1E (BS1 = WR = RD = R/B = 1)		Y+1
Buffer_082:	.BYTE 1	;$0F (WR = RD = R/B = BS2 = 1)		Y+2
Buffer_083:	.BYTE 1	;$1F (BS1 = WR = RD = R/B = BS2 = 1)	Y+3
Buffer_084:	.BYTE 1	;$2E (XA0 = WR = RD = R/B = 1)		Y+4
Buffer_085:	.BYTE 1	;$3E (XA0 = BS1 = WR = RD = R/B = 1)	Y+5
Buffer_086:	.BYTE 1	;$2F (XA0 = WR = RD = R/B = BS2 = 1) ?	Y+6
Buffer_087:	.BYTE 1	;$3F (XA0 = BS1 = WR = RD = R/B = BS2 = 1) ?	Y+7
Buffer_088:	.BYTE 1	;$4E (XA1 = WR = RD = R/B = 1)		Y+8
Buffer_089:	.BYTE 1	;$5E (XA1 = BS1 = WR = RD = R/B = 1)	Y+9
Buffer_08A:	.BYTE 1	;$4F (XA1 = WR = RD = R/B = BS2 = 1)	Y+10
Buffer_08B:	.BYTE 1	;$5F (XA1 = BS1 = WR = RD = R/B = BS2 = 1) ?	Y+11
Buffer_08C:	.BYTE 1	;$6E (XA1 = XA0 = WR = RD = R/B = 1)	Y+12
Buffer_08D:	.BYTE 1	;$7E (XA1 = XA0 = BS1 = WR = RD = R/B = 1)	Y+13
Buffer_08E:	.BYTE 1	;$6F (XA1 = XA0 = WR = RD = R/B = BS2 = 1)	Y+14
Buffer_08F:	.BYTE 1	;$7F (XA1 = XA0 = BS1 = WR = RD = R/B = BS2 = 1)Y+15
Buffer_090:	.BYTE 1	;$66 (XA1 = XA0 = RD = R/B = 1)		Y+16
Buffer_091:	.BYTE 1	;$76 (XA1 = XA0 = BS1 = RD = R/B = 1)	Y+17
Buffer_092:	.BYTE 1	;$67 (XA1 = XA0 = RD = R/B = BS2 = 1)	Y+18
Buffer_093:	.BYTE 1	;$77 (XA1 = XA0 = BS1 = RD = R/B = BS2 = 1)	Y+19
Buffer_094:	.BYTE 1	;$6A (XA1 = XA0 = WR = R/B = 1)		Y+20
Buffer_095:	.BYTE 1	;$7A (XA1 = XA0 = BS1 = WR = R/B = 1)	Y+21
Buffer_096:	.BYTE 1	;$6B (XA1 = XA0 = WR = R/B = BS2 = 1)	Y+22
Buffer_097:	.BYTE 1	;$7B (XA1 = XA0 = BS1 = WR = R/B = BS2 = 1)     Y+23
Buffer_098:	.BYTE 1	;$BE (PAGEL = XA0 = BS1 = WR = RD = R/B = 1)    Y+24 
Buffer_099:	.BYTE 1	;$FD (PAGEL = XA1 = XA0 = BS1 = WR = RD = BS2 = 1) Y+25
Buffer_09A:	.BYTE 1	;$00				Y+26
Buffer_09B:	.BYTE 1	;$01 (BS2 = 1)			Y+27
Buffer_09C:	.BYTE 1	;$00				Y+28
Buffer_09D:	.BYTE 1	;$00				Y+29
Buffer_09E:	.BYTE 1	;$00				Y+30
Buffer_09F:	.BYTE 1	;$00				Y+31

.ORG $00A0
Buffer_0A0:	.BYTE 4	;Текущий адрес Flash или Eeprom памяти

.ORG $00B0
Buffer_0B0:	.BYTE 80	;Буфер передаваемых данных в ПК

.ORG $0100
Buffer_100:	.BYTE 280	;Буфер принимаемых данных от ПК
;_______________________________________________________________________________________

