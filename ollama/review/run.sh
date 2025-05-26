# Variables

OLLAMA_HOST="http://192.168.2.2:11434"
OLLAMA_MODEL="qwen3:14b"
BASE_BRANCH=main

REVIEW_PROMPT='
  You have a git diff for some file.
  Search for obvious bugs, defects, inoptimal solutions, code smells, weird names, inconsitencies in code.
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
    --arg format '
      {
        "type":"array",
        "description": "list of found issues, leave it empty if there are no issues",
        "items": {
          "type": "object",
          "description": "issue object",
          "properties": {
            "summary": {
              "type":"string",
              "description": "issue brief summary in one sentense"
            },
            "description": {
              "type":"string",
              "description": "issue description, 500 words max"
            },
            "codeReference": {
              "type":"string",
              "description": "code snippet where the issue has been found"
            }
          },
          "required": [
            "summary",
            "description"
          ]
        }
      }'\
    --arg options '{"temperature": 0.2, "repeat_penalty": 1.5, "num_predict": 4000}' \
    '{model: $model, raw: $raw | test("true"), stream: $stream | test("true"), prompt: $prompt, format: $format|fromjson, options: $options|fromjson}' > diff.json
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
