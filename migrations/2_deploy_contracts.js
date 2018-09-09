let Storage = artifacts.require("./Storage.sol");
let States = artifacts.require("./States.sol");

let UsersStorage = artifacts.require("./UsersStorage.sol");
let UsersFunctionality = artifacts.require("./UsersFunctionality.sol");
let UsersFunctionalityUpgraded = artifacts.require("./UsersFunctionalityUpgraded.sol");

/*async function deploy(deployer) {
    await deployer.deploy(Storage, {gas: 4712000});
    await deployer.link(Storage, UsersStorage);
    await deployer.deploy(UsersStorage, {gas: 4712000});
    await deployer.deploy(States, UsersStorage.address, {gas: 4712000});
    await deployer.deploy(UsersFunctionality, States.address, {gas: 4712000});
    await deployer.deploy(UsersFunctionalityUpgraded, States.address, {gas: 4712000});
    await States.at(States.address).addFunctionality(UsersFunctionality.address);

    let fs = require("fs");
    let jsonObject = {
        storage_address: Storage.address,
        storage_abi: Storage.abi,
        states_address: States.address,
        states_abi: States.abi,
        users_storage_address: UsersStorage.address,
        users_storage_abi: UsersStorage.abi,
        users_functionality_address: UsersFunctionality.address,
        users_functionality_abi: UsersFunctionality.abi,
        users_functionality_upgraded_address: UsersFunctionalityUpgraded.address,
        users_functionality_upgraded_abi: UsersFunctionalityUpgraded.abi
    }

    fs.writeFile("data.json", JSON.stringify(jsonObject), function (err) {
        if (err) {
            return console.log(err);
        }
    });
}*/

module.exports = function (deployer) {
    return deployer.then(async () => {
        await deployer.deploy(Storage, {gas: 4712000});
        await deployer.link(Storage, UsersStorage);
        await deployer.deploy(UsersStorage, {gas: 4712000});
        await deployer.deploy(States, UsersStorage.address, {gas: 4712000});
        await deployer.deploy(UsersFunctionality, States.address, {gas: 4712000});
        await deployer.deploy(UsersFunctionalityUpgraded, States.address, {gas: 4712000});
        await States.at(States.address).addFunctionality(UsersFunctionality.address);

    let fs = require("fs");
    let jsonObject = {
        storage_address: Storage.address,
        storage_abi: Storage.abi,
        states_address: States.address,
        states_abi: States.abi,
        users_storage_address: UsersStorage.address,
        users_storage_abi: UsersStorage.abi,
        users_functionality_address: UsersFunctionality.address,
        users_functionality_abi: UsersFunctionality.abi,
        users_functionality_upgraded_address: UsersFunctionalityUpgraded.address,
        users_functionality_upgraded_abi: UsersFunctionalityUpgraded.abi
    }

    fs.writeFile("data.json", JSON.stringify(jsonObject), function (err) {
        if (err) {
            return console.log(err);
        }
    });

});
}
