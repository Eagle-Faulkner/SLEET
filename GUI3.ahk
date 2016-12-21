#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance off

;PREFERENCES
;Place text
Gui, 3: Add, Text, x10 y9 w560 h20 ,Default emulator selection:
;Place dropdown menu to pick an emulator to default to
Gui, 3: Add, DropDownList, x10 y39 AltSubmit vDefaultEmu Choose%DefaultEmu%, %SupportedEmus%
;place text
Gui, 3: Add, Text, x10 y61 w560 h20 ,Default location of emulators:
;place field for user to enter their default emulator folder directory
Gui, 3: Add, Edit, x10 y79 w470 h20 vDefaultEmuDir, %DefaultEmuDir%
;place button for user to select their default emulator folder directory
Gui, 3: Add, Button, x494 y79 w90 h20 gBrowseForDefaultEmuDir, Browse...
;place text
Gui, 3: Add, Text, x10 y99 w560 h20 ,Default location of Roms:
;place field for user to enter their default rom folder directory
Gui, 3: Add, Edit, x10 y119 w470 h20 vDefaultRomDir, %DefaultRomDir%
;place button for user to select their default rom folder directory
Gui, 3: Add, Button, x494 y119 w90 h20 gBrowseForDefaultRomDir, Browse...
;place text
Gui, 3: Add, Text, x10 y139 w560 h20 ,Default location to save new executable files:
;place field for user to enter their default directory to save new files
Gui, 3: Add, Edit, x10 y159 w470 h20 vDefaultSaveDir, %DefaultSaveDir%
;place button for user to browse to their default directory to save new files
Gui, 3: Add, Button, x494 y159 w90 h20 gBrowseForDefaultSaveDir, Browse...
;place button for user to save their preferences
Gui, 3: Add, Button, x460 y349 gSavePrefs, Save Preferences




