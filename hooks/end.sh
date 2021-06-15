set -o allexport
source "${BASH_SOURCE%/*}/../.env"
set +o allexport

TIME=$1

curl -X POST "https://www.beeminder.com/api/v1/users/${BM_USER}/goals/${BM_GOAL}/datapoints.json" \
    -d auth_token="${BM_TOKEN}" \
    -d value="$(echo "${TIME} / 60" | bc -l)" \
    -d comment="$2"

osascript <<END
tell application "slack"
    activate
end tell
END
