@echo off
cls
del tmp\*.xlsx 2>NUL
del tmp\*.html 2>NUL
del tmp\*.txt  2>NUL
echo +++ Get index +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
curl.exe "https://kir.oktatas.hu/kirpub/index"  -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" -o tmp/index.html
grep mukodo tmp\index.html | awk "{ print substr($6, 7, length($6)-7) }">tmp\mukodo.url
echo.
echo +++ Get files +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
for /f %%A in (tmp\mukodo.url) do curl.exe  %%A -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0" -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" -O
dir /b kir_mukodo_feladatellatasi_helyek_20*.* | awk "{ datum=substr($0, index($0, \"_20\")+1, 10); gsub(/_/, \"\", datum) ; print \"set datum=\" datum >\"tmp\\0autoconfig.bat\"}"
copy /b kir_mukodo_feladatellatasi_helyek_20*.xlsx 	tmp\kir_mukodo_feladatellatasi_helyek.xlsx
copy /b kir_mukodo_intezmenyek_20*.xlsx			tmp\kir_mukodo_intezmenyek.xlsx
move *.xlsx arch
echo.
echo +++ Convert +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
call tmp\0autoconfig.bat
conv.vbs
iconv -f utf-16le -t utf-8 tmp\kir_mukodo_intezmenyek.txt            >%datum%_intezmenyek.txt
iconv -f utf-16le -t utf-8 tmp\kir_mukodo_feladatellatasi_helyek.txt >%datum%_telephelyek.txt
