;------------- ENVIRONNEMENT VARIABLE AND CUSTOM LOGGED VARIABLE SET IN TXT FILE -------------------

; folder select prompt starting in custom root folder for quick access ( E:\_PROJECTS\ )
FileSelectFolder, curWorkFolder, E:\_PROJECTS\
if (curWorkFolder = "")
	{
		;read last session folder
		FileRead, cur, %A_ScriptDir%\logs\folderLog.txt
		Envset, cur, %cur%
		Run, cmd.exe /c SETX cur %cur%
		Run, %A_ScriptDir%\common\longPressANDdoubleTap.ahk
		ExitApp
	}
else
	{
		; set environnement variable
		EnvSet, cur, %curWorkFolder%
		Run, cmd.exe /c SETX cur %curWorkFolder%
		;store to txt
		FileDelete, %A_ScriptDir%\folderLog.txt
		FileAppend, %cur%, %A_ScriptDir%\logs\folderLog.txt
		Run, %A_ScriptDir%\common\longPressANDdoubleTap.ahk
		ExitApp
	}
