// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract map{
    mapping(string=>uint256) public information;

    function add(string memory _name, uint256 _score) public {
        information[_name] = _score;
    }

    function get(string memory _name) public view returns (uint256){
        return information[_name];
    }
}