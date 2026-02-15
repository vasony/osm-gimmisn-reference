wget --compression=gzip --no-check-certificate -O - -q "https://orlen.hu/toltoallomasaink/"  >orlen.html
grep -o "window.wpgmp.mapdata1 = \".*\";" orlen.html | grep -o  "\".*\"" | tr -d  """" | base64 -d >orlen.json
jq -r ".places[] | [.id, .content] |@tsv"  orlen.json | awk -F "<" "{print $1}" >orlen.txt
