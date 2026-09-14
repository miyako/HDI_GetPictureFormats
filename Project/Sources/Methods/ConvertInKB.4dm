//%attributes = {"invisible":true}
//$size=size to convert in byte
#DECLARE($size : Integer)->$result : Text

var $KB : Integer
$KB:=$size/1024
$result:=String:C10($KB)+Localized string("Msg_UnitKB")
