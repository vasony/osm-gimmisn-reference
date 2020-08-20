function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN {
  outfile=telepules ".txt"
  head=telepules "_fejlec.txt"
  sorszam=0
  first=1
  sep="\t"
}

{
  if(index($0,"clear: both") > 0) {
     if(fejlec==0 && first==0)   print output >outfile;
     if(fejlec==1 && sorszam==1) print output >head;
     first=0
     mezo=0
     if(fejlec==0) sorszam=sorszam+1
     output=sorszam+seed sep
     fejlec=0
  }

  if(sorszam>0) {
    if(index($0, "<div") == 0 ) {
      if(index($0, "</div") > 0) {
        gsub(sep, " ", line);
        gsub("\n", "", line);
        gsub("\r", " ", line);
        output=output ltrim(line) sep;
        line=""
      }
      else {
        mezo=mezo+1
        line=line " " ltrim($0);
        if(mezo==1 && ltrim(line)=="Kereskedelmi hatóság") fejlec=1
      }
    }
  }
}

END {
  print output >outfile;
  print sorszam
}