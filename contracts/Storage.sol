pragma solidity ^0.4.24;

//Type indexes: uint - 1, string - 2

library Storage {

    struct Type {
        uint8 indexOfType;
        uint size;
        uint indexInStorage;
    }

    struct UpgradeableStorage {
        bytes32[] fields;
        mapping (string => Type) types;
        string[] fieldNames;
    }

    function addField(UpgradeableStorage storage self, uint8 indexOfType, uint size, string fieldName, bytes32 data) private returns (uint indexInStorage) {
        self.fields.push(data);
        indexInStorage = self.fields.length - 1;
        self.types[fieldName] = Type({indexOfType: indexOfType, size: size, indexInStorage: indexInStorage});
    }

    function removeField(UpgradeableStorage storage self, string fieldName) private returns (bool) {
        if (self.types[fieldName].size > 0) {
            delete self.fields[self.types[fieldName].indexInStorage];
            delete self.types[fieldName];
            return true;
        } else {
            return false;
        }
    }

    function upgradeField(UpgradeableStorage storage self, string fieldName, bytes32 data) private returns (bool) {
        if (self.types[fieldName].size > 0) {
            self.fields[self.types[fieldName].indexInStorage] = data;
            return true;
        }
        return false;
    }

    function getFieldNames(UpgradeableStorage storage self) public view returns (string[]) {
        return self.fieldNames;
    }

    function getFieldType(UpgradeableStorage storage self, string fieldName) public view returns (string) {
        if (self.types[fieldName].indexOfType == 1) {
            return "uint";
        } else {
            return "string";
        }
    }

    function showField(UpgradeableStorage storage self, string fieldName) private view returns (bytes32) {
        return self.fields[self.types[fieldName].indexInStorage];
    }

    function addUintField(UpgradeableStorage storage self, string fieldName, uint data) public returns (uint indexInStorage) {
        indexInStorage = addField(self, 1, 32, fieldName, bytes32(data));
    }

    function upgradeUintField(UpgradeableStorage storage self, string fieldName, uint data) public returns (bool) {
        return upgradeField(self, fieldName, bytes32(data));
    }

    function showUintField(UpgradeableStorage storage self, string fieldName) public view returns (uint) {
        return uint(showField(self, fieldName));
    }

    function addStringField(UpgradeableStorage storage self, string fieldName, string data) public returns (uint indexInStorage) {
        indexInStorage = addField(self, 2, 32, fieldName, bytes32(data));
    }

    function upgradeStringField(UpgradeableStorage storage self, string fieldName, string data) public returns (bool) {
        return upgradeField(self, fieldName, bytes32(data));
    }

    function showStringField(UpgradeableStorage self, string fieldName) public view returns (string) {
        bytes32 stringData = showField(self, fieldName);
        bytes[] memory data = new bytes(32);
        for (uint i = 0; i < 32; i++) {
            data[i] = stringData[i];
        }
        return string(data);
    }
}
