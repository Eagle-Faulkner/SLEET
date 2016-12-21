
;Create top menu bar
;Create option "Add Emulator Support" within menu option "Menu" and point it to EmuSupportAdd function
Menu, MenuMenu, Add, &Add emulator support, EmuSupportAdd
;Create option "Edit Existing Emulator Support" within menu option "Menu" and point it to EmuSupportEdit function
Menu, MenuMenu, Add, &Edit existing emulator support, EmuSupportEdit
;Create option "User Preferences" within menu option "Menu" and point it to EditPrefs function
Menu, MenuMenu, Add, &User Preferences, EditPrefs
;Create option "Add Emulator Support" within menu option "Menu"
Menu, MenuDebug, Add, &STeamDetect, NoUse
;Create Menu Bar menu named "Menu"
Menu, MenuBar, Add, &Menu, :MenuMenu
;Create Menu Bar menu named "Help"
Menu, MenuBar, Add, &Help, :MenuDebug
;Create the Menu Bar
Gui, 1: Menu, MenuBar


;Button to create the an executable file
Gui, 1: Add, Button, x12 y399 w288 h30 gCreateFile, Create .EXE
;Button to add link to Steam library
Gui, 1: Add, Button, x300 y399 w288 h30 gCreateShortcut, Add shortcut to Steam

;Create the tabs
Gui, 1: Add, Tab, x12 y9 w580 h380 , Basic|Advanced|Steam

;BASIC TAB
;Create Tab
Gui, 1: Tab, Basic 
;place text
Gui, 1: Add, Text, x22 y39 w560 h20 , Choose your emulator: 
;place dropdown menu of emulator options
Gui, 1: Add, DropDownList, x22 y60 vEmulatorChoice gCheckEmuDir Choose%DefaultEmu%, %SupportedEmus%
;Place text
Gui, 1: Add, Text, x22 y81 w560 h20 , Location of the emulator on your computer:
;place field for user to type in the address of the emulator
Gui, 1: Add, Edit, x22 y99 w470 h20 vEmulatorDir, %DefaultEmuDir%
;place button to let the user select their emulator with a browser
Gui, 1: Add, Button, x492 y99 w90 h20 gBrowseForEmulator, Browse...
;place text
Gui, 1: Add, Text, x22 y119 w560 h20 , Rom:
;place field for user to type in the address of the rom
Gui, 1: Add, Edit, x22 y139 w470 h20 vRomDir, %DefaultRomDir%
;place button to let the user select their rom with a browser
Gui, 1: Add, Button, x492 y139 w90 h20 gBrowseForRom, Browse...
;place text
Gui, 1: Add, Text, x22 y159 w560 h20 , The folder where you want the executable file to be created:
;place field for user to type in the folder address for the output file
Gui, 1: Add, Edit, x22 y179 w470 h20 vOutputDir, %DefaultSaveDir%
;place button for the user to select their output file
Gui, 1: Add, Button, x492 y179 w90 h20 gBrowseForSave, Browse...
;place text
Gui, 1: Add, Text, x22 y199 w560 h20 , The name you want the executable file to have:
;place field for user to type in the address for the output file
Gui, 1: Add, Edit, x22 y219 w560 h20 vExeName, 
;place text
Gui, 1: Add, Text, x22 y239 w560 h20 ,Select a custom icon(Must be a .ico file)
;place field for user to enter address of icon
Gui, 1: Add, Edit, x22 y259 w470 h20 vIconChoice, %A_WorkingDir%\Resources\sleet.ico
;place button for user to navigate to icon 
Gui, 1: Add, Button, x492 y259 w90 h20 gBrowseForIcon, Browse...


;ADVANCED TAB
;create tab
Gui, 1: Tab, Advanced
;place placeholder text
Gui, 1: Add, Text, x22 y39 w560 h20 ,[This tab still under construction]


;STEAM TAB
;create tab
Gui, 1: Tab, Steam
;place text
Gui, 1: Add, Text, x22 y39 w560 h20,Your Steam install directory:
;place field for user to enter their Steam directory
Gui, 1: Add, Edit, x22 y59 w470 h20 vSteamDir gEditSteamDir, %SteamDir%
;place button for user to navigate Steam directory
Gui, 1: Add, Button, x492 y59 w90 h20 gBrowseForSteamDir, Browse...
;place text
Gui, 1: Add, Text, x22 y79 w560 h20, Select a user to add the shortcut for(If there are none make sure your Steam directory is correct)
;place drop down for user to select their user name
Gui, 1: Add, DropDownList, x22 y99 w470 AltSubmit vAliasChoice,%AliasList%
;place button for user to update the list
Gui, 1: Add, Button, x492 y99 w90 h20 gDetectSteamUsers, Update List


