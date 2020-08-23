chcp 65001
del szigetmonostor_??.t*
conv.vbs
iconv -f utf-16le -t utf-8 szigetmonostor_01.tmp > szigetmonostor_01.txt
if errorlevel 1 pause
rem sed "s/Nyitva tartás mód: 2011.06.27., 2012.02.24./2012.02.24./g" szigetmonostor_01.txt >szigetmonostor_01.txt.new
rem copy szigetmonostor_01.tmp szigetmonostor_01.txt
iconv -f utf-16le -t utf-8 szigetmonostor_02.tmp > szigetmonostor_02.txt
if not errorlevel 1 del *.tmp