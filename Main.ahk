#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance off
Version = V a4.0
CurrentLine = 11
HasDetected = 0
ButtonPurpose = Steam Shortcut
IfNotExist %A_AppData%\SLEET\UserData.ini
	{
	FileCreateDir, %A_AppData%\SLEET\EmulatorINIs
	FileCopy, %A_WorkingDir%\EmulatorINIs\*.ini, %A_AppData%\SLEET\EmulatorINIs, 1
	FileCopy, %A_WorkingDir%\UserData.ini, %A_AppData%\SLEET\, 1
	}

;LOAD PREFERENCES
;preferred default emulator
IniRead, DefaultEmu, %A_AppData%\SLEET\UserData.ini, UserPrefs, DefaultEmulator
;prefered location of emulators
IniRead, DefaultEmuDir, %A_AppData%\SLEET\UserData.ini, UserPrefs, DefaultEmulatorDirectory
;Prefered location of roms
IniRead, DefaultRomDir, %A_AppData%\SLEET\UserData.ini, UserPrefs, DefaultRomDirectory
;Prefered location to save exes
IniRead, DefaultSaveDir, %A_AppData%\SLEET\UserData.ini, UserPrefs, DefaultSaveDirectory
;Steam location
IniRead, DefaultSaveDir, %A_AppData%\SLEET\UserData.ini, UserPrefs, DefaultSaveDirectory


;VARIABLES
;Load in the supported emulators from \Resources
LoadSupportedEmus(SupportedEmus)

;draw window

#Include GUIMain.ahk				;GUI 1
#Include GUIEmuFindPopup.ahk		;GUI 2
#Include GUIUserPrefs.ahk			;GUI 3
#Include GUIAddEmu.ahk				;GUI 4
#Include GUIEmuEdit.ahk				;GUI 5
#Include GUISteamShortcut.ahk		;GUI 6
#Include GUIWindowsExec.ahk			;GUI 7
#Include GUIAdvanced.ahk			;GUI 8
#Include GUIImportEmu.ahk			;GUI 9
Gui, 1: Show, x446 y228 center autosize, SLEET | %Version%
Return
#Include GuiMainCalls.ahk
#Include GUIEmuFindPopupCalls.ahk
#Include GUIUserPrefsCalls.ahk
#Include GUIAddEmuCalls.ahk
#Include GUIEmuEditCalls.ahk
#Include GUISteamShortcutCalls.ahk
#Include GUIWindowsExecCalls.ahk
#Include GUIAdvancedCalls.ahk
#Include GUIImportEmuCalls.ahk

#Include OtherCalls.ahk
Return
GuiClose:
GuiEscape:
ExitApp