

Open form window:C675("DocumentCreate")
DIALOG:C40("DocumentCreate"; Form:C1466)
Form:C1466.documents:=ds:C1482.Document.all()

If (OK=1)
	CALL FORM:C1391(Current form window:C827; "selectListItem"; Form:C1466.documents.length)
Else 
	CALL FORM:C1391(Current form window:C827; "selectListItem"; Form:C1466.currentItemPosition)
End if 

