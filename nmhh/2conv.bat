@call 0config.bat
del *.tmp
conv.vbs
iconv -f utf-16le -t utf-8 hirkozlesi.tmp >hirkozlesi_%datum%.txt"
iconv -f utf-16le -t utf-8 postai.tmp     >postai_%datum%.txt"




