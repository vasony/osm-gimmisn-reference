curl https://arfigyelo.gvh.hu/api/shops | jq -r ".shops[]|[(.uuid|split(\"-\")|.[0],.[1]),.uuid,.postalCode,.city,.address,.location.latitude,.location.longitude]|@tsv" >shops.tmp
gsort -t "	" -k1,1 -k2n shops.tmp >shops.tsv
