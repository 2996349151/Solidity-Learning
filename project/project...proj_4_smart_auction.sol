// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract smart_auction{

    address payable owner;
    address payable seller;
    uint256 public currentBid;
    address payable public currentBuyer;
    uint256 public startBid;
    uint256 public endTime;

    constructor(address _seller, uint256 _startBid){
        owner = payable(msg.sender);
        seller = payable(_seller);
        startBid = _startBid; 
        endTime = block.timestamp + 3600;
        currentBid = _startBid;
    }   

    function bid(uint256 _amount) public payable{
        require(_amount > currentBid,"not enough bid");
        require(_amount == msg.value,"not honest bid");
        require(block.timestamp<endTime,"time is over");

        if (address(0) != currentBuyer){
            currentBuyer.transfer(currentBid);
        }
        currentBid = _amount;
        currentBuyer = payable(msg.sender);
    }

    function endAuction() public payable{
        require(block.timestamp>=endTime,"auciton not over");
        require(msg.sender == owner,"only onwer can end auction");
        seller.transfer(currentBid * 95 / 100);
    }

    
}