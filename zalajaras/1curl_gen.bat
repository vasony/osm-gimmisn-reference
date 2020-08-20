set PHPSESSID=8qct067r4spl77oee5md8c5u81
set xjxr=1596318842701
set telepules=budapest_09
set page=84

echo off
echo del temp\%telepules%.html >2curl_run.bat
FOR /L %%i IN (1,1,%page%) DO ECHO curl ^"http://kernyilvantartas.zalajaras.hu/public/^" -H ^"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:79.0) Gecko/20100101 Firefox/76.0^" -H ^"Accept: */*^" -H ^"Accept-Language: hu,en-US;q=0.7,en;q=0.3^" -H ^"If-Modified-Since: Sat, 1 Jan 2000 00:00:00 GMT^" -H ^"content-type: application/x-www-form-urlencoded^" -H ^"Origin: http://kernyilvantartas.zalajaras.hu^" -H ^"Connection: keep-alive^" -H ^"Referer: http://kernyilvantartas.zalajaras.hu/public/^" -H ^"Cookie: PHPSESSID=%PHPSESSID%^" --data-raw ^"xjxfun=lapozas^&xjxr=%xjxr%^&xjxargs[]=S%%i^" ^>^>temp\%telepules%.html >>2curl_run.bat

echo chcp 1250                                                                  >3conv.bat
echo awk -v seed=8400 -v telepules=%telepules% -f kernyilv.awk %telepules%.html >>3conv.bat
