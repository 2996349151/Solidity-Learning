// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

interface IPeople {
    struct Human{
        string name;
        uint8 age;
    }

    function add(string memory name,uint8 age) external;
    function change(string memory name,uint8 age) external;
    function search(string memory name) external returns (bool);
}