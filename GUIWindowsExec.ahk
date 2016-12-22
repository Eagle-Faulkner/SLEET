;place text
Gui, 7: Add, Text, x10 y10, The folder where you want the executable file to be created:
;place field for user to type in the folder address for the output file
Gui, 7: Add, Edit, xp yp+25 w300 vOutputDir, %DefaultSaveDir%
;place button for the user to select their output file
Gui, 7: Add, Button, xp+305 yp w100 gBrowseForSave, Browse...

;place text
Gui, 7: Add, Text, x10 yp+25 ,Select a custom icon(Must be a .ico file)
;place field for user to enter address of icon
Gui, 7: Add, Edit, xp yp+25 w300 vIconChoice, %A_WorkingDir%\Resources\sleet.ico
;place button for user to navigate to icon 
Gui, 7: Add, Button, xp+305 yp gBrowseForIcon, Browse...



