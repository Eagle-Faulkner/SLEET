EmuSupportAdd:
	GoSub, UpdateNewFullCommandDisplayer
	Gui, 4: Show, center autosize, SLEET | %Version%
	Gui, 4:+Owner
	Gui, 1:+Disabled
Return


EditPrefs:
	Gui, 3: Show, center autosize, SLEET | %Version%
	Gui, 3:+Owner
	Gui, 1:+Disabled
Return

ImportINI:
	Gui, 9: Show, Center Autosize, SLEET | %Version%
	Gui, 9:+Owner
	Gui, 1:+Disabled
Return

ReportBug:
	Run https://docs.google.com/forms/d/e/1FAIpQLSfeT2jMf7RKvcFw-oqN9uP_8ysUfWrX8-j8tuGRaQsvAdbRzA/viewform
Return

AboutThing:
	MsgBox SLEET %Version%`r`nWebsite: https://eagle-faulkner.github.io/projects/SLEET/sleet.html`r`nGitHub: https://github.com/Eagle-Faulkner/SLEET`r`n`r`nSLEET is under GNU General Public License v3
Return

OpenManual:
	Run %A_WorkingDir%\Resources\SLEETManual.pdf
Return

Debug:
	MsgBox Debug start
	
	MsgBox No Debugs
	
	MsgBox Debug over
Return

UpdateButtonPurpose:
	GuiControlGet, ButtonPurpose
	GuiControl, 1:, ButtonPurposeText, The name you want the %ButtonPurpose% to have:
	GuiControl, 1:, MainButton, Make %ButtonPurpose%
Return

GetRomNameForNameField:
	SplitPath, RomDir, ShortcutName
	StringTrimRight, ShortcutName, ShortcutName, 4
	GuiControl, 1:, ShortcutName, %ShortcutName%
Return

ListVariables:
	ListVars
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
	GoSub, LoadFromEmuINI
	;Load the address of the emulator's directory
	IniRead, EmulatorDir, %A_AppData%\SLEET\EmulatorINIs\%EmulatorChoice%.ini, EmuInfo, EmulatorLocation
	;Check if the address exists and if it doesn't, ask the user for the address of the emulator
	IfNotExist, %EmulatorDir%
		{
		Gui, 2: Show, autosize, SLEET | %Version%
		Gui, 2:+Owner
		Gui, 1:+Disabled
		}
	GuiControl,1:, EmulatorDir, %EmulatorDir%
Return

ActivateAdvancedGUI:
	
	Gui, 1: Submit, Nohide
	GuiControl, 8:, CMD2, %CMD2%
	GuiControl, 8:, CMD3, %CMD3%
	GoSub, UpdateFullCommandDisplayer
	Gui, 8: Show, center autosize, SLEET | %Version%
	Gui, 8:+Owner
	Gui, 1:+Disabled
Return

EmuSupportEdit:
	GuiControlGet, EmulatorChoice
	EditEmuName = %EmulatorChoice%
	Gui, 5: Show, center autosize, SLEET | %Version%
	Gui, 5:+Owner
	Gui, 1:+Disabled
	GuiControl, 5: Choose, EditEmuName, %EmulatorChoice%
	GoSub, UpdateEditFields
Return

BrowseForRom:
	FileSelectFile, RomDir, ,%DefaultRomDir%, Select your rom for %EmulatorChoice%
	GuiControl,1:, RomDir, %RomDir%
Return



MainButtonClick:
	If (ButtonPurpose="Steam shortcut")
		{
		Process, Exist, Steam.exe
		If ErrorLevel ;Steam open
			{
			MsgBox You can't add Steam shortcuts if Steam is running.`r`nPlease close Steam and try again.
			Return
			}
		Gui, 6: Show, center autosize, SLEET | %Version%
		GoTo DetectSteamUsers
		Gui, 6:+Owner
		Gui, 1:+Disabled
		}
	Else If (ButtonPurpose="Windows executable")
		{
		Gui, 7: Show, Center autosize , Sleet | %Version%
		Gui, 7:+Owner
		Gui, 1:+Disabled
		}
	Else
		{
		MsgBox Please write down exactly what you did to get here so we can prevent it in the future!
		}
Return


