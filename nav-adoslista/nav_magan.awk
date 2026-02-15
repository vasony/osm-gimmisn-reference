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
    data[sorszam]=$0
  }
  else {
    line=line $0
    data[sorszam]=data[sorszam] $0
  }

  if ($0 == "" || $0 == "Egyéni vállalkozók") {
    line=""
    sorszam=1
  }

  if ($0 == "Ssz." || $0 == "Sorszám") {
    uj=1
    line="Ssz."
    sorszam=1
  }

#  if (sorszam==2 && length($0) < 3 && uj==0) {
#    line=line "-|"
#    sorszam=sorszam+1
#  }

#  print sorszam ">" $0


  if(sorszam==5) {
     if(uj==0) print "MAGAN|" line
     line=""
     sorszam=1
     uj=0
  }


  if($0 == "Lakcím nélküliek" || $0 == "Adószámos természetes személyek") {
    exit
  }



}
