function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s)  { return rtrim(ltrim(s)); }

BEGIN {
  sorszam=0
  FS=","
}

/{/{
  zip=""
  city=""
  addr=""
  name=""
  brand=""
  gsub(/"/, "")

  i1=index($0, "city:")
  i2=index($0, "zip:")
  i3=index($0, "type:")
  i4=index($0, "name:")
  i5=index($0, "address:")
  i6=index($0, "active:")

  city= substr($0, i1, i2-i1-1)
  zip=  substr($0, i2, i3-i2-1)
  brand=substr($0, i3, i4-i3-1)
  name= substr($0, i4, i5-i4-1)
  addr= substr($0, i5, i6-i5-2)

  gsub(/zip:/,"", zip)
  gsub(/city:/,"", city)
  gsub(/name:/,"", name)
  gsub(/address:/,"", addr)
  gsub(/type:/,"", brand)
  print zip "\t" city "\t" addr "\t" name "\t" brand
}
