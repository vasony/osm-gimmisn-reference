wget -O - -q "https://www.cba.hu/uzletlista/" | grep "var boltok_nyers" | sed "s/\tvar boltok_nyers = //" | sed "s/;$//"  | jq -r ".[] | [.P_ID, .P_NAME, .A_IRSZ, .A_VAROS, .A_CIM] |@tsv"   >cba.txt

    

