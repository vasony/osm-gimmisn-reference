function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN {
  n=0
  i=0
  j=0
  FS=">"
}

{
   if(index($0, "<table") > 0 && n == 0) n=1

   if(index($0, "<tr>" ) > 0 && i > 0) {
      if(j++>1) print  line
      line=""
   }
   if(index($0, "<tr>" ) > 0) i=0

   if(n == 1) {
     if(index($0, "<td") > 0 ) {
       gsub("&aacute;", "á")
       gsub("&eacute;", "é")
       gsub("&iacute;", "í")
       gsub("&oacute;", "ó")
       gsub("&uacute;", "ú")
       gsub("&ouml;", "ö")
       gsub("&uuml;", "ü")
       gsub("&#337;", "ő")
       gsub("&#369;", "ű")

       gsub("&Aacute;", "Á")
       gsub("&Eacute;", "É")
       gsub("&Iacute;", "Í")
       gsub("&Oacute;", "Ó")
       gsub("&Uacute;", "Ú")
       gsub("&Ouml;", "Ö")
       gsub("&Uuml;", "Ü")
       gsub("&#336;", "Ő")
       gsub("&#369;", "ű")

       i++
       field=$2
       k=index(field, "<")
       if(k > 0) field=trim(substr(field,1,k-1))
       if(i==1) line = field
       else line = line "\t" field
     }
   }
}
END {
  print line

}
