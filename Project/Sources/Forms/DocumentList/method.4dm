Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.documents:=ds:C1482.Document.all()
		Form:C1466.currentItem:=New object:C1471
		OBJECT SET ENABLED:C1123(*; "btnAdd"; False:C215)
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Timer:K2:25)
		LISTBOX SELECT ROW:C912(*; "List box"; 1)
		Form:C1466.currentItemPosition:=1
		SET TIMER:C645(0)
End case 