#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance off

SteamDir = C:\Program Files (x86)\Steam

Gui, 6: Add, Edit, x10 y10 w300 h20 vSteamDir gEditSteamDir, %SteamDir%
Gui, 6: Add, Button, x10 y30 w300 h20 gDetectSteamUsers, Detect Users
Gui, 6: Add, DropDownList, x10 y60 w300 AltSubmit vAliasChoice gShowInfo,%AliasList%
Gui, 6: Add, Button, x10 y90 w300 h20 gSubmit, Submit
Return 

