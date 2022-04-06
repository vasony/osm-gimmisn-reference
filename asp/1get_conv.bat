@echo off 
setlocal enabledelayedexpansion

for /f "tokens=1-2 delims=," %%i in (areas2.txt) do (
  set id=%%i
  set area=%%j
  echo !area!
  curl "https://!area!.asp.lgov.hu/nyilvantartasok?ajax_form=1&_wrapper_format=drupal_ajax" -H "User-Agent: -"  --data-raw "datatype=1&aktiv=1&form_id=iparker_block_form" >tmp\!area!_1.json
  curl "https://!area!.asp.lgov.hu/nyilvantartasok?ajax_form=1&_wrapper_format=drupal_ajax" -H "User-Agent: -"  --data-raw "datatype=2&aktiv=1&form_id=iparker_block_form" >tmp\!area!_2.json
  jq --raw-output ".[] | select(.command==\"openDialog\") | .data" tmp\!area!_1.json >>tmp\!area!_1.html
  jq --raw-output ".[] | select(.command==\"openDialog\") | .data" tmp\!area!_2.json >>tmp\!area!_2.html
  sed ":a;N;$^!ba;s/\n/ /g ; s/<\/TR[^>]*>/\n/Ig ; s/<tbody>/\n/Ig; s/\t/ /g" tmp\!area!_1.html | grep "<tr><td>"  | sed "s/<tr>//g ; s/<td>//g ; s/<\/td>/\t/g" >!area!.txt 
  sed ":a;N;$^!ba;s/\n/ /g ; s/<\/TR[^>]*>/\n/Ig ; s/<tbody>/\n/Ig; s/\t/ /g" tmp\!area!_2.html | grep "<tr><td>"  | sed "s/<tr>//g ; s/<td>//g ; s/<\/td>/\t/g" >>!area!.txt 
)