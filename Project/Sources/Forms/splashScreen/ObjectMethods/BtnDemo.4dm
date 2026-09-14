//%attributes = {"invisible":true}
//the button already has "accept" standard action
If (Form event code:C388=On Clicked)
	
	If (Form.quit)
		INVOKE ACTION(ak return to design mode)
	Else 
		
		var $window : Integer
		$window:=Open form window:C675("HDI-Get_picture_formats"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		SET WINDOW TITLE(Get window title(Current form window); $window)
		DIALOG:C40("HDI-Get_picture_formats"; *)
		
	End if 
	
End if 
