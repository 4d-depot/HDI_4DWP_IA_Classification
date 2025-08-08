//%attributes = {}
#DECLARE($pos : Integer)

LISTBOX SELECT ROW:C912(*; "List box"; $pos)
Form:C1466.currentItemPosition:=$pos
OBJECT SET SCROLL POSITION:C906(*; "List box"; $pos)
