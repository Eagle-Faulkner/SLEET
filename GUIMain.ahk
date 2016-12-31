
;Create top menu bar
;Create option "Add Emulator Support" within menu option "Menu" and point it to EmuSupportAdd function
Menu, MenuMenu, Add, &Add emulator support, EmuSupportAdd
;Create option "Import emulator ini" within menu option "Menu" and point it to EmuSupportAdd function
Menu, MenuMenu, Add, &Import emulator ini,ImportINI
;Create option "User Preferences" within menu option "Menu" and point it to EditPrefs function
Menu, MenuMenu, Add, &User Preferences, EditPrefs

;Create option "About" in menu "Help"
Menu, MenuHelp, Add, &About, AboutThing
;Create option "Manual" in menu "Help"
Menu, MenuHelp, Add, &Manual, OpenManual
;Create option "Report a bug" in menu "Help"
Menu, MenuHelp, Add, &Report a bug, ReportBug

;Create option "Debug" in menu "Debug"
Menu, MenuDebug, Add, &Debug, Debug
;Creat option "List Variables" in menu "Debug"
Menu, MenuDebug, Add, &List Variables, ListVariables

;Create Menu Bar menu named "Menu"
Menu, MenuBar, Add, &Menu, :MenuMenu
;Create Menu Bar menu named "Help"
Menu, MenuBar, Add, &Help, :MenuHelp
;Create Menu Bar menu named "Debug"
Menu, MenuBar, Add, &Debug, :MenuDebug
;Create the Menu Bar
Gui, 1: Menu, MenuBar


Gui, 1: Add, DDL, x10 y10 w150 vButtonPurpose gUpdateButtonPurpose Choose1, Steam shortcut|Windows executable

;place text
Gui, 1: Add, Text, xp yp+25 , Choose your emulator: 
;place dropdown menu of emulator options
Gui, 1: Add, DropDownList, xp yp+25 w150 vEmulatorChoice gCheckEmuDir Choose%DefaultEmu%, %SupportedEmus%

;Button to edit emulator info
Gui, 1: Add, Button, xp+155 yp w100 gEmuSupportEdit, Edit Emulator .ini

;Advanced Button
Gui, 1: Add, Button, xp+105 yp w100  gActivateAdvancedGUI ,Advanced

;place text
Gui, 1: Add, Text, x10 yp+25 , Rom:
;place button to let the user select their rom with a browser
Gui, 1: Add, Button, xp+260 yp w100 gBrowseForRom, Browse...
;place field for user to type in the address of the rom
Gui, 1: Add, Edit, x10 yp+25 w360 h20 gGetRomNameForNameField vRomDir, %DefaultRomDir%

;place text
Gui, 1: Add, Text, x10 yp+25 w360 vButtonPurposeText , The name you want the %ButtonPurpose% to have:
;place field for user to type in the address for the output file
Gui, 1: Add, Edit, xp yp+25 w360 gBanNameChars vShortcutName, 


;Button to create the executable file
Gui, 1: Add, Button, xp+90 yp+25 w200 h30 vMainButton gMainButtonClick, Make %ButtonPurpose%