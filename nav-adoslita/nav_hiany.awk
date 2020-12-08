function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN {
  FS = "\t"
  sorszam=0
  adoszam=0
}

(NR>3){
	print "HIANY|" $1 "|" $2 "|" $4 "|" $3
}
