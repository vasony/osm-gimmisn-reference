@call 0config.bat
conv.vbs
iconv -f utf-16le -t utf-8 tmp.txt >data_%datum%_civil.txt"
if not errorlevel 1 del tmp.txt
if not errorlevel 1 ren Regisztralt_civil_kedvezmenyezettek.xlsx Regisztralt_civil_kedvezmenyezettek-%datum%.xlsx




