@echo off 
setlocal enabledelayedexpansion
set base=https://iparkerpublikalasservice.komdat.hu/api/Publikacio/Uzlet

for /f "tokens=1-3 delims=," %%i in (areas.txt) do (
 set onk=%%i
 set out=%%j
 set area=%%k

 echo !area!
 echo + get id
 wget %base%/!onk! -O tmp/!area!.id -o tmp/wget.log
 echo + get json
 set /p id=<tmp/!area!.id
 set id=!id:~1,-1!
 set url=%base%/!onk!/!id!/0/0
 set file=tmp/!area!.json
 wget -O !file! -o tmp/wget.log !url!
 sed -i "1s/.//; s/\\r\\n/\n/g; s/\\//g; $s/.$//" !file!
 echo + convert to txt
 awk -f komdat.awk -v outfile=!out! !file!
)
del tmp\sed*.
