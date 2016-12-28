BrowseForImportFileDir:
	FileSelectFile, ImportFileDir
	GuiControl,9:, ImportFileDir, %ImportFileDir%
Return

DoImport:
	Gui, 9: Submit, nohide
	IfNotExist %ImportFileDir%
		{
		MsgBox No file selected!
		Return
		}
	Else
		{
		FileCopy, %ImportFileDir%, %A_AppData%\SLEET\EmulatorINIs\, 1
		Splitpath, ImportFileDir, ImportedINI
		IfExist %A_AppData%\SLEET\EmulatorINIs\%ImportedINI%
			{
			MsgBox Imported %ImportedINI%!
			}
		Else
			{
			MsgBox Something went wrong with the import.  Please report this bug :)
			}
		}
Return

