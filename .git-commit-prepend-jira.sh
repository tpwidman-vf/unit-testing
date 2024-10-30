#!/bin/bash

# Get the project prefix from the environment variable or use "JIRA" as default
PROJECT_PREFIX=${PROJECT_PREFIX:-"JIRA"} # Default to JIRA if no environment variable is set

# Default PROCEED_PROMPT to true if not set
PROCEED_PROMPT=${PROCEED_PROMPT:-true}

# The original commit message
ORIGINAL_MESSAGE="$1"

# Check if the commit message already contains the ticket number
if [[ "$ORIGINAL_MESSAGE" =~ ^(${PROJECT_PREFIX})-[0-9]+ ]]; then
  COMMIT_MSG="$ORIGINAL_MESSAGE"
else
  # Prompt the user for the ticket number if missing
  read -p "Enter the ${PROJECT_PREFIX} ticket number (e.g., 123): " TICKET_NUMBER
  COMMIT_MSG="${PROJECT_PREFIX}-${TICKET_NUMBER} $ORIGINAL_MESSAGE"
fi

# Display the final commit message
echo "Commit message will be:"
echo "$COMMIT_MSG"

# Check the PROCEED_PROMPT environment variable
if [[ "${PROCEED_PROMPT}" == "true" ]]; then
  # Ask for confirmation before proceeding
  read -p "Do you want to proceed with this commit message? (y/n): " CONFIRM

  if [[ "$CONFIRM" == "y" || "$CONFIRM" == "Y" ]]; then
    # Use git commit with the modified commit message
    git commit -m "$COMMIT_MSG"
  else
    echo "Commit aborted."
  fi
else
  # Proceed without confirmation
  git commit -m "$COMMIT_MSG"
fi