pragma solidity ^0.4.24;

contract States {

    address owner;
    address private addressOfUsersStorage;
    address addressOfUsersFunctionality;

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    constructor(address newAddressOfUsersStorage, address newAddressOfUsersFunctionality) public {
        owner = msg.sender;
        addressOfUsersStorage = newAddressOfUsersStorage;
        addressOfUsersFunctionality = newAddressOfUsesrsFunctionality;
    }

    function upgradeFunctionality(address newAddressOfUsersFunctionality) public onlyOwner {
        require (newAddressOfUsersFunctionality != address(0));
        addressOfUsersFunctionality = newAddressOfUsesrsFunctionality;
    }

    function getAddressOfusersStorage() public view returns (address) {
        require(msg.sender == addressOfUsersfunctionality);
        return addressOfUsersStorage;
    }
}
