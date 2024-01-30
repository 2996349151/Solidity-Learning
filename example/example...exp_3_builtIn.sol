// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract builtIn{
    address public admin;
    bytes32 public hash;
    uint256 public randomNumber;

    constructor(){
        admin = msg.sender;
        hash = blockhash(0);
        randomNumber = uint256(keccak256(abi.encode(block.timestamp,admin,hash))) % 100;
    }
}