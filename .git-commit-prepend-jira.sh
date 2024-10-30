#!/bin/bash

# Get the project prefix from the environment variable or prompt the user
PROJECT_PREFIX=${PROJECT_PREFIX:-"JIRA"} # Default to JIRA if no environment variable is set

# Prompt for the ticket number if it’s not already included
if [[ "$1" =~ ^(${PROJECT_PREFIX})-[0-9]+ ]]; then
  COMMIT_MSG="$1"
else
  # Prompt the user for the ticket number if missing
  read -p "Enter the JIRA ticket number (e.g., 123): " TICKET_NUMBER
  COMMIT_MSG="${PROJECT_PREFIX}-${TICKET_NUMBER}: $1"
fi

# Use git commit with the modified commit message
git commit -m "$COMMIT_MSG"