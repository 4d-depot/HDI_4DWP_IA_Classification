

Open form window:C675("DocumentCreate")
DIALOG:C40("DocumentCreate"; Form:C1466)
Form:C1466.documents:=ds:C1482.Document.all()

If (OK=1)
	LISTBOX SELECT ROW:C912(*; "List box"; Form:C1466.documents.length)
	Form:C1466.currentItemPosition:=Form:C1466.documents.length
Else 
	LISTBOX SELECT ROW:C912(*; "List box"; Form:C1466.currentItemPosition)
End if 

