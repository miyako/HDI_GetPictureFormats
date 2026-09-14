//%attributes = {"invisible":true}
//$1:=size to convert in byte
C_LONGINT:C283($1; $KB; $bytes)
C_TEXT:C284($0)

$KB:=$1/1024
$0:=String:C10($KB)+" Kb"
