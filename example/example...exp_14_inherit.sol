// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

import "./IUser.sol";

contract User is IUser{
    function addUser(string memory _name,uint8 _age) override external{

    }
    function getUser(string memory _name) external view returns (string memory,uint8){
        
    }
}