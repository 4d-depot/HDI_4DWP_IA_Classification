If (Form:C1466.trace)
	TRACE:C157
End if 

var $ent : cs:C1710.DocumentEntity
var $infos : Object

// Call the ChatManagement class to analyze the 4D Write Pro document content
// Returns an object with title, tone, tags, quality score, and comments
$infos:=cs:C1710.ChatManagement.new().computeInfo(WP Get text:C1575(Form:C1466.WP); Form:C1466.apiKey)

// Create a new document entity
$ent:=ds:C1482.Document.new()

// Assign the original Write Pro document to the entity
$ent.WP:=Form:C1466.WP

// Assign metadata returned by the AI
$ent.Title:=$infos.title
$ent.Tone:=$infos.tone
$ent.Tone_Emoji:=$infos.tone_emoji
$ent.Tags:=$infos.tags
$ent.Quality_Score:=$infos.quality_score
$ent.Quality_Comment:=$infos.quality_comment

// Save the entity to the database
$ent.save()


ACCEPT:C269