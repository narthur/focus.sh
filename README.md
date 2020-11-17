# focus.sh

## Usage

Usage:
`./focus.sh [MINUTES] [TASK_DESCRIPTION]`

Example:
`./focus.sh 30 "do the thing"`

## Setup

`chmod +x ./focus.sh`

Create `.env` file:

```
BM_USER='...'
BM_TOKEN='...'
BM_GOAL='...'
SLACK_HOOK='...'
```

Optional: Add the following to your .zshrc file:
`alias focus="/path/to/focus.sh/focus.sh"`

Then run:
`. ~/.zshrc`
