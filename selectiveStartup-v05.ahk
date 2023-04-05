;------------------- SELECTIVE STARTUP BASED ON TIME AND DAY OF THE WEEK ( PUT A SHORTCUT IN STARTUP FOLDER -- C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp  ) ------------------------

;set fuzzy match 
	SetTitleMatchMode, 2

; quick key presses
	SetKeyDelay -1

; set numlock state 
	SetNumLockState, On

; get time
	FormatTime, Weekday,YYYYMMDD, WDay
	FormatTime, timeofday,,H

; AHK scripts batch // COMMON STARTUP ACTIONS
	Run, %A_ScriptDir%\common\longPressANDdoubleTap.ahk
	Run, %A_ScriptDir%\common\auto-quotes-2.1.ahk
	Run, %A_ScriptDir%\common\alt-f4.ahk


; LOGIC WORKING DAYS AND WORKING HOURS
if (Weekday = 1 or Weekday = 7 or timeofday > 17)
	{
		ExitApp
	}
else
	{
		; setup GUI
		Gui, Font, s20, Segoe UI Semibold
		Gui, Color, 000000
		Gui, -Caption +Border
		Gui, Add, Button, w100 gbusiness, BUSINESS
		Gui, Add, Button, w100 gpleasure, PLEASURE
		Gui, Show
		Return
		; setup subroutines
		business:
		{
			; prompt for current folder path
			Gui, Destroy
			FileSelectFolder, curWorkFolder, E:\_PROJECTS\
			if (curWorkFolder = "")
			{
				;read last session folder
				FileRead, cur, %A_ScriptDir%\logs\folderLog.txt
				Envset, cur, %cur%
				Run, cmd.exe /c SETX cur %cur%
				Goto, Workstartup
			}
			else
			{
				; set environnement variable
				EnvSet, cur, %curWorkFolder%
				Run, cmd.exe /c SETX cur %curWorkFolder%
				;store to txt
				FileDelete, %A_ScriptDir%\logs\folderLog.txt
				FileAppend, %cur%, %A_ScriptDir%\logs\folderLog.txt
				Goto, Workstartup
			}
		}
		return
		; INSERT WORK STARTUP HERE
		Workstartup:
			Run, C:\Users\Dragonoid\AppData\Local\Programs\Rambox\Rambox.exe
			Run, C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe
			; Run, C:\Program Files\Aalab\Found\bin\found.exe, Min
			ExitApp
		; INSERT OFFWORK STARTUP HERE
		pleasure:
			ExitApp
	}