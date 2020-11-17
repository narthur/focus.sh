#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

set -o allexport
source "${BASH_SOURCE%/*}/.env"
set +o allexport

MIN=$1

re='^[0-9]+$'
if ! [[ $MIN =~ $re ]] ; then
   echo "error: Not a number. Exiting." >&2; exit 1
fi

MESSAGE="Nathan is focusing for ${MIN} minutes"
echo "${MESSAGE}"
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" "${SLACK_HOOK}"

curl -X POST "https://www.beeminder.com/api/v1/users/${BM_USER}/goals/${BM_GOAL}/datapoints.json" \
    -d auth_token="${BM_TOKEN}" \
    -d value="$((MIN / 60))" \
    -d comment="$2"
open "focus://focus?minutes=${MIN}"
sleep "$((MIN * 60))"

MESSAGE="Nathan is done focusing"
printf "\n"
echo "${MESSAGE}"
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" "${SLACK_HOOK}"
