@ECHO OFF
START /W REGEDIT /E aurora\batchlog\t-ansi.reg "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\CodePage"
FOR /F "tokens=1* delims==" %%A IN ('TYPE aurora\batchlog\t-ansi.reg ^| FIND "ACP"') DO SET AnsiCodePage==%%B
SET AnsiCodePage=%AnsiCodePage:"=%
SET AnsiCodePage >> aurora\batchlog\t-ansi.txt 2>&1
DEL aurora\batchlog\t-ansi.reg
