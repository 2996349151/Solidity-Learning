// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract structure{
    struct User {
        string name;
        uint8 age;
        string sex;
    }

    User public user;

    function setUser(string memory _name, uint8 _age, string memory _sex) public {
        user.name = _name; 
        user.age = _age;
        user.sex = _sex;
    }
    
    function ref (uint8 _age) public {
        User memory temp = user;
        temp.age = _age;
    }

    function value (uint8 _age) public {
        User storage temp = user;
        temp.age = _age;
    }
}