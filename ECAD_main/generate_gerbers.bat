@echo off
chcp 65001 >nul

echo ========================================
echo    Gerber and Drill File Generator
echo ========================================

set KICAD_CLI="C:\Program Files\KiCad\9.0\bin\kicad-cli.exe"

set PROJECT_FILE="C:\Users\guzee\OneDrive\Рабочий стол\учеба\магистратура\САПР электронных средств\ECAD_main_project\ECAD_main\ECAD_main.kicad_prl"

set PCB_FILE="C:\Users\guzee\OneDrive\Рабочий стол\учеба\магистратура\САПР электронных средств\ECAD_main_project\ECAD_main\ECAD_main.kicad_pcb"

set OUTPUT_DIR="C:\Users\guzee\OneDrive\Рабочий стол\учеба\магистратура\САПР электронных средств\ECAD_main_project\ECAD_main\Gerbers"

echo.
echo Generating Gerbers and Drill files...
echo.

%KICAD_CLI% pcb export gerbers ^
  --output %OUTPUT_DIR% ^
  --layers "F.Cu,B.Cu,F.Paste,B.Paste,F.SilkS,B.SilkS,F.Mask,B.Mask,Edge.Cuts" ^
  --no-x2 ^
  --disable-aperture-macros ^
  %PCB_FILE%

echo.
echo ========================================
echo            Done!
echo Files are saved to: %OUTPUT_DIR%
echo ========================================
echo.
pause