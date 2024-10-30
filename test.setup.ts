// Use this to configure your local environment variables
const env = {
    LOGGINGLEVEL: 'debug',
    STAGE: 'test',
    AWS_REGION: 'us-east-1',
  };
  
  Object.assign(process.env, env);