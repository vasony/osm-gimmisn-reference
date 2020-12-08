chcp 65001
call 0config.bat
awk -f nav_gazd.awk  src\180NAP_GAZD_%DATUM%WEB.txt  >data_%DATUM%_gazd.txt
awk -f nav_magan.awk src\180NAP_MSzem_%DATUM%WEB.txt >data_%DATUM%_magan.txt
awk -f nav_hiany.awk src\%NEV%._ne_web.txt >data_%DATUM%_hiany.txt
