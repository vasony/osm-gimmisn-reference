FOR /F "TOKENS=1,2,3 DELIMS=. " %%A IN ('date /t') DO SET datum=%%A%%B%%C
