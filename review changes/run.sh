# Variables

OLLAMA_HOST="http://192.168.2.2:11434"
OLLAMA_MODEL="gemma3:12b"
BASE_BRANCH=main

REVIEW_PROMPT='
  Review the file pr changes if you are an architect.
  WRITE IT SHORT.
  REACT ONLY IF THERE IS AN ISSUE (potential bug or code smells)  
  Structure your output by summary + bullet points.
'

CURL_MAX_RESPONSE_TIME=120

# Create a temporary file to store the file names 
temp_file=$(mktemp)
  
# Extract file names from the diff and store them in the temporary file
git diff $BASE_BRANCH --name-only > "$temp_file"  
  
# Iterate through the file names
while IFS= read -r filename; do 
  # Extract the content of the file using git show
  echo "//////////////////////////////////// REVIEW $filename"
  # Build ollama payload to generate code review
  jq -n \
    --arg model "$OLLAMA_MODEL" \
    --arg raw true \
    --arg stream false \
    --arg prompt "$REVIEW_PROMPT File diff: $(git diff $BASE_BRANCH -p --raw -- "$filename")" \
    '{model: $model, raw: $raw | test("true"), stream: $stream | test("true"), prompt: $prompt}' > diff.json
  curl --max-time $CURL_MAX_RESPONSE_TIME \
    --location "$OLLAMA_HOST/api/generate" \
    -H "content-type: application/json" \
    --data-binary @diff.json | jq -r '.response'
  sleep 1 # cooldown to avoid DOS of the ollama
done < "$temp_file" 
  
# Clean up the temporary files
rm "$temp_file"
rm diff.json
