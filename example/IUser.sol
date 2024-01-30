// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

interface IUser {
    
    function addUser(string memory _name,uint8 _age) external;
    function getUser(string memory _name) external view returns (string memory,uint8);
}

