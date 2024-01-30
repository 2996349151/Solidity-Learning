// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract modify{
    address public admin;
    uint256 public amount;

    constructor(){
        admin = msg.sender;
    }

    modifier onlyAdmin(){
        require(msg.sender == admin, "only admin can do");
        require(amount > 10, "amount must > 100");
        _;
    }

    function setAmount(uint256 _amount) public onlyAdmin {
        amount = _amount;
    }
}