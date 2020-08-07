set PHPSESSID=8qct067r4spl77oee5md8c5u81
set xjxr=1596318842701
set output=budapest_09.html

echo off
echo del %output% >curl_run.bat
FOR /L %%i IN (1,1,84) DO ECHO curl ^"http://kernyilvantartas.zalajaras.hu/public/^" -H ^"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:79.0) Gecko/20100101 Firefox/76.0^" -H ^"Accept: */*^" -H ^"Accept-Language: hu,en-US;q=0.7,en;q=0.3^" -H ^"If-Modified-Since: Sat, 1 Jan 2000 00:00:00 GMT^" -H ^"content-type: application/x-www-form-urlencoded^" -H ^"Origin: http://kernyilvantartas.zalajaras.hu^" -H ^"Connection: keep-alive^" -H ^"Referer: http://kernyilvantartas.zalajaras.hu/public/^" -H ^"Cookie: PHPSESSID=%PHPSESSID%^" --data-raw ^"xjxfun=lapozas^&xjxr=%xjxr%^&xjxargs[]=S%%i^" ^>^>%output% >>curl_run.bat