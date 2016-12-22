#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance off

Gui, 2: Add, Text, x10 y10, Where is this emulator?
Gui, 2: Add, Edit, x10 y30 w470 h20 vEmulatorDir
Gui, 2: Add, Button, x492 y30 gBrowseForEmulator,Browse...
Gui, 2: Add, Button, X10 y50 gSaveEmuDir, Save




