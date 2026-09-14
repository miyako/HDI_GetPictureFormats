//%attributes = {"invisible":true}
var $fp; $fpTxtwelcomeDemo1; $fpTxtwelcomeDemo2 : Text
$fp:=Localized document path:C1105("txtWelcome.txt")
$fpTxtwelcomeDemo1:=Localized document path:C1105("TxtwelcomeDemo1.txt")
$fpTxtwelcomeDemo2:=Localized document path:C1105("TxtwelcomeDemo2.txt")

Case of 
	: (Form event code:C388=On Page Change:K2:54)
		Case of 
			: (FORM Get current page:C276=2)
				ALL RECORDS:C47([Table_1:1])
			: (FORM Get current page:C276=3)
				QUERY:C277([Table_1:1]; [Table_1:1]ID:1=4)
		End case 
		
	: (Form event code:C388=On Load:K2:1)
		//Get the multistyle texte from the ressources and display it.
		var <>txtWelcome; <>txtWelcomeDemo1; <>txtWelcomeDemo2 : Text
		<>txtWelcome:=Document to text:C1236($fp)
		<>txtWelcomeDemo1:=Document to text:C1236($fpTxtwelcomeDemo1)
		<>txtWelcomeDemo2:=Document to text:C1236($fpTxtwelcomeDemo2)
		
		ALL RECORDS:C47([Table_1:1])
		
		Get_PictureCodecDetail
		
		DisplayTextForDemo2
		
	: (Form event code:C388=On Close Box:K2:21)
		TEXT TO DOCUMENT:C1237($fp; <>txtWelcome)
		TEXT TO DOCUMENT:C1237($fpTxtwelcomeDemo1; <>txtWelcomeDemo1)
		TEXT TO DOCUMENT:C1237($fpTxtwelcomeDemo2; <>txtWelcomeDemo2)
		CANCEL:C270
End case 
