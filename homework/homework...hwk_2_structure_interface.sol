// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

import "./IPeople.sol";

contract People is IPeople{
    Human[] public human;
    function add(string memory name,uint8 age) external{
        human.push(Human(name,age));
    }

    function change(string memory name,uint8 age) external{
        for (uint256 i=0;i<human.length;i++){
            if (keccak256(abi.encode(name))==keccak256(abi.encode(human[i].name))){
                human[i].age=age;
                return;
            } 
        }
    }
    
    function search(string memory name) external view returns (bool){
        for (uint256 i=0;i<human.length;i++){
            if (keccak256(abi.encode(name))==keccak256(abi.encode(human[i].name))){
                return true;
            } 
        }
        return false;
    }
}