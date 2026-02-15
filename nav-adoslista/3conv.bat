chcp 65001
call 0config.bat
del /q tmp\*.*
if exist src\%NEV%.txt goto next
copy "src\%NEV%.xlsx"            tmp\data_hiany.xlsx
if errorlevel 1 exit
conv.vbs
iconv -f utf-16le -t utf-8 tmp\data_hiany.txt >"src\%NEV%.txt"
awk -f nav_hiany.awk "src\%NEV%.txt"                   >data_%DATUM%_hiany.txt
if errorlevel 1 pause
:next
awk -f nav_gazd.awk  "src\180NAP_GAZD %DATUM%WEB.txt"  >data_%DATUM%_gazd.txt
if errorlevel 1 pause
awk -f nav_magan.awk "src\180nap_ASZMSZ_EV %DATUM%WEB.txt"    >data_%DATUM%_magan.txt
if errorlevel 1 pause
