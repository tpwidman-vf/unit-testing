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

This script allows you to prepend a JIRA ticket number to your commit messages easily. It helps enforce the practice of associating commits with relevant JIRA tickets, ensuring better traceability of changes.

### Usage

To use the script, set up an alias in your `.gitconfig` or `.git/config`:

```ini
[alias]
    cmj = "!sh ./.git-commit-prepend-jira.sh"
```
Then you can use it like:
```
> git cmj "updates to x,y,z"
Enter the JIRA ticket number (e.g., 123): 123
Commit message will be:
JIRA-123 updates to x,y,z
```

### Environment Variables

These can be set in advanced or when prompted they will be set by the bash script.

- **PROJECT_PREFIX**: Set this to customize the prefix for your ticket numbers (e.g., `JIRA`, `WIN`, etc.). Defaults to `JIRA`.
- **TICKET_NUMBER**: Optionally set this environment variable to avoid being prompted for a ticket number repeatedly. If set, the script will use this value for the current commit.
- **PROCEED_PROMPT**: Set this to `false` if you want to skip the confirmation step (default is `true`).

https://github.com/conventional-changelog/commitlint/tree/master/@commitlint/config-conventional
