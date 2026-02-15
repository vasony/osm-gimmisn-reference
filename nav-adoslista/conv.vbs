Rem WScript.Echo "Start"
Dim oExcel
Set oExcel = CreateObject("Excel.Application")
Dim oBook
Set oBook = oExcel.Workbooks.Open("g:\qm\data\osm\gimmisn\data\05_nav-adoslista\tmp\data_hiany.xlsx")
oBook.Worksheets(1).Activate
oBook.SaveAs "g:\qm\data\osm\gimmisn\data\05_nav-adoslista\tmp\data_hiany.txt", 42
oBook.Close False
oExcel.Quit
Rem WScript.Echo "Done"