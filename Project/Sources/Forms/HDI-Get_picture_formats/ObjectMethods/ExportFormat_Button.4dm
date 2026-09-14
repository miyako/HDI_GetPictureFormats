//Create a new picture variable that contains the converted picture
C_PICTURE:C286(convertedPicture)
convertedPicture:=[Table_1:1]Field_3:3
CONVERT PICTURE:C1002(convertedPicture; LstFormat{lstBoxFormats})

// This code permits to get the size of the original and export picture, thus the saved space
C_TEXT:C284($pictureSizeBeforeConvert; $pictureSizeAfterConvert; $bytesSaved)
C_LONGINT:C283($longint_pictureSizeBeforeConver; $longint_pictureSizeAfterConvert)
$longint_pictureSizeBeforeConver:=Picture size:C356([Table_1:1]Field_3:3)
$longint_pictureSizeAfterConvert:=Picture size:C356(convertedPicture)
$pictureSizeAfterConvert:=ConvertInKB($longint_pictureSizeAfterConvert)

$bytesSaved:=ConvertInKB($longint_pictureSizeBeforeConver-$longint_pictureSizeAfterConvert)

//Set the text displayed after the export
C_TEXT:C284(txtSizeAfterConvertion)
txtSizeAfterConvertion:="Size after export : "+$pictureSizeAfterConvert+" .\n\n"
txtSizeAfterConvertion:=txtSizeAfterConvertion+"You saved : "+$bytesSaved+" \n\n"
txtSizeAfterConvertion:=txtSizeAfterConvertion+"Format detail: "+LstFormat{lstBoxFormats}