TASK_ASK="Generate a markdown doc page for the following content:"
PERSONA=`cat prompt/personas/default`
CONSTRAINTS_FILE=`cat prompt/constraints/default`
OUTPUT=`cat prompt/output/output.tmpl`

TASK_CONTENT="$1"

FINAL_PROMPT=$(cat <<-END
$PERSONA

$TASK_ASK
"""
$TASK_CONTENT
"""

$CONSTRAINTS
$OUTPUT
END
)

FINAL_PROMPT=$(echo "$FINAL_PROMPT" | tr '"' '.' | tr "'" " " | sed 's/$/\\/' | sed ':a;N;$!ba;s/\n/\\n/g' )

# send final prompt to openai
RESPONSE=$(scripts/openai/ask.sh "$FINAL_PROMPT")

RESULT=$(jq '.choices[0].text' <<< "$RESPONSE")
RESULT="${RESULT#\"}"
RESULT="${RESULT%\"}"

printf "$RESULT"