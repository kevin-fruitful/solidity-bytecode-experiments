# Solidity Bytecode Exploration

This repository contains a series of Solidity smart contract examples that have been created to explore and understand the nuances of contract bytecode, and how different aspects of the contracts affect the bytecode that gets generated upon compilation. The exploration covers runtime bytecode. Will add details about init bytecode and bytecode hash if there's interest.

## Repository Structure

The code repository is organized into various example contracts, each designed to illustrate a specific aspect of Solidity bytecode.

## Examples

E01: E01.sol contains two contracts that are identical except for their names. They help demonstrate that the name of a contract does not impact the runtime bytecode.

E02: These contracts utilize different libraries, but import and use the same code from their respective libraries, resulting in identical bytecode.

E03: This example features two different versions of a struct and demonstrates that the bytecode is not affected by struct properties that aren't used by the contract.
