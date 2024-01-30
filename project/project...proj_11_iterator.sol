// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract iterator{
    mapping(string=>uint256) points;
    string[] names;

    function addName(string memory _name,uint256 _point) public{
        points[_name] = _point;
        names.push(_name);
    }

    function getSum()public view returns(uint256){
        uint256 sum;
        for(uint256 i=0;i<names.length;i++){
            sum += points[names[i]];
        }
        return sum;
    }
}