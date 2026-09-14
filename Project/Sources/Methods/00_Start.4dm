//%attributes = {}
C_LONGINT:C283($1)

Case of 
	: (Count parameters:C259=0)
		$pss:=New process:C317(Current method name:C684; 64000; Current method name:C684; Red:K11:4)
		
	Else 
		
		$Ref:=Open form window:C675("splashScreen"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		DIALOG:C40("splashScreen")
		CLOSE WINDOW:C154
		
		If (<>Quit=True:C214)
			QUIT 4D:C291
		Else 
			
			$Ref:=Open form window:C675("HDI-Get_picture_formats"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
			DIALOG:C40("HDI-GET_PICTURE_FORMATS")
			CLOSE WINDOW:C154
			
		End if 
		
End case 

