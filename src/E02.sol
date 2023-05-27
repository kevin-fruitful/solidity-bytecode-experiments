// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

library LibE02 {
    string internal constant HELLO = "hello";
}

library LibE02_2 {
    string internal constant HELLO = "hello";
    string internal constant HELLO2 = "hello";

    function hello() internal pure returns (string memory) {
        return "hello";
    }
}

contract E02 {
    string public constant HELLO = LibE02.HELLO;
}

contract E02_2 {
    string public constant HELLO = LibE02_2.HELLO;
}
