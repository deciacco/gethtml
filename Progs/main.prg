*************************************************************************************
* Purpose......Application entry point
* Author.......Deciacco.com
* Created......November 27, 2006
* About........
* Mod List.....
*************************************************************************************

On Error Do errorhandler With Error( ), Message( ), Message(1), Program( ), Lineno(1)

Do setcommands
Do setuplibs
Do setupscreen
Do setupmenu
Do setupdatabase

Do Form startform
Do settopmost With _Screen.ActiveForm.HWnd

On Shutdown Clear Events

Read Events

Do propershutdown

**************************************************************************************
Procedure errorhandler
Parameter tnerror, tcmessage, tcmessage1, tcprogram, tnlineno
	Local lcerrormessage
	lcerrormessage = "Error number: " + Transform(tnerror) + Chr(13) ;
		+ "Error message: " + tcmessage + Chr(13) ;
		+ "Line of code: " + tcmessage1 + Chr(13);
		+ "Program: " + tcprogram + Chr(13);
		+ "Line number: " + Transform(tnlineno)
	Messagebox(lcerrormessage, 16, "A Problem Has Been Encountered")
	Clear Events
Endproc

**************************************************************************************
Procedure setcommands
	Local lcpath
	If _vfp.StartMode = 0  && running inside the Visual FoxPro IDE
		lcpath = Left(Sys(16,0), Rat("\", Sys(16,0), 2))
		Set Default To (lcpath) && Specifies the default drive and directory
		Set Path To (lcpath + ";Data\;Forms\;Help\;Images\;Libs\;Menus\;Progs\;Reports\") && Specifies a path for file searches
	Else
		lcpath = Justpath(Sys(16,0))
		Set Default To (lcpath) && Specifies the default drive and directory
		Set Path To (lcpath + ";Data\;Images\") && Specifies a path for file searches
	Endif
Endproc

**************************************************************************************
Procedure setupscreen
	With _Screen
		.AddProperty("ClientPath", Addbs(Sys(5) + Sys(2003)))
		.AddProperty("DataPath", Addbs(Sys(5) + Sys(2003)) + "Data\")
	Endwith
Endproc

**************************************************************************************
Procedure setupmenu
Endproc

**************************************************************************************
Procedure setupdatabase
Endproc

**************************************************************************************
Procedure setuplibs
EndProc

**************************************************************************************
Procedure propershutdown
	On Shutdown

	Clear Events
	Release All

	If _vfp.StartMode = 0 && running inside the Visual FoxPro IDE
		Removeproperty(_Screen, "clientpath")
		Removeproperty(_Screen, "datapath")
		On Error && Restore default Error Handling
	Endif

	Close Databases All && closes any open tables and database
	Clear All && Clear all remaingin items from memory

	If _vfp.StartMode = 0
		Cancel
	Else
		Quit
	Endif
Endproc
