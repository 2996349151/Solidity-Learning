// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract money{
    address public admin;
    address payable public depositor;
    uint256 totalAmount;

    constructor (address _owner) payable {
        admin = _owner;
    }

    function deposit(uint256 _amount) public payable {
        if (_amount != msg.value) return;
        depositor = payable(msg.sender);
        totalAmount = _amount;
    }

    function getBalance() public view returns (uint256,uint256){
        return (address(this).balance,totalAmount);
    }

    function withdraw(uint256 _amount) public payable {
        depositor.transfer(_amount);
    }
}

//0xd9145CCE52D386f254917e481eB44e9943F39138