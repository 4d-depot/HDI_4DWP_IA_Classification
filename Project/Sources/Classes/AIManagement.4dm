property clientAI : Object

// Constructor that initializes the OpenAI client with the provided API key
Class constructor($openAIKey : Text)
	
	This:C1470.clientAI:=cs:C1710.AIKit.OpenAI.new($openAIKey)
	
	// Verifies that the provided API key is valid
Function checkKey() : Boolean
	
	var $result:=This:C1470.clientAI.models.list()
	If ($result.errors.length>0)
		return False:C215
	Else 
		return True:C214
	End if 
	
	// Sends a message list to the AI model and parses the result
Function generateInfo($messages : Collection) : Object
	
	// Define the model to use
	var $model:="gpt-4o-mini"
	
	// Call the OpenAI chat completion API with the given messages and model
	var $result : Variant
	$result:=This:C1470.clientAI.chat.completions.create($messages; {model: $model})
	
	// Parse and return the response as a JSON object
	return JSON Parse:C1218($result.choice.message.text)