# 
wget -O budapest_08.json https://iparkerpublikalasservice.komdat.hu/api/Publikacio/Uzlet/167e1e18-65a1-4c87-8ecb-33afe0e654b5/a3597849-e8ea-4ea1-a463-9fdd22b485ca/0/0
sed -i "1s/.//; s/\\r\\n/\n/g; s/\\//g; $s/.$//" budapest_08.json
wget -O budapest_20.json https://iparkerpublikalasservice.komdat.hu/api/Publikacio/Uzlet/83BE8C4C-DFAB-45C6-B922-6126741A3C57/e84c585a-a43a-4a3d-a4ee-1ea2eb1c0cb7/0/0
sed -i "1s/.//; s/\\r\\n/\n/g; s/\\//g; $s/.$//" budapest_20.json
del sed*.
