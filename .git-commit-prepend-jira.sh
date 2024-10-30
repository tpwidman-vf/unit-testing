#!/bin/bash

# Default to true if not set
PROCEED_PROMPT=${PROCEED_PROMPT:-true}

# Check if PROJECT_PREFIX is set, if not prompt for it
if [ -z "$PROJECT_PREFIX" ]; then
  read -p "What JIRA prefix does this project use? (e.g., JIRA, WIN): " PROJECT_PREFIX
  export PROJECT_PREFIX
fi

# Check if TICKET_NUMBER is set, if not prompt for it
if [ -z "$TICKET_NUMBER" ]; then
  read -p "Enter the JIRA ticket number (e.g., 123): " TICKET_NUMBER
  export TICKET_NUMBER
fi

# Create the commit message
COMMIT_MSG="$1"
if [[ "$COMMIT_MSG" =~ ^(${PROJECT_PREFIX})-[0-9]+ ]]; then
  COMMIT_MSG="$1"
else
  COMMIT_MSG="${PROJECT_PREFIX}-${TICKET_NUMBER}: $1"
fi

# Output the commit message
echo "Commit message will be:"
echo "$COMMIT_MSG"

# Ask for confirmation if PROCEED_PROMPT is true
if [ "$PROCEED_PROMPT" = true ]; then
  read -p "Do you want to proceed with this commit message? (y/n): " CONFIRM
  if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "Commit aborted."
    exit 1
  fi
else
  echo "Final Commit Message: $COMMIT_MSG"
fi

# Use git commit with the modified commit message
git commit -m "$COMMIT_MSG"