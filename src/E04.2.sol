// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

enum Enum {
    A,
    B,
    C
}

contract ContractEnum {
    uint256 public enumSize;

    function setEnum(Enum _enum) external returns (uint8 castEnumToUint8, uint256 enumSize_) {
        castEnumToUint8 = uint8(_enum);
        enumSize_ = uint256(type(Enum).max);
        enumSize = enumSize_;
    }
}
