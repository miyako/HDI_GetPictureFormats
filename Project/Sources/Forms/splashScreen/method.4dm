Case of 
	: (Form event code:C388=On Load:K2:1)
		
		//get the current 4D version
		$vers:=Application version:C493
		//get the list of installed plugin
		ARRAY TEXT:C222($pluginNames; 0)
		ARRAY LONGINT:C221($pluginId; 0)
		PLUGIN LIST:C847($pluginId; $pluginNames)
		Case of 
				
			: ($vers<"1540")  //1540 means 15R4   1404 means 14.4
				
				<>Quit:=True:C214
				OBJECT SET TITLE:C194(*; "BtnDemo"; "Quit 4D")
				OBJECT SET VISIBLE:C603(*; "TxtInfo@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Txt64bit"; False:C215)
				OBJECT SET VISIBLE:C603(*; "TxtSorry@"; True:C214)
				
				//if 4D Pack plugin is not installed
				//: (Find in array($pluginNames; "4D Pack")<0)
				//<>Quit:=True
				//OBJECT SET TITLE(*; "BtnDemo"; "Quit 4D")
				//OBJECT SET VISIBLE(*; "TxtInfo@"; False)
				//OBJECT SET VISIBLE(*; "Txt64bit"; False)
				//OBJECT SET VISIBLE(*; "TxtPlugin@"; True)
			Else 
				<>Quit:=False:C215
		End case 
		
End case 