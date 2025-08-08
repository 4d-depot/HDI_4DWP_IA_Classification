Case of 
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.documents:=ds:C1482.Document.all()
		Form:C1466.currentItem:=New object:C1471
		OBJECT SET ENABLED:C1123(*; "btnAdd"; False:C215)
		CALL FORM:C1391(Current form window:C827; "selectListItem"; 1)
End case 