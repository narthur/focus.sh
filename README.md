# focus.sh

## Usage

Usage:
`./focus.sh <minutes> [<goal1> <goal2>...]`

Example:
`./focus.sh 30 my_goal_1 my_goal_2`

In addition to goals supplied as args, the goal specified in .env with the
`BM_GOAL` option will always be posted to.

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
