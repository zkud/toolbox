# Variables

OLLAMA_HOST="http://192.168.2.2:11434"
OLLAMA_MODEL="qwen3:8b"
BASE_BRANCH=main

REVIEW_PROMPT='
  You have a git diff for some file.
  Search for obvious bugs, defects, inoptimal solutions, inconsitencies in code.
'

CURL_MAX_RESPONSE_TIME=300 # 5 minutes

# Create a temporary file to store the file names 
temp_file=$(mktemp)
  
# Extract file names from the diff and store them in the temporary file
git diff $BASE_BRANCH --name-only > "$temp_file"  
  
# Iterate through the file names
while IFS= read -r filename; do 
  # Extract the content of the file using git show
  echo "# REVIEW for $filename"
  # Build ollama payload to generate code review
  jq -n \
    --arg model "$OLLAMA_MODEL" \
    --arg raw true \
    --arg stream false \
    --arg prompt "$REVIEW_PROMPT File diff: $(git diff $BASE_BRANCH -p --raw -- "$filename")" \
    --arg format '{"type":"array","description":"list of found issues","items":{"type":"object","description":"issue object","properties":{"shortSummary":{"type":"string"},"codeReference":{"type":"string"}}}}'\
    '{model: $model, raw: $raw | test("true"), stream: $stream | test("true"), prompt: $prompt, format: $format|fromjson}' > diff.json
  curl \
    --silent \
    --max-time $CURL_MAX_RESPONSE_TIME \
    --location "$OLLAMA_HOST/api/generate" \
    -H "content-type: application/json" \
    --data-binary @diff.json | jq -r ".response"
  sleep 1 # cooldown to avoid DOS of the ollama
done < "$temp_file" 
  
# Clean up the temporary files
rm "$temp_file"
rm diff.json
