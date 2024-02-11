@call 0config.bat
sed "s/<br>/|/g" %datum%.html | awk -f conv_table.awk >%datum%.txt



