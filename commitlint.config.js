// commitlint.config.js
const allowedPrefixes = ['WIN', 'JIRA']; // Add any prefixes you need here

module.exports = {
  rules: {
    // Enforce commit messages like "WIN-123: Commit message"
    'header-pattern': [
      2,
      'always',
      new RegExp(`^(${allowedPrefixes.join('|')})-[0-9]+: .+$`)
    ]
  },
  parserPreset: {
    parserOpts: {
      issuePrefixes: allowedPrefixes.map(prefix => `${prefix}-`)
    }
  }
};