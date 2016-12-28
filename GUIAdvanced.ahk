

Gui, 8: Add, Text, x10 y10, Middle command:
Gui, 8: Add, Edit, xp yp+25 vCMD2 gUpdateFullCommandDisplayer, %CMD2%

Gui, 8: Add, Text, xp yp+25, End command:
Gui, 8: Add, Edit, xp yp+25 vCMD3 gUpdateFullCommandDisplayer, %CMD3%



Gui, 8: Add, Text, xp yp+50, What the command will look like:

Gui, 8: Add, Text, xp yp+15 w750 vFullCommandDisplayer, %FullCommandDisplay%