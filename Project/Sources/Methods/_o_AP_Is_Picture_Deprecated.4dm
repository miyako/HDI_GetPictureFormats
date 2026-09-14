//%attributes = {"invisible":true}
#DECLARE($pPicture : Pointer) : Integer

ARRAY TEXT:C222($codecs; 0)
GET PICTURE FORMATS:C1406($pPicture->; $codecs)

Case of 
	: (Find in array:C230($codecs; ".pict")#-1)
		return 1
End case 

return 0