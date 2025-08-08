//%attributes = {}
var $infos : Object
var $apiKey : Text
var $documents : cs:C1710.DocumentSelection
var $doc : cs:C1710.DocumentEntity

$apiKey:="____ Enter API key ____"

// Load all documents
$documents:=ds:C1482.Document.all()

For each ($doc; $documents)
	
	// Call the ChatManagement class to analyze the 4D Write Pro document content
	$infos:=cs:C1710.ChatManagement.new().computeInfo(WP Get text:C1575($doc.WP); $apiKey)
	
	// Assign metadata returned by the AI
	$doc.Title:=$infos.title
	$doc.Tone:=$infos.tone
	$doc.Tone_Emoji:=$infos.tone_emoji
	$doc.Tags:=$infos.tags
	$doc.Quality_Score:=$infos.quality_score
	$doc.Quality_Comment:=$infos.quality_comment
	
	// Save the entity to the database
	$doc.save()
	
End for each 
