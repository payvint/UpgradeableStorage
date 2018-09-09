pragma solidity ^0.4.24;

import "./UsersStorage.sol";
import "./States.sol";

contract UsersFunctionalityUpgraded {

    address addressOfStates;

    constructor(address newAddressOfStates) public {
        addressOfStates = newAddressOfStates;
    }

    function createUser(string name, uint age, string email, uint phone) public returns (uint indexOfUser) {
        address addressOfUsersStorage = States(addressOfStates).getAddressOfUsersStorage();
        indexOfUser = UsersStorage(addressOfUsersStorage).getNumberOfUsers();
        UsersStorage(addressOfUsersStorage).incrementNumberOfUsers();
        UsersStorage(addressOfUsersStorage).addStringData(indexOfUser, "Name", name);
        UsersStorage(addressOfUsersStorage).addUintData(indexOfUser, "Age", age);
        UsersStorage(addressOfUsersStorage).addStringData(indexOfUser, "Email", email);
        UsersStorage(addressOfUsersStorage).addUintData(indexOfUser, "Phone", phone);
    }

    function addPhone(uint indexOfUser, uint phone) public {
        address addressOfUsersStorage = States(addressOfStates).getAddressOfUsersStorage();
        require(UsersStorage(addressOfUsersStorage).showUintData(indexOfUser, "Phone") == 0);
        UsersStorage(addressOfUsersStorage).addUintData(indexOfUser, "Phone", phone);
    }
}

