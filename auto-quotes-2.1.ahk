;------------AUTOMATE () AND ""------------------
;set fuzzy match 
SetTitleMatchMode, 2
; apps exception list
GroupAdd, QUOTES, Sublime
GroupAdd, QUOTES, Adobe After Effects
GroupAdd, QUOTES, Visual Studio Code
#IfWinNotActive, ahk_group QUOTES
{
	+'::
	;Clipboard=
	;Send, ^c
	send, {"}{"}{Left}
	;Send, ^v
	Return

	+9::
	;Clipboard=
	;Send, ^c
	send, {(}{)}{Left}
	;send, ^v
	Return
}
