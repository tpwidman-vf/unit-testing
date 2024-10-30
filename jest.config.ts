import { join } from 'path';
import type { JestConfigWithTsJest } from 'ts-jest/dist/types';

const config: JestConfigWithTsJest = {
  setupFiles: [join(__dirname, 'test.setup.ts')],
  preset: 'ts-jest',
  testEnvironment: 'node',
  testRegex: '(/__tests__/.*|(\\.|/)(test|spec))\\.tsx?$',
  transform: {
    '^.+\\.tsx?$': 'ts-jest',
  },
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json', 'node'],
  collectCoverage: true,
  coverageDirectory: 'coverage',
  coverageReporters: ['lcov', 'html'],
  testResultsProcessor: 'jest-sonar-reporter',
};

export default config;