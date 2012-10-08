
;_______________________________________________________________________________________

.DSEG 
.ORG $0060

Buffer_060:	.BYTE 1	;NAK = $5A или количество передаваемых байт до $0C
Buffer_061:	.BYTE 1	;$00,$FF
Cur_addr0:	.BYTE 1	;Текущий адрес Flash или Eeprom памяти мл. байт
Cur_addr1:	.BYTE 1	;Текущий адрес Flash или Eeprom памяти ст. байт
Cur_addr2:	.BYTE 1	;Текущий адрес Flash или Eeprom памяти доп. байт
Cur_addr3:	.BYTE 1	;Указатель на наличие дополнительного байта адреса (бит 7)
Buffer_066:	.BYTE 1	;Количество тактовых импульсов в режиме HVSP 
Buffer_067:	.BYTE 1	;Принят пакет данных от ПК - $55
Buffer_068:	.BYTE 1	;$00,$40,$80
Buffer_069:	.BYTE 1	;$00 или количество передаваемых байт до $08
Counter_N:	.BYTE 2	;Счётчик отправляемых байт по USB
Counter_K:	.BYTE 2	;Общее количество отправляемых байт по USB

.ORG $0070
Buffer_070:	.BYTE 1	;$02
Buffer_071:	.BYTE 1	;$02
Buffer_072:	.BYTE 1	;$0A - Версия ПО программатора
Buffer_073:	.BYTE 1	;$FF
Buffer_074:	.BYTE 1	;$32 - АЦП
Buffer_075:	.BYTE 1	;$19 - АЦП
Buffer_076:	.BYTE 1	;Выбор источника тактового сигнала таймера Т2
Buffer_077:	.BYTE 1	;Количество тактов до совпадения таймера Т2
Buffer_078:	.BYTE 1	;Скорость по SPI интефейсу
Buffer_079:	.BYTE 1	;$FF
Buffer_07A:	.BYTE 1	;$F2 - 74HC597
Buffer_07B:	.BYTE 1	;$FF
Buffer_07C:	.BYTE 1	;$32
Buffer_07D:	.BYTE 1	;PortB
Buffer_07E:	.BYTE 1	;$01
Buffer_07F:	.BYTE 1	;$FF
Buffer_080:	.BYTE 1	;Количество принятых байт данных мл. байт
Buffer_081:	.BYTE 1	;Количество принятых байт данных ст. байт
Buffer_082:	.BYTE 1	;Общее количество принимаемых байт данных мл. байт
Buffer_083:	.BYTE 1	;Общее количество принимаемых байт данных ст. байт
.ORG $0092
Preamble_I:	.BYTE 1	;Код начала преамбулы $1B - Первый байт принятого пакета OUT от ПК
Number_I:	.BYTE 1	;Порядковый номер команды в принятом сообщении по USB от ПК
Amount_Ih:	.BYTE 1	;Количество принимаемых байт данных ст. байт от ПК
Amount_Il:	.BYTE 1	;Количество принимаемых байт данных мл. байт от ПК
Close_P:	.BYTE 1	;Код оканчания преамбулы $0E от ПК
Code_In:	.BYTE 1	;Код исполняемой команды от ПК 
Spool_Inp:	.BYTE 276	;Первый байт данных программатору от ПК
.ORG $01B0
Preamble_O:	.BYTE 1	;Код начала преамбулы $1B
Number_O:	.BYTE 1	;Порядковый номер команды в принятом сообщении по USB 
Amount_Oh:	.BYTE 1	;Количество передаваемых байт данных ст. байт
Amount_Ol:	.BYTE 1	;Количество передаваемых байт данных мл. байт
Ending:	.BYTE 1	;Код оканчания преамбулы $0E
Code_Out:	.BYTE 1	;Код выполненной команды
Spool_Out:	.BYTE 282	;Первый байт ответа программатора на команду ПК
.ORG $02D5
Buffer_2D5:	.BYTE 1	;
Buffer_2D6:	.BYTE 1	;
Buffer_2D7:	.BYTE 1	;Пакет Data0 = $C3 или Data1 = $4B
Buffer_2D8:	.BYTE 8	;
Buffer_2E0:	.BYTE 2	;Контрольная сумма передаваемого сообщения
Buffer_2E2:	.BYTE 1	;NAK = $5A или количество передаваемых байт до $0C
Buffer_2E3:	.BYTE 1	;Пакет Data0 = $C3 или Data1 = $4B
Buffer_2E4:	.BYTE 8	;8 байт ответа программатора не команду ПК
Buffer_2EC:	.BYTE 2	;Контрольная сумма передаваемого сообщения
Buffer_2EE:	.BYTE 1	;Собственный адрес на шине USB
Buffer_2EF:	.BYTE 1	;Идентификатор принятого пакета PID ($00, $E1 или $2D)
Buffer_2F0:	.BYTE 1	;Счётчик принятых байт
Buffer_2F1:	.BYTE 1	;
Buffer_2F2:	.BYTE 1	;
Buffer_2F3:	.BYTE 1	;Счётчик принятых байт 2 ???
Buffer_2F4:	.BYTE 1	;Собственный адрес на шине USB
Buffer_2F5:	.BYTE 1	;$00, $E1 - токен Output или $2D - пакет Setup
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
Buffer_30D:	.BYTE 1	;ACK = $D2 или NAK = $5A
Buffer_30E:	.BYTE 1	;
Buffer_30F:	.BYTE 1	;

;_______________________________________________________________________________________

