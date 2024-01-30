// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract A {
    string name;

    function setName(string memory _name) public {
        name = _name;
    }

    function getName() public view returns (string memory){
        return name;
    }
}

contract call_A{
    A a;

    constructor(address addr){
        a = A(addr);
    }

    function setName(string memory _name) public {
        a.setName(_name);
    }

    function getName() public view returns (string memory){
        return a.getName();
    }
}