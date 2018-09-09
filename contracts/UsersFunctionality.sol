pragma solidity ^0.4.24;

import "./UsersStorage.sol";
import "./States.sol";

contract UsersFunctionality {

    address addressOfStates;

    constructor(address newAddressOfStates) public {
        addressOfStates = newAddressOfStates;
    }
    
    function createUser(string name, uint age, string email) public {
       address addressOfUsersStorage = States(addressOfStates).getAddressOfUsersStorage();
       uint indexOfUser = UsersStorage(addressOfUsersStorage).getNumberOfUsers();
       UsersStorage(addressOfUsersStorage).incrementNumberOfUsers();
       UsersStorage(addressOfUsersStorage).addStringData(indexOfUser, "Name", name);
       UsersStorage(addressOfUsersStorage).addUintData(indexOfUser, "Age", age);
       UsersStorage(addressOfUsersStorage).addStringData(indexOfUser, "Email", email);
    }
}
