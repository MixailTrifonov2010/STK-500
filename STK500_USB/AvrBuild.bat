@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\STK500_USB\labels.tmp" -fI -W+ie -C V2E -o "C:\STK500_USB\STK500_USB.hex" -d "C:\STK500_USB\STK500_USB.obj" -e "C:\STK500_USB\STK500_USB.eep" -m "C:\STK500_USB\STK500_USB.map" "C:\STK500_USB\STK500_USB.asm"
