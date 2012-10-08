@ECHO OFF
"C:\Program Files\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\Klon_Stk 500\labels.tmp" -fI -W+ie -C V2E -o "C:\Klon_Stk 500\Klon_STK500.hex" -d "C:\Klon_Stk 500\Klon_STK500.obj" -e "C:\Klon_Stk 500\Klon_STK500.eep" -m "C:\Klon_Stk 500\Klon_STK500.map" "C:\Klon_Stk 500\Klon_STK500.asm"
