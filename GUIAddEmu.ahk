#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance off

;Add Emulator Support INI
Gui, 4: Add, Button, x12 y399 w580 h30 gSaveNewEmu, Save New Emulator
Gui, 4: Add, Tab , x10 y10 w580 h380 , Basic|Advanced
Gui, 4: Tab, Basic
Gui, 4: Add, Text, x10 y45 w560 h20 , Name of the emulator:
Gui, 4: Add, Edit, x10 y60 w560 h20 vNewEmuName
Gui, 4: Add, Text, x10 y90 w560 , The minimal command-line commands needed to run the emulator that appear here(Leave blank if none):`r`nHERE[Address of emulator] [Address of rom]
Gui, 4: Add, Edit, x10 y120 w560 h20 vNewEmuCMD1
Gui, 4: Add, Text, x10 y150 w560 , The minimal command-line commands needed to run the emulator that appear here(Leave blank if none):`r`n[Address of emulator] HERE [Address of rom]
Gui, 4: Add, Edit, x10 y180 w560 h20 vNewEmuCMD2
Gui, 4: Add, Text, x10 y210 w560 , The minimal command-line commands needed to run the emulator that appear just before the address of the rom(Leave blank if none):
Gui, 4: Add, Edit, x10 y240 w560 h20 vNewEmuCMDLoad
Gui, 4: Add, Text, x10 y270 w560 , The minimal command-line commands needed to run the emulator that appear here(Leave blank if none):`r`n[Address of emulator] [Address of rom] HERE
Gui, 4: Add, Edit, x10 y300 w560 h20 vNewEmuCMD3

Gui, 4: Tab, ADVANCED
Gui, 4: Add, Text, x10 y30 w560 , The command-line command needed to run the emulator in full screen
Gui, 4: Add, Edit, x10 y60 w560 h20 vNewEmuCMDFScrn
Gui, 4: Add, Text, x10 y90 w560 , Where this command will appear within the full command
Gui, 4: Add, DropDownList, x10 y120 w280 AltSubmit vNewEmuCMDFScrnPos, [HERE] [Address of emulator] [Address of rom]|[Address of emulator] HERE [Address of rom]|[Address of emulator] [Address of rom] HERE


