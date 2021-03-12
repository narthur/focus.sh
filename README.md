# focus.sh

## Usage

Usage:
`./focus.sh [MINUTES] [TASK_DESCRIPTION]`

Example:
`./focus.sh 30 "do the thing"`

## Setup

```bash
chmod +x ./focus.sh
chmod +X ./hooks/*.sh
```

Create `.env` file:

```
BM_USER='...'
BM_TOKEN='...'
BM_GOAL='...'
SLACK_HOOK='...'
```

Add the following to your .zshrc file:

```bash
alias focus="/path/to/focus.sh/focus.sh"
```

Then run:
`. ~/.zshrc`

In Focus preferences, add to start script:

```bash
/path/to/focus.sh/hooks/start.sh
```

In Focus preferences, add to end script:

```bash
/path/to/focus.sh/hooks/end.sh $FOCUS_ACTUAL_INTERVAL
```

To check what's inside the env in the focus scripts, add this line:

```bash
env > ~/dump2
```
