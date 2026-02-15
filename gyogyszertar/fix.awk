function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN {
  i=0
  FS=";"
  line=""
}

{
   if($1=="\"közforgalmú gyógyszertárak\"") {
     line=$0
     gsub(/";"/, "\t", line)
     gsub(/";;"/, "\t.\t", line)
     gsub(/"/, "", line)
     gsub(/&quot;/, "", line)

     print line
   }
   
}
