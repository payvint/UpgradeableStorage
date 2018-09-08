pragma solidity ^0.4.24;

import "./UsersStorage.sol";

contract UsersFunctionality {

    address addressOfStates;

    constructor(address newAddressOfStates) public {
        addressOfStates = newAddressOfStates;
    }
    
    function createUser(string name, uint age, string email) public {
        
    }
}
