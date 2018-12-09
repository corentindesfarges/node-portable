dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")
xHttp.Open "GET", WScript.Arguments(0), False
xHttp.Send

with bStrm
  .type = 1
  .open
  .write xHttp.responseBody
  .savetofile WScript.Arguments(1), 2
end with
