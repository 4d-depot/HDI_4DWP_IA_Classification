
Function computeInfo($document : Text; $apiKey : Text) : Object
	var $systemPrompt : Text
	var $messages:=[]
	var $result:={}
	
	// Build the system prompt to instruct the AI
	$systemPrompt:="Analyze the following text and provide the following information: \n"
	$systemPrompt+="1. Suggest a short and relevant title for the document (based on its main topic and tone)."
	$systemPrompt+="2. Determine the main tone of the document(e.g.Positive, Negative, Neutral, Urgent, Informative, etc.) \n"
	$systemPrompt+="3. Suggest 1 to 3 relevant business categories or topics. \n"
	$systemPrompt+="4. Evaluate the writing quality on a scale from 1 to 5, considering clarity, structure, and grammar. \n"
	$systemPrompt+="5. Briefly justify your answers. \n"
	$systemPrompt+="6. Provide a corresponding emoji that reflects the tone, from this list :  \n"
	$systemPrompt+="-Positive → 😀 \n"
	$systemPrompt+="-Negative → 😠 \n"
	$systemPrompt+="-Neutral → 😐 \n"
	$systemPrompt+="-Informative → 🧾 \n"
	$systemPrompt+="-Urgent/Critical → 🚨 \n"
	$systemPrompt+="-Constructive Feedback → 🤔 \n"
	$systemPrompt+="-Mixed → 😶‍🌫️ \n"
	$systemPrompt+="-Escalation → 🔥 \n"
	$systemPrompt+="- Action-Oriented → ✅ \n"
	$systemPrompt+="\n"
	
	// Define the expected JSON structure for the response
	$systemPrompt+="Respond in the following JSON format (no balise code): \n"
	$systemPrompt+="{"
	$systemPrompt+="\"title\": \"string\", "
	$systemPrompt+="\"tone\": \"string\", "
	$systemPrompt+="\"tone_emoji\": \"string\","
	$systemPrompt+="\"tags\": \"string\", "
	$systemPrompt+="\"quality_score\": number, "
	$systemPrompt+="\"quality_comment\": \"string\""
	$systemPrompt+="}"
	$systemPrompt+="\n"
	
	// Add the system instructions
	$messages.push({role: "system"; content: $systemPrompt})
	
	// Add the user input (the actual document content)
	$messages.push({role: "user"; content: $document})
	
	// Create an instance of the AI handler and get the result from the chat API
	$result:=cs:C1710.AIManagement.new($apiKey).generateInfo($messages)
	
	// Return the result as a object
	return $result
	