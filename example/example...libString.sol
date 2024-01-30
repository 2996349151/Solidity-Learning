// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

library libString {
    function isEqual(string memory a,string memory b) internal pure returns (bool){
        bytes32 hasha = keccak256(abi.encode(a));
        bytes32 hashb = keccak256(abi.encode(b));
        return hasha == hashb;
    }
}