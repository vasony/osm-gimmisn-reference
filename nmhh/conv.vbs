Rem WScript.Echo "Start"
Dim oExcel
Set oExcel = CreateObject("Excel.Application")
Dim oBook
Set oBook = oExcel.Workbooks.Open("g:\qm\data\osm\gimmisn\data\06_nmhh\szolgaltatok.xlsx")
oBook.Worksheets(1).Activate
oBook.SaveAs "g:\qm\data\osm\gimmisn\data\06_nmhh\hirkozlesi.tmp", 42
oBook.Close False
Set oBook = oExcel.Workbooks.Open("g:\qm\data\osm\gimmisn\data\06_nmhh\export.xlsx")
oBook.Worksheets(1).Activate
oBook.SaveAs "g:\qm\data\osm\gimmisn\data\06_nmhh\postai.tmp", 42
oBook.Close False
oExcel.Quit
Rem WScript.Echo "Done"