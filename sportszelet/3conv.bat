chcp 65001
FOR /F "TOKENS=1,2,3 DELIMS=. " %%A IN ('date /t') DO SET DATUM=%%A%%B%%C
awk -f sportszelet.awk  stores.json  >data_%DATUM%_sportszelet.txt
