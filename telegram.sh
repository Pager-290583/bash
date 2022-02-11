#/bin/zsh

CHAT_ID="617689087"
TEXT="$1"
BOT_AUTH_TOKEN="5143292224:AAG0jIVQedkEzrHyHzxateADcM7Grswj_dM"

curl -sS -i --max-time 30 \
        --header 'Content-Type: application/json' \
        --request 'POST' \
        --data '{"chat_id": "'"${CHAT_ID}"'", "text": "'"${TEXT}"'"}' \
        "https://api.telegram.org/bot${BOT_AUTH_TOKEN}/sendMessage" 2>&1