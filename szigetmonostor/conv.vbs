Rem WScript.Echo "Start"
Dim oExcel
Set oExcel = CreateObject("Excel.Application")
Dim oBook
Set oBook = oExcel.Workbooks.Open("g:\qm\data\osm\uzletlista\szigetmonostor\KERESKEDELMI_TEVEKENYSEGET_VEGZOK_NYILVANTARTASA_I.xls")
oBook.Worksheets(1).Activate
oBook.SaveAs "g:\qm\data\osm\uzletlista\szigetmonostor\szigetmonostor_01.tmp", 42
oBook.Worksheets(2).Activate
oBook.SaveAs "g:\qm\data\osm\uzletlista\szigetmonostor\szigetmonostor_02.tmp", 42
oBook.Close False
oExcel.Quit
Rem WScript.Echo "Done"