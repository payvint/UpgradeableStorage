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

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        owner = newOwner;
    }

    function getNumberOfUsers() public view returns (uint) {
        return numberOfUsers;
    }

    function incrementNumberOfUsers() public {
        numberOfUsers++;
    }

    function addUintData(uint indexOfUser, string fieldName, uint data) public {
        Storage.addUintField(users[indexOfUser], fieldName, data);
    }

    function upgradeUintData(uint indexOfUser, string fieldName, uint data) public {
        Storage.upgradeUintField(users[indexOfUser], fieldName, data);
    }

    function showUintData(uint indexOfUser, string fieldName) public view returns (uint) {
        string memory uintString = "uint";
        require(keccak256(abi.encodePacked(Storage.getFieldType(users[indexOfUser], fieldName))) == keccak256(abi.encodePacked(uintString)));
        return Storage.showUintField(users[indexOfUser], fieldName);
    }

    function addStringData(uint indexOfUser, string fieldName, string data) public {
        Storage.addStringField(users[indexOfUser], fieldName, data);
    }

    function upgradeStringData(uint indexOfUser, string fieldName, string data) public {
        Storage.upgradeStringField(users[indexOfUser], fieldName, data);
    }

    function showStringData(uint indexOfUser, string fieldName) public view returns (string) {
        string memory stringString = "string";
        require(keccak256(abi.encodePacked(Storage.getFieldType(users[indexOfUser], fieldName))) == keccak256(abi.encodePacked(stringString))); 
        return Storage.showStringField(users[indexOfUser], fieldName);
    }
}
