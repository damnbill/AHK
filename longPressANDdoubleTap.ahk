; ---------------DOUBLE TAP FUNCTIONS FOR LISTED ACTIONS BELOW ///  NEEDS rapidhotkey.ahk IN SCRIPTDIR TO WORK -------------------
; setup
	SetStoreCapslockMode, Off
	#SingleInstance, Force
	; import rapidhotkey
	#Include, %A_ScriptDir%\rapidhotkey.ahk

; double tap arrows for home/end
	~Left::RapidHotkey("{Home}",2,0.07)
	~Right::RapidHotkey("{End}",2,0.07)

; mouse menu
	~LAlt::RapidHotkey("mousemenu",2,0.16, 1)

; delete last word
	~Space::RapidHotkey("deleteword",2,0.07, 1)

; accents
	~e::RapidHotkey("accentaigu",2,0.07, 1)
	~a::RapidHotkey("accentgrave",2,0.07, 1)
	~c::RapidHotkey("cedille",2,0.07, 1)
	~r::RapidHotkey("egrave",2,0.07, 1)

;;; not used ;;;;
	;~LShift::RapidHotkey("quickCap",2,0.07, 1)


;;Actions-----> 


mousemenu:
	#Include, %A_ScriptDir%\mouse-menu.ahk
	Return

deleteword:
	Send, ^{BackSpace}  
	Return

accentaigu:
	Send, {Asc 0233}
	Return

accentgrave:
	Send, {Asc 0224}
	Return

cedille:
	Send, {Asc 0231}
	Return

egrave:
	Send, {Asc 0232}
	Return