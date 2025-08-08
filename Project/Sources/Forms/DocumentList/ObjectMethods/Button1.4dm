var $o:={}
Open form window:C675("Request"; Modal form dialog box:K39:7)
DIALOG:C40("Request"; $o)

Form:C1466.apiKey:=$o.apiKey

If (cs:C1710.AIManagement.new($o.apiKey).checkKey())
	OBJECT SET ENABLED:C1123(*; "btnAdd"; True:C214)
	
Else 
	OBJECT SET ENABLED:C1123(*; "btnAdd"; False:C215)
	ALERT:C41("Incorrect API Key")
End if 