function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN {
  sorszam=0
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

  if ($0 == "Ssz.") {
    uj=1
    line="Ssz."
    sorszam=1
  }


  if(sorszam==5) {
     if(uj==0) print "GAZD|" line
     line=""
     sorszam=1
     uj=0
  }

}
