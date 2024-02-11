@echo off
del cimek.txt
set end=2300
rem set end=100
FOR /L %%A IN (0,100,%end%) do (
  echo %%A
  wget "https://arveres.mbvk.hu/arverezok/ajax/server_processing_arver_notlogged2X.php?sEcho=1&iColumns=15&sColumns=&iDisplayStart=%%A&iDisplayLength=100&mDataProp_0=0&mDataProp_1=1&mDataProp_2=2&mDataProp_3=3&mDataProp_4=4&mDataProp_5=5&mDataProp_6=6&mDataProp_7=7&mDataProp_8=8&mDataProp_9=9&mDataProp_10=10&mDataProp_11=11&mDataProp_12=12&mDataProp_13=13&mDataProp_14=14&p_ingatlan=true&p_online=true&p_faziskod=normal_ingatlan_2021&g_sort_mode=feltolt&g_sort_dir=desc&k_elo=true&_=1674119100572"  -O temp.json
  jq -r ".aaData[] | [.[0], .[8], .[15]] |@tsv" temp.json >>cimek.txt
)
rem         https://arveres.mbvk.hu/arverezok/ajax/server_processing_arver_notlogged2X.php?sEcho=2&iColumns=15&sColumns=&iDisplayStart=%%A&iDisplayLength=100&mDataProp_0=0&mDataProp_1=1&mDataProp_2=2&mDataProp_3=3&mDataProp_4=4&mDataProp_5=5&mDataProp_6=6&mDataProp_7=7&mDataProp_8=8&mDataProp_9=9&mDataProp_10=10&mDataProp_11=11&mDataProp_12=12&mDataProp_13=13&mDataProp_14=14&p_ingatlan=true&p_online=true&p_faziskod=normal_ingatlan_2021&g_sort_mode=feltolt&g_sort_dir=desc&k_elo=true&_=1674118367347
