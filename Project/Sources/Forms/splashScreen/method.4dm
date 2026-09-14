//%attributes = {"invisible":true}
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		var $vers : Text
		//get the current 4D version
		$vers:=Application version:C493
		
		Case of 
				
			: ($vers<"1540")  //1540 means 15R4   1404 means 14.4
				
				Form.quit:=True:C214
				OBJECT SET TITLE:C194(*; "BtnDemo"; Localized string("Splash_BtnClose"))
				OBJECT SET VISIBLE:C603(*; "TxtInfo@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Txt64bit"; False:C215)
				OBJECT SET VISIBLE:C603(*; "TxtSorry@"; True:C214)
				
			Else 
				Form.quit:=False:C215
		End case 
		
End case 
