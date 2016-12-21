#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance off
Version = V a3.0
SteamDir = C:\Program Files (x86)\Steam
CurrentLine = 11
HasDetected = 0

;LOAD PREFERENCES
;preferred default emulator
IniRead, DefaultEmu, UserData.ini, UserPrefs, DefaultEmulator
;prefered location of emulators
IniRead, DefaultEmuDir, UserData.ini, UserPrefs, DefaultEmulatorDirectory
;Prefered location of roms
IniRead, DefaultRomDir, UserData.ini, UserPrefs, DefaultRomDirectory
;Prefered location to save exes
IniRead, DefaultSaveDir, UserData.ini, UserPrefs, DefaultSaveDirectory

;VARIABLES
;Load in the supported emulators from \Resources
LoadSupportedEmus(SupportedEmus)

;draw window
Gui, 1: Show, x446 y228 h453 w616, SLEET | %Version%

#Include GUI1.ahk
#Include GUI2.ahk
#Include GUI3.ahk
#Include GUI4.ahk
#Include GUI5.ahk
#Include Calls.ahk
Return
GuiClose:
GuiEscape:
ExitApp