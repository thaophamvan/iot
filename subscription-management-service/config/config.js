const _ = require('./node_modules/lodash');

// module variables
const config = require('./config.json.js');
const defaultConfig = config.development;
// environment variables
process.env.NODE_ENV = 'Prod';
const environment = process.env.NODE_ENV || 'Stage';

console.log(`environment ${environment}`);
const environmentConfig = config[environment];
const finalConfig = _.merge(defaultConfig, environmentConfig);

// as a best practice
// all global variables should be referenced via global. syntax
// and their names should always begin with g
global.gConfig = finalConfig;

// log global.gConfig
//console.log(`global.gConfig: ${JSON.stringify(global.gConfig, undefined, global.gConfig.json_indentation)}`);