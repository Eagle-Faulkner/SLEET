Gui, 4: Add, Text, x10 y10, Name to use for the new emulator in the drop down list:
Gui, 4: Add, Edit, xp yp+25 w300 vNewEmuName, 

Gui, 4: Add, Text, xp yp+25, Location of the emulator on your computer:
Gui, 4: Add, Button, xp+200 yp w100 vNewEmuAddress gUpdateNewFullCommandDisplayer, Browse...
Gui, 4: Add, Edit, x10 yp+25 w300 vNewEmulatorDir gUpdateNewFullCommandDisplayer, C:\path\to\your\emulator.exe

Gui, 4: Add, Text, xp yp+25, Minimal commands needed prior to loading the rom:
Gui, 4: Add, Edit, xp yp+25 w300 vNewEmuCMD2 gUpdateNewFullCommandDisplayer, 

Gui, 4: Add, Text, xp yp+25, Command needed to load the rom:
Gui, 4: Add, Edit, xp yp+25 w300 vNewEmuCMDLoad gUpdateNewFullCommandDisplayer, 

Gui, 4: Add, Text, xp yp+25, Minimal commands needed after loading the rom:
Gui, 4: Add, Edit, xp yp+25 w300 vNewEmuCMD3 gUpdateNewFullCommandDisplayer,

Gui, 4: Add, Checkbox, xp yp+25 vNewQuoteAround gUpdateNewFullCommandDisplayer, Quotes around the rom directory


Gui, 4: Add, Text, xp yp+25, Fullscreen command:
Gui, 4: Add, Edit, xp yp+25 w300 vNewEmuCMDFScrn gUpdateNewFullCommandDisplayer,

Gui, 4: Add, Text, xp yp+25 , Where this command will appear:
Gui, 4: Add, DropDownList, xp yp+25 AltSubmit vNewEmuCMDFScrnPos gUpdateNewFullCommandDisplayer Choose1, Before loading rom|After loading rom


Gui, 4: Add, Text, xp yp+50, What the command will look like:
Gui, 4: Add, Text, xp yp+15 w750 vNewFullCommandDisplayer, %NewFullCommandDisplay%

Gui, 4: Add, Button, xp yp+25 gSaveNewEmu, Save new emulator support .ini













