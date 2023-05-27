// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

struct Struct {
    uint256 number;
}

library LibAppStorage {
    bytes32 internal constant STRUCT_STORAGE_POSITION = keccak256("struct.app.storage");

    function structStorage() internal pure returns (Struct storage ds) {
        bytes32 position = STRUCT_STORAGE_POSITION;
        assembly {
            ds.slot := position
        }
    }
}

contract ContractStruct {
    function updateStruct() external {
        Struct storage s = LibAppStorage.structStorage();
        s.number = 1;
    }
}
