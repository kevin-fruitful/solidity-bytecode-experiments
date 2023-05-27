// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "forge-std/Test.sol";

import {E01, E01_2} from "../src/E01.sol";
import {E02, E02_2} from "../src/E02.sol";
import {ContractStruct as E03} from "../src/E03.1.sol";
import {ContractStruct as E03_2} from "../src/E03.2.sol";
import {ContractEnum as E04} from "../src/E04.1.sol";
import {ContractEnum as E04_2} from "../src/E04.2.sol";

/// Terminology
/// - runtimeCode, runtime bytecode: the runtime bytecode of the contract as it is compiled in the current file (e.g. type(Contract).runtimeCode)
/// - creationCode, init code: the init bytecode of the contract as it is compiled in the current file (e.g. type(Contract).creationCode)
/// - code, deployed runtime bytecode: the runtime bytecode of the contract as it is deployed on chain (e.g. address(contract).code)

/// @dev Will the bytecodes match?
contract ContractBytecodeTest is Test {
    function setUp() public {}

    /// Identical contracts with differing names have the same runtime bytecode.
    function test_E01_differentContractNames() public {
        E01 e01 = new E01();
        E01_2 e01_2 = new E01_2();
        assertEq(type(E01).runtimeCode, type(E01_2).runtimeCode, "mismatching runtimeCode");
        assertEq(type(E01).creationCode, type(E01_2).creationCode, "mismatching creationCode");
        assertEq(address(e01).code, address(e01_2).code, "mismatching code");
        assertEq(type(E01).runtimeCode, address(e01).code, "mismatching runtimeCode vs code");
    }

    /// Same contract importing a constant from a library 
    function test_E02_importingConstants() public {
        E02 e02 = new E02();
        E02_2 e02_2 = new E02_2();
        assertEq(type(E02).runtimeCode, type(E02_2).runtimeCode, "mismatching runtimeCode");
        assertEq(type(E02).creationCode, type(E02_2).creationCode, "mismatching creationCode");
        assertEq(address(e02).code, address(e02_2).code, "mismatching code");
        assertEq(type(E02).runtimeCode, address(e02).code, "mismatching runtimeCode vs code");
    }

    function test_E03_structs() public {
        E03 e03 = new E03();
        E03_2 e03_2 = new E03_2();
        assertEq(type(E03).runtimeCode, type(E03_2).runtimeCode, "mismatching runtimeCode");
        assertEq(type(E03).creationCode, type(E03_2).creationCode, "mismatching creationCode");
        assertEq(address(e03).code, address(e03_2).code, "mismatching code");
        assertEq(type(E03).runtimeCode, address(e03).code, "mismatching runtimeCode vs code");
    }

    /// Expected to mismatch! 
    function test_E04_enums() public {
        E04 e04 = new E04();
        E04_2 e04_2 = new E04_2();
        assertEq(type(E04).runtimeCode, type(E04_2).runtimeCode, "mismatching runtimeCode");
        assertEq(type(E04).creationCode, type(E04_2).creationCode, "mismatching creationCode");
        assertEq(address(e04).code, address(e04_2).code, "mismatching code");
        assertEq(type(E04).runtimeCode, address(e04).code, "mismatching runtimeCode vs code");

    }

    function test_Size() public {
        assertEq(type(E02).creationCode.length, type(E02).creationCode.length);
        assertEq(type(E03).creationCode.length, type(E03_2).creationCode.length);
    }
}
