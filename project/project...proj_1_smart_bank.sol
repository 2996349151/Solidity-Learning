// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;


contract bank{
    string public bank_name;
    uint256 totalAmount;
    address public admin;
    mapping(address=>uint256) balances;

    constructor(){
        bank_name = "smart bank";
        admin = msg.sender;
    } 

    function getBalance()public view returns (uint256,uint256){
        return (address(this).balance,totalAmount);
    }

    function balanceOf(address _who) public view returns (uint256){
        return balances[_who];
    }

    function deposit(uint256 _amount) public payable{
        require(_amount>0,"amount must > 0");
        require(msg.value==_amount,"msg.value must equal to amount");
        balances[msg.sender] += _amount;
        totalAmount += _amount;
        require(address(this).balance==totalAmount,"bank's balance must ok");
     
    }

    function withdraw(uint256 _amount) public payable{
        require(_amount >0,"amount must >0");
        require(balances[msg.sender] >=_amount,"user's balance not enough");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        totalAmount -= _amount;
        require(address(this).balance==totalAmount,"bank's balance must ok");
    }

    function transfer(address _to,uint256 _amount) public{
        require(_amount >0,"amount must >0");
        require(address(0)!=_to,"to address ust be valid");
        require(balances[msg.sender] >=_amount,"user's balance not enough");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        require(address(this).balance==totalAmount,"bank's balance must ok");

    }
}