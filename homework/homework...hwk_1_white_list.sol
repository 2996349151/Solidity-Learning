// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract whiteList{
    address public admin;
    mapping (address=>bool) nameList;
    constructor(){
        admin = msg.sender;
    }

    modifier onlyAdmin(){
        require(msg.sender == admin, "This is only applicable for admin;");
        _;
    }

    modifier onlyWhiteList(){
        require(nameList[msg.sender]==true,"This is only applicable for name in white list.");
        _;
    }

    function addName(address name) public onlyAdmin returns (bool){
        require(nameList[name]==false,"The name is already in the white list.");
        nameList[name]=true;
        return true;
    } 

    function delName(address name) public onlyAdmin returns (bool){
        require(nameList[name]==true,"The name is not in the white list.");
        nameList[name]=false;
        return true;
    } 

    function mint()public view onlyWhiteList returns (bool){
        return true;
    }
}