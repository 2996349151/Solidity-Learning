// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract func{
    function isEqual(string memory a, string memory b) public view returns (bool){
        bytes32 hashA = keccak256(abi.encode(a));
        bytes32 hashB = keccak256(abi.encode(b));
        return hashA == hashB;
    }
}