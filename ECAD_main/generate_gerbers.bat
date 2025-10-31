@echo off
chcp 65001 >nul

echo ========================================
echo    Gerber and Drill File Generator
echo ========================================

REM Путь к kicad-cli.exe
set KICAD_CLI="C:\Program Files\KiCad\9.0\bin\kicad-cli.exe"

REM Путь к вашему файлу проекта .kicad_prj (или .kicad_pro для старых версий)
set PROJECT_FILE="C:\Users\guzee\OneDrive\Рабочий стол\учеба\магистратура\САПР электронных средств\ECAD_main_project\ECAD_main\ECAD_main.kicad_prl"

REM Путь к файлу платы .kicad_pcb
set PCB_FILE="C:\Users\guzee\OneDrive\Рабочий стол\учеба\магистратура\САПР электронных средств\ECAD_main_project\ECAD_main\ECAD_main.kicad_pcb"

REM Папка, куда будут сохранены Gerber и Drill файлы
set OUTPUT_DIR="C:\Users\guzee\OneDrive\Рабочий стол\учеба\магистратура\САПР электронных средств\ECAD_main_project\ECAD_main\Gerbers"

REM -- КОНЕЦ НАСТРОЕК --

echo.
echo Generating Gerbers and Drill files...
echo.

REM Создаем папку для вывода, если ее нет
if not exist %OUTPUT_DIR% mkdir %OUTPUT_DIR%

REM Команда генерации Gerber файлов и файлов сверловки
%KICAD_CLI% pcb export gerbers ^
  --output %OUTPUT_DIR% ^
  --layers "F.Cu,B.Cu,F.Paste,B.Paste,F.SilkS,B.SilkS,F.Mask,B.Mask,Edge.Cuts" ^
  --no-x2 ^
  --disable-aperture-macros ^
  %PCB_FILE%

REM Команда генерации файла позиций компонентов (не Gerber, но очень полезно)
%KICAD_CLI% pcb export pos ^
  --output %OUTPUT_DIR%\pos.csv ^
  --format csv ^
  --units mm ^
  %PCB_FILE%

echo.
echo ========================================
echo            Done!
echo Files are saved to: %OUTPUT_DIR%
echo ========================================
echo.
pause