const Web3 = require('web3');
const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

const jsonData = require("../data.json");
const UsersFunctionality = new web3.eth.Contract(jsonData['users_functionality_abi'], jsonData['users_functionality_address']);
const UsersFunctionalityUpgraded = new web3.eth.Contract(jsonData['users_functionality_upgraded_abi'], jsonData['users_functionality_upgraded_address']);
const States = new web3.eth.Contract(jsonData['states_abi'], jsonData['states_address']);

/*let names = new Array(1000);
let ages = new Array(1000);
let emails = new Array(1000);
let phones = new Array(1000);*/

async function run() {
  let firstName = 'Chadwick';
  let firstAge = 17;
  let firstEmail = 'chadwick@mail.com';
  let firstPhone = 123456789123;
  let secondName = 'Cristine';
  let secondAge = 18;
  let secondEmail = 'cristine@mail.com';
  let secondPhone = 223456789123;

  let firstUser = await UsersFunctionality.methods.createUser(firstName, firstAge, firstEmail).send();
  let firstUserIndex;
  await States.methods.addFunctionality(jsonData['users_functionality_upgraded_address']).send();
  let secondUser = await UsersFunctionalityUpgraded.methods.createUser(secondName, secondAge, secondEmail, secondPhone).send();
  let secondUserIndex;
  await UsersFunctionalityUpgraded.methods.addPhone(firstUserIndex, firstPhone);
}

run();
