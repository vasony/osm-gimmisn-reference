function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN {
  n=0
  FS=">"
}

/A mintavétel pontos címe/{
   i=index($0, "innerHTML")
   if(i>0) {
      j=index($0, "A mintavétel pontos címe")
      line=substr($0, j+27)
      gsub(/<\/strong>/,"",line)
      gsub(/<br \/>/,"",line)
      gsub(/&nbsp;/," ",line)
      line=ltrim(line)
      if(line ~ /^[1-9][0-9]{3}/) {
        line=substr(line, 1, index(line, "<")-1)
        print ++n "|" line
     }
   }
}
