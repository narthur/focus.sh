#!/bin/bash

set -o allexport
source "${BASH_SOURCE%/*}/.env"
set +o allexport

MIN=$1
COMMENT=$2
START=$(date +%s)

re='^[0-9]+$'
if ! [[ $MIN =~ $re ]] ; then
   echo "error: Not a number. Exiting." >&2; exit 1
fi

post()
{
  curl -X POST "https://www.beeminder.com/api/v1/users/${BM_USER}/goals/${BM_GOAL}/datapoints.json" \
    -d auth_token="${BM_TOKEN}" \
    -d value="$1" \
    -d comment="${COMMENT}"
}

handler()
{
    MESSAGE="Nathan is done focusing"
    printf "\n"
    echo "${MESSAGE}"
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" "${SLACK_HOOK}"

    open "focus://unfocus"

    END=$(date +%s)
    SECONDS=$((END-START))
    MINUTES=$(echo "${SECONDS} / 60" | bc -l)
    echo "${MINUTES} minutes"
    post "$(echo "${MINUTES} / 60" | bc -l)"

    osascript <<END
tell application "slack"
    activate
end tell
END

    exit
}

trap handler SIGINT

MESSAGE="Nathan is focusing for ${MIN} minutes"
echo "${MESSAGE}"
curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"${MESSAGE}\"}" "${SLACK_HOOK}"

open "focus://focus?minutes=${MIN}"
sleep "$((MIN * 60))"

handler
