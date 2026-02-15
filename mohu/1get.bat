set TEMPFILE=mohu.json
set OUTFILE=mohu.txt
rem curl --header "Content-Type: application/json" --request POST --data "{""radiusKm"":0,""wastePointTypes"":[],""wasteCategories"":[],""hideDrsPoints"":false}"  https://map.mohu.hu/api/Map/GetSearchFilterData | jq >%TEMPFILE%
curl --header "Content-Type: application/json" --request POST --data "{""radiusKm"":0,""wastePointTypes"":[],""wasteCategories"":[],""hideDrsPoints"":false}"  https://map.mohu.hu/api/Map/SearchPoisGeneralData | jq >%TEMPFILE%
jq -r ".[] | [.id, .type, .subTypes[0], .name, .address] |@tsv" %TEMPFILE%  >%OUTFILE%
