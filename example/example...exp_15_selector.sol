// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

import "./IUser.sol";

contract select {
    function getSelector() public pure returns (bytes4,bytes4){
        bytes32 hash;
        hash = keccak256("addUser(string,uint8)");
        return (bytes4(hash),IUser.addUser.selector);
    }

    function getInterfaceID () public pure returns (bytes4) {
        return IUser.addUser.selector ^ IUser.getUser.selector;
    }
}