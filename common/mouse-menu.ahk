; ----------------- QUICK ACCESS ON MOUSE POS TRIGGERED BY DOUBLE TAP ALT //// NEEDS rapidhotkey.ahk AND longPressANDdoubleTap.ahk IN SCRIPTDIR TO WORK ---------------------------------
; button names variables
B1=--Download--
Path1=G:\DOWNLOAD
B2=--DUMP--
Path2=E:\_DUMP
B3=--CHANGE CUR--
Path3=E:\!!TOOLS\changeCURfolder.ahk
B4=--YOUTUBE--
Path4=https://www.youtube.com/playlist?list=WL
B6=--NOTION--
Path6=C:\Users\Dragonoid\AppData\Local\Programs\Notion\Notion.exe
B7=--FINANCES--
Path7= X:\_FINANCES
; to edit with current path
BC=--CURRENT--
PathC=%cur%

;GUI setup / buttons order
CoordMode, Mouse, Screen
Gui, -Caption +AlwaysOnTop
MouseGetPos, mx, my
Gui, Margin, 0, 0
Gui, Add, Button, w100 gBC, %BC%
Gui, Add, Button, w100 gB3, %B3%
Gui, Add, Button, w100 gB7, %B7%
Gui, Add, Button, w100 gB1, %B1%
Gui, Add, Button, w100 gB2, %B2%
Gui, Add, Button, w100 gB4, %B4%
Gui, Add, Button, w100 gB6, %B6%
Gui, Add, Button, w100 gExit, ---Exit---
Gui, Show, x%mx% y%my%
Return

; Button action
BC:
{
	Gui, Destroy
	Run, %PathC%, ,max
	Return
}

B1:
{
	Gui, Destroy
	Run, %Path1%, ,max
	Return
}

B2:
{
	Gui, Destroy
	Run %Path2%, ,max
	Return
}

B3:
{
	Gui, Destroy
	Run %Path3%, ,max
	Return
}

B4:
{
	Gui, Destroy
	Run %Path4%, ,max
	Return
}

B6:
{
	Gui, Destroy
	Run %Path6%
	Return
}

B7:
{
	Gui, Destroy
	Run %Path7%
	Return
}

Exit:
{
	Gui, Destroy
	Return
}

; destroy on escape press
GuiEscape:
{
	Gui, Destroy
	Return
}
