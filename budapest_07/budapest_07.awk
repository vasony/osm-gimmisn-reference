function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN {
  outfile="01070.txt"
  sorszam=0
}
{
  line=line+1
  if(index($0,"Nyilvántartásba vétel száma") > 0) {
     line=0 ;
     sorszam=sorszam+1
     print output >outfile
     output=sorszam "|";
  }
  if(line==1) {
    if(index($2,"-") > 0) output=output $1 "|" substr($2,0,10) "|" substr($2,12,10)
    else output=output $1 "|" substr($2,0,10) "|"
  }
  if((line==3||line==4)  && index($0,"Név:") > 0) output=output "|" trim(substr($0,index($0,":")+1))
  if((line==4||line==5)  && index($0,"Cím,") > 0) output=output "|" trim(substr($0,index($0,":")+1))
  if((line==5||line==6)  && index($0,"Cégjegyzékszám") > 0) output=output "|" trim(substr($0,index($0,":")+1))
  if((line==9||line==10)  && index($0,"Név:") > 0) {
    pos=index($0,"Nyitvatartás");
    pos2=index($0,":")
    if(pos==0) pos=length($0);
    output=output "|" trim(substr($0,pos2+1,pos-pos2-1));
  }

  if((line==10||line==11)  && index($0,"Cím:") > 0) {
    pos=index($0,"Hétfo");
    pos2=index($0,":")
    if(pos==0) pos=length($0);
    output=output "|" trim(substr($0,pos2+1,pos-pos2-1));
  }
}

END {
  print output >outfile;
}