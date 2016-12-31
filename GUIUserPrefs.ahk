;PREFERENCES
;Place text
Gui, 3: Add, Text, x10 y10,Default emulator selection:
;Place dropdown menu to pick an emulator to default to
Gui, 3: Add, DropDownList, xp yp+25 AltSubmit vDefaultEmu Choose%DefaultEmu%, %SupportedEmus%

;place text
Gui, 3: Add, Text, xp yp+25 ,Default location of emulators:
;place field for user to enter their default emulator folder directory
Gui, 3: Add, Edit, xp yp+25 w300 vDefaultEmuDir, %DefaultEmuDir%
;place button for user to select their default emulator folder directory
Gui, 3: Add, Button, xp+305 yp w100 gBrowseForDefaultEmuDir, Browse...

;place text
Gui, 3: Add, Text, x10 yp+25 ,Default location of Roms:
;place field for user to enter their default rom folder directory
Gui, 3: Add, Edit, xp yp+25 w300 vDefaultRomDir, %DefaultRomDir%
;place button for user to select their default rom folder directory
Gui, 3: Add, Button, xp+305 yp w100 gBrowseForDefaultRomDir, Browse...

;place text
Gui, 3: Add, Text, x10 yp+25 ,Default location to save new executable files:
;place field for user to enter their default directory to save new files
Gui, 3: Add, Edit, xp yp+25 w300 vDefaultSaveDir, %DefaultSaveDir%
;place button for user to browse to their default directory to save new files
Gui, 3: Add, Button, xp+305 yp w100 gBrowseForDefaultSaveDir, Browse...

;place text
Gui, 3: Add, Text, x10 yp+25 ,DLocation of your Steam install:
;place field for user to enter their Steam install
Gui, 3: Add, Edit, xp yp+25 w300 vSteamDir, %SteamDir%
;place button for user to browse to their installation of Steam
Gui, 3: Add, Button, xp+305 yp w100 gBrowseForSteamDir, Browse...


;place button for user to save their preferences
Gui, 3: Add, Button, x10 gSavePrefs, Save Preferences




