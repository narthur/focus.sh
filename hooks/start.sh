set -o allexport
source "${BASH_SOURCE%/*}/../.env"
set +o allexport

MESSAGE="Nathan is starting a focus session"
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" "${SLACK_HOOK}"
