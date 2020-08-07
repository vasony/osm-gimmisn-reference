function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN {
  s=""; 
  FS=">"
  body=0
  line=0
}

/<body/ {
  body=1
}

/<td/ { 
  gsub(/<[^>]*>/, "");
  gsub(/\t/, " ");
  s=(s "\t" trim($1));
} 
/<tr|<TR/ { 
  if(body==1) {
    line++
    if(line>3) print ltrim(s);
    s="" 
  }
}
