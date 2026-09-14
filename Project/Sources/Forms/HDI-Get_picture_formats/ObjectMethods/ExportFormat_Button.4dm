//%attributes = {"invisible":true}
//Create a new picture variable that contains the converted picture
var convertedPicture : Picture
convertedPicture:=[Table_1:1]Field_3:3
CONVERT PICTURE:C1002(convertedPicture; LstFormat{lstBoxFormats})

// This code permits to get the size of the original and export picture, thus the saved space
var $pictureSizeBeforeConvert; $pictureSizeAfterConvert; $bytesSaved : Text
var $longint_pictureSizeBeforeConver; $longint_pictureSizeAfterConvert : Integer
$longint_pictureSizeBeforeConver:=Picture size:C356([Table_1:1]Field_3:3)
$longint_pictureSizeAfterConvert:=Picture size:C356(convertedPicture)
$pictureSizeAfterConvert:=ConvertInKB($longint_pictureSizeAfterConvert)

$bytesSaved:=ConvertInKB($longint_pictureSizeBeforeConver-$longint_pictureSizeAfterConvert)

//Set the text displayed after the export
var txtSizeAfterConvertion : Text
txtSizeAfterConvertion:=Localized string("Msg_SizeAfterExport")+$pictureSizeAfterConvert+" .\n\n"
txtSizeAfterConvertion:=txtSizeAfterConvertion+Localized string("Msg_YouSaved")+$bytesSaved+" \n\n"
txtSizeAfterConvertion:=txtSizeAfterConvertion+Localized string("Msg_FormatDetail")+LstFormat{lstBoxFormats}
