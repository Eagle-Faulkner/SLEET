

UpdateFullCommandDisplayer:
	Gui, 1: Submit, Nohide
	Gui, 8: Submit, Nohide
	
	;If (CMDFScrnPos=2)
	;	{
	;	FullCommandDisplay = %EmulatorDir% %CMD2% %CMDFScrn% %CMDLoad% %RomDir% %CMD3%
	;	}
	;Else If (CMDFScrnPos=3)
	;	{
	;	FullCommandDisplay = %EmulatorDir% %CMD2% %CMDLoad% %RomDir% %CMD3% %CMDFScrn%
	;	}
	
	FullCommandDisplay = %EmulatorDir% %CMD2% %CMDLoad% %RomDir% %CMD3%
	GuiControl, 8:, FullCommandDisplayer, %FullCommandDisplay%
Return
