// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract list {
    string[5] public name;
    uint256[] public age;

    constructor(){
        name[0] = 'Alice';
        age.push(18);
        age[0] = 20;
    }

    function addAge(uint256 _age) public {
        age.push(_age);
    }

    function getLength() public view returns (uint256,uint256){
        return (name.length,age.length);
    }

 
}