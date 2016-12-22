
;Create top menu bar
;Create option "Add Emulator Support" within menu option "Menu" and point it to EmuSupportAdd function
Menu, MenuMenu, Add, &Add emulator support, EmuSupportAdd
;Create option "User Preferences" within menu option "Menu" and point it to EditPrefs function
Menu, MenuMenu, Add, &User Preferences, EditPrefs
;Create option "Add Emulator Support" within menu option "Menu"
Menu, MenuDebug, Add, &STeamDetect, Debug
;Create Menu Bar menu named "Menu"
Menu, MenuBar, Add, &Menu, :MenuMenu
;Create Menu Bar menu named "Help"
Menu, MenuBar, Add, &Help, :MenuDebug
;Create the Menu Bar
Gui, 1: Menu, MenuBar


Gui, 1: Add, DDL, x10 y10 w150 vButtonPurpose gUpdateButtonPurpose Choose1, Steam Shortcut|Windows executable

;place text
Gui, 1: Add, Text, xp yp+25 , Choose your emulator: 
;place dropdown menu of emulator options
Gui, 1: Add, DropDownList, xp yp+25 w150 vEmulatorChoice gCheckEmuDir Choose%DefaultEmu%, %SupportedEmus%

;Button to edit emulator info
Gui, 1: Add, Button, xp+200 yp w100 gEmuSupportEdit, Edit details

;place text
Gui, 1: Add, Text, x10 yp+25 , Rom:
;place button to let the user select their rom with a browser
Gui, 1: Add, Button, xp+200 yp w100 gBrowseForRom, Browse...
;place field for user to type in the address of the rom
Gui, 1: Add, Edit, x10 yp+25 w300 h20 vRomDir, %DefaultRomDir%

;place text
Gui, 1: Add, Text, x10 yp+25 w300 vButtonPurposeText , The name you want the %ButtonPurpose% to have:
;place field for user to type in the address for the output file
Gui, 1: Add, Edit, xp yp+25 w300 gBanNameChars vShortcutName, Rom


;Button to create the executable file
Gui, 1: Add, Button, xp+50 yp+25 w200 h30 vMainButton gMainButtonClick, Make %ButtonPurpose%