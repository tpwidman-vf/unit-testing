# unit-testing
This project is for testing scripts & results from unit tests

## Git Commit Message Enforcement and Optional JIRA Ticket Prepend

This project enforces commit messages to include JIRA ticket IDs using [Husky](https://typicode.github.io/husky) and [CommitLint](https://commitlint.js.org/). 

## Setup Instructions

1. **Commit Message Rules**:  
   Each commit message must start with a JIRA ticket ID, such as `JIRA-123: Initial commit`.

2. **Optional JIRA Prepend Script**:  
   Use the `.git-commit-prepend-jira.sh` script to prepend a ticket ID to your message.

   Example usage:
   ```bash
   export PROJECT_PREFIX=WIN
   ./git-commit-prepend-jira.sh "Your commit message here"

https://github.com/conventional-changelog/commitlint/tree/master/@commitlint/config-conventional
