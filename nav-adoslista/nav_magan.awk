function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN {
  sorszam=0
  adoszam=0
}

{
  if ($0 == "") {
    sorszam=sorszam+1
    if(sorszam>1) line=line "|"
  }
  else line=line $0

  if ($0 == "") {
    line=""
    sorszam=1
  }

  if ($0 == "Ssz." || $0 == "Sorszám") {
    uj=1
    line="Ssz."
    sorszam=1
  }

  if ($0 == "Adószám") {
    adoszam=1
    sorszam=0
    line=""
  }

  if((sorszam==4 && adoszam==0)||(sorszam==5 && adoszam==1)) {
     if(adoszam==0) line=line "|"
     if(uj==0) print "MAGAN|" line
     line=""
     sorszam=1
     uj=0
  }

  if($0 == "Lakcím nélküliek") {
    exit
  }

}
