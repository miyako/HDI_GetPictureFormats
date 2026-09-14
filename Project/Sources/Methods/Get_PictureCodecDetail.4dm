//%attributes = {"invisible":true}
///////////////////////////////////////////////////////////////
// Get the codec list
///////////////////////////////////////////////////////////////
Init_codecDetail

ARRAY TEXT:C222($PictureCodecIDList; 0)
//Get all the formats saved in Pict1
GET PICTURE FORMATS:C1406([Table_1:1]Field_3:3; $PictureCodecIDList)

//Get the codec supported by your OS
ARRAY TEXT:C222($SupportedOSCodecIDList; 0)
PICTURE CODEC LIST:C992($SupportedOSCodecIDList)

//For all the codec IDs found in the picture
var $i : Integer
For ($i; 1; Size of array:C274($PictureCodecIDList))
	//if the current codec is supported by the OS
	If (Find in array:C230($SupportedOSCodecIDList; $PictureCodecIDList{$i})#-1)
		//The code below aims to prepare a C_PICTURE variable in order to know if the current format is deprecated or not.
		var $pictureInSignleFormat : Picture
		$pictureInSignleFormat:=[Table_1:1]Field_3:3
		CONVERT PICTURE:C1002($pictureInSignleFormat; $PictureCodecIDList{$i})
		var $isPictureDeprecated : Integer
		//This command is contained in the 4D Pack plugin and permits to know if the C_PICTURE variable contains a deprecated format.
		$isPictureDeprecated:=_o_AP_Is_Picture_Deprecated(->$pictureInSignleFormat)
		//if the image contains a pict format which is deprecated
		If ($isPictureDeprecated=1)
			txtCodecDetail:=txtCodecDetail+"   - "+$PictureCodecIDList{$i}+Localized string("Msg_CodecDeprecated")+"\n"
			// else the format is fully supported
		Else 
			txtCodecDetail:=txtCodecDetail+"   - "+$PictureCodecIDList{$i}+Localized string("Msg_CodecSupported")+"\n"
		End if 
		//if the codec is NOT supported
	Else 
		txtCodecDetail:=txtCodecDetail+"   - "+$PictureCodecIDList{$i}+Localized string("Msg_CodecNotSupported")+"\n"
	End if 
	
End for 
