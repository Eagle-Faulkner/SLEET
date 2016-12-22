#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance off
Version = V a3.0
SteamDir = C:\Program Files (x86)\Steam
CurrentLine = 11
HasDetected = 0
ButtonPurpose = Steam Shortcut

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

#Include GUIWindowsExec.ahk
#Include GUIMain.ahk
#Include GUIEmuFindPopup.ahk
#Include GUIUserPrefs.ahk
#Include GUIAddEmu.ahk
#Include GUIEmuEdit.ahk
#Include GUISteamShortcut.ahk
Gui, 1: Show, x446 y228 center autosize, SLEET | %Version%
Return
#Include GuiMainCalls.ahk
#Include GUIEmuFindPopupCalls.ahk
#Include GUIUserPrefsCalls.ahk
#Include GUIAddEmuCalls.ahk
#Include GUIEmuEditCalls.ahk
#Include GUISteamShortcutCalls.ahk
#Include GUIWindowsExecCalls.ahk




#Include OtherCalls.ahk
Return
GuiClose:
GuiEscape:
ExitApp