; Compile as console application via aut2exe

; first argument should point to the file containing the result string
$first = FileRead($CmdLine[1])
StringRegExpReplace($first, '\R', @CRLF) ; normalize crlf and lf (github modifies line breaks)

; second argument should point to the file containing the expected string
$second = FileRead($CmdLine[2])
StringRegExpReplace($second, '\R', @CRLF) ; normalize crlf and lf

; string compare
$compare = ($first == $second)

; write output
ConsoleWrite("Result:" & @CRLF)
ConsoleWrite($first)
ConsoleWrite("Expected:" & @CRLF)
ConsoleWrite($second)

If $compare Then 
   ; exit with errorlevel 0 on equality
   ConsoleWrite("Pass/Same" & @CRLF)
   Exit(0)
Else
   ; exit with errorlevel 1 on difference
   ConsoleWrite("Fail/Different" & @CRLF)
   Exit(1)
EndIf