chcp 65001
set sta=2024-02-06
set end=2024-02-10
set json=temp-%END%.json
set arc=etdr_%end:~0,4%%end:~5,2%%end:~8,2%

echo "https://www.etdr.gov.hu/api/public/generalinformations?startDate=%sta%&endDate=%end%" >url.txt
wget "https://www.etdr.gov.hu/api/public/generalinformations?startDate=%sta%&endDate=%end%" -O %json%
jq -r ".[] | [.TeljesCim, .HelyrajziSzam, .EpitesiTevekenyseg, .EljarasTipusa, .AlapkerelemBenyujtasanakDatuma] | @tsv" %json% | awk -F "\t" "{ print $1 FS $2 FS $3 FS $4 FS substr($5,1,10) }"  >%arc%.txt
