EmuSupportAdd:
	Gui, 4: Show, autosize, SLEET | %Version%
Return


EditPrefs:
	Gui, 3: Show, autosize, SLEET | %Version%
Return

Debug:
	MsgBox No debug options right now.
Return

UpdateButtonPurpose:
	GuiControlGet, ButtonPurpose
	GuiControl, 1:, ButtonPurposeText, The name you want the %ButtonPurpose% to have:
	GuiControl, 1:, MainButton, Make %ButtonPurpose%
Return


BanNameChars:
	GuiControlGet, ShortcutName
	If ShortcutName contains,,,!,?,@,#,$,`%,^,&,*,{,},/,\,~,`,+,=,',<,>,:,|," ;";This exists just to end quote coloring in NotePad++
		{
		SoundPlay, *16
		StringReplace, ShortcutName, ShortcutName, !,,,ALL
		StringReplace, ShortcutName, ShortcutName, @,,,ALL
		StringReplace, ShortcutName, ShortcutName, #,,,ALL
		StringReplace, ShortcutName, ShortcutName, $,,,ALL
		StringReplace, ShortcutName, ShortcutName, `%,,,ALL
		StringReplace, ShortcutName, ShortcutName, ^,,,ALL
		StringReplace, ShortcutName, ShortcutName, &,,,ALL
		StringReplace, ShortcutName, ShortcutName, *,,,ALL
		StringReplace, ShortcutName, ShortcutName, {,,,ALL
		StringReplace, ShortcutName, ShortcutName, },,,ALL
		StringReplace, ShortcutName, ShortcutName, |,,,ALL
		StringReplace, ShortcutName, ShortcutName, \,,,ALL
		StringReplace, ShortcutName, ShortcutName, /,,,ALL
		StringReplace, ShortcutName, ShortcutName, ',,,ALL
		StringReplace, ShortcutName, ShortcutName, ",,,ALL ;";Fix
		StringReplace, ShortcutName, ShortcutName, <,,,ALL
		StringReplace, ShortcutName, ShortcutName, >,,,ALL
		StringReplace, ShortcutName, ShortcutName, ?,,,ALL
		StringReplace, ShortcutName, ShortcutName, +,,,ALL
		StringReplace, ShortcutName, ShortcutName, =,,,ALL
		StringReplace, ShortcutName, ShortcutName, :,,,ALL
		StringReplace, ShortcutName, ShortcutName, ~,,,ALL
		GuiControl, 1:, ShortcutName, %ShortcutName%
		}
Return


;Function to check for the location of an emulator when it is selected in the Basic tab of the main GUI
;This exists so that you'll only ever need to tell it where your emulator is once
CheckEmuDir:
	;Submit the information from the form
	Gui, 1: Submit, Nohide
	;Load the address of the emulator's directory
	IniRead, EmulatorDir, %A_WorkingDir%\EmulatorINIs\%EmulatorChoice%.ini, EmuInfo, EmulatorLocation
	;Check if the address exists and if it doesn't, ask the user for the address of the emulator
	IfNotExist, %EmulatorDir%
		{
		Gui, 2: Show, autosize, SLEET | %Version%
		}
	GuiControl,1:, EmulatorDir, %EmulatorDir%
	;IniWrite, %DefaultSaveDir%, UserData.ini, UserPrefs, DefaultSaveDirectory
Return

EmuSupportEdit:
	GuiControlGet, EmulatorChoice
	GuiControl, 5: Choose, EditEmuName, %EmulatorChoice%
	Gui, 5: Show, autosize, SLEET | %Version%
Return

BrowseForRom:
	FileSelectFile, RomDir, ,%DefaultRomDir%, Select your rom for %EmulatorChoice%
	GuiControl,1:, RomDir, %RomDir%
Return



MainButtonClick:
	If (ButtonPurpose="Steam shortcut")
		{
		GoTo DetectSteamUsers
		}
	Else If (ButtonPurpose="Windows executable")
		{
		Gui, 7: Show, Center autosize , Sleet | %Version%
		}
		
Return


