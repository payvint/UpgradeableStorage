pragma solidity ^0.4.24;

import "./Storage.sol";

contract UsersStorage {
    
    address public owner;
    mapping(uint => Storage.UpgradeableStorage) private users;
    uint public numberOfUsers;

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function transferOwnership(address newOwner) onlyOwner {
        require(newOwner != address(0));
        owner = newOwner;
    }

    function addUintData(uint indexOfUser, string fieldName, uint data) public {
        Storage.addUintField(users[indexOfUser], fieldName, data);
    }

    function upgradeUintData(uint indexOfUser, string fieldName, uint data) public {
        Storage.upgradeUintField(users[indexOfUsers], fieldName, data)
    }

    function showUintData(uint indexOfUser, string fieldName) public return (uint) {
        require(Storage.getFieldType(users[indexOfUser]) == "uint");
        return Storage.showUintField(users[indexOfUser], fieldName);
    }

    function addStringData(uint indexOfUser, string fieldName, string data) public {
        Storage.addAddressField(users[indexOfUser], fieldName, data);
    }

    function upgradeStringData(uint indexOfUser, string, fieldName, string data) public {
        Storage.upgradeStringField(users[indexOfuser], fieldName, data);
    }

    function showStringData(uint indexOfUser, string fieldName) public returns (uint) {
        require(Storage.getFieldType(users[indexOfUser]) == "string"); 
        return Storage.showStringField(users[indexOfUser], fieldName);
    }
}
