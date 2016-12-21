#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance off


;Edit Emulator INI
Gui, 5: Add, Button, x12 y399 w580 h30 gEditEmuData, Save Emulator's New Info
Gui, 5: Add, Button, x12 y429 w580 h30 gDeleteEmuData, Delete This Emulator
Gui, 5: Add, Tab , x10 y10 w580 h380 , Basic|Advanced
Gui, 5: Tab, Basic
Gui, 5: Add, Text, x10 y45 w560 h20 , Emulator:
Gui, 5: Add, DropDownList, x10 y60 w240 vEditEmuName gUpdateEditEmuGUI, %SupportedEmus%
Gui, 5: Add, Text, x10 y90 w560 , The minimal command-line commands needed to run the emulator that appear here(Leave blank if none):`r`nHERE[Address of emulator] [Address of rom]
Gui, 5: Add, Edit, x10 y120 w560 h20 vEditEmuCMD1, %EditEmuCMD1%
Gui, 5: Add, Text, x10 y150 w560 , The minimal command-line commands needed to run the emulator that appear here(Leave blank if none):`r`n[Address of emulator] HERE [Address of rom]
Gui, 5: Add, Edit, x10 y180 w560 h20 vEditEmuCMD2, %EditEmuCMD2%
Gui, 5: Add, Text, x10 y210 w560 , The minimal command-line commands needed to run the emulator that appear just before the address of the rom(Leave blank if none):
Gui, 5: Add, Edit, x10 y240 w560 h20 vEditEmuCMDLoad, %EditEmuCMDLoad%
Gui, 5: Add, Text, x10 y270 w560 , The minimal command-line commands needed to run the emulator that appear here(Leave blank if none):`r`n[Address of emulator] [Address of rom] HERE
Gui, 5: Add, Edit, x10 y300 w560 h20 vEditEmuCMD3, %EditEmuCMD3%

Gui, 5: Tab, ADVANCED
Gui, 5: Add, Text, x10 y30 w560 , The command-line command needed to run the emulator in full screen
Gui, 5: Add, Edit, x10 y60 w560 h20 vEditEmuCMDFScrn
Gui, 5: Add, Text, x10 y90 w560 , Where this command will appear within the full command
Gui, 5: Add, DropDownList, x10 y120 w280 AltSubmit vEditEmuCMDFScrnPos Choose%EditEmuCMDFScrnPos%, [HERE] [Address of emulator] [Address of rom]|[Address of emulator] HERE [Address of rom]|[Address of emulator] [Address of rom] HERE

