//%attributes = {"invisible":true}
///////////////////////////////////////////////////////////////
// This method displays the text of the orignial picture on Demo 2
///////////////////////////////////////////////////////////////
ARRAY TEXT:C222($PictureCodecIDList; 0)
//Get all the formats saved in Pict1
GET PICTURE FORMATS:C1406([Table_1:1]Field_3:3; $PictureCodecIDList)

var txtPictureSize : Text
txtPictureSize:=Localized string("Msg_PictureWeight")+ConvertInKB(Picture size:C356([Table_1:1]Field_3:3))
txtPictureSize:=txtPictureSize+".\n\n"+Localized string("Msg_WeightReason")

ARRAY TEXT:C222(LstFormat; 0)
ARRAY TEXT:C222(SizeOfSubPicture; 0)
ARRAY BOOLEAN:C223(SelectedFormat; 0)
ARRAY BOOLEAN:C223(lstBoxFormats; 0)

//Display all the format.-
var $i : Integer
For ($i; 1; Size of array:C274($PictureCodecIDList))
	APPEND TO ARRAY:C911(LstFormat; $PictureCodecIDList{$i})
	var $pictureInSignleFormat : Picture
	$pictureInSignleFormat:=[Table_1:1]Field_3:3
	CONVERT PICTURE:C1002($pictureInSignleFormat; $PictureCodecIDList{$i})
	APPEND TO ARRAY:C911(SizeOfSubPicture; ConvertInKB(Picture size:C356($pictureInSignleFormat)))
	APPEND TO ARRAY:C911(SelectedFormat; False:C215)
	APPEND TO ARRAY:C911(lstBoxFormats; False:C215)
End for 
lstBoxFormats:=1
lstBoxFormats{1}:=True:C214
