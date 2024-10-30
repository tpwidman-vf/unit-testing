#!/bin/bash

# Check if PROJECT_PREFIX is set in the environment
if [ -z "$PROJECT_PREFIX" ]; then
  # Prompt for the project prefix if not set
  read -p "What JIRA prefix does this project use? (e.g., JIRA, WIN): " PROJECT_PREFIX
  export PROJECT_PREFIX  # Set the PROJECT_PREFIX environment variable
else
  echo "Using project prefix: $PROJECT_PREFIX"
fi

# Check if TICKET_NUMBER is set in the environment
if [ -z "$TICKET_NUMBER" ]; then
  # Prompt for the ticket number if it’s not already included
  if [[ "$1" =~ ^(${PROJECT_PREFIX})-[0-9]+ ]]; then
    COMMIT_MSG="$1"
    TICKET_NUMBER=$(echo "$1" | grep -oE "${PROJECT_PREFIX}-[0-9]+") # Extract ticket number
  else
    # Prompt the user for the ticket number if missing
    read -p "Enter the JIRA ticket number (e.g., 123): " TICKET_NUMBER
    export TICKET_NUMBER  # Set the TICKET_NUMBER environment variable
    COMMIT_MSG="${PROJECT_PREFIX}-${TICKET_NUMBER}: $1"
  fi
else
  # If TICKET_NUMBER is set, prepend it to the commit message
  COMMIT_MSG="${PROJECT_PREFIX}-${TICKET_NUMBER}: $1"
fi

# Display the final commit message for confirmation
echo "Commit message will be:"
echo "$COMMIT_MSG"

# Default to true if not set
PROCEED_PROMPT=${PROCEED_PROMPT:-true}

# Ask for confirmation if PROCEED_PROMPT is true
if [ "$PROCEED_PROMPT" = true ]; then
  read -p "Do you want to proceed with this commit message? (y/n): " CONFIRM
  if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "Commit aborted."
    exit 1
  fi
fi

# Use git commit with the modified commit message
git commit -m "$COMMIT_MSG