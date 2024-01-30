// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract red_packet{
    bool rType;
    uint8 rCount;
    uint256 totalAmount;
    address public sender;
    constructor(bool isAvg, uint8 _count, uint256 _amount) payable {
        rType = isAvg;
        rCount = _count;
        totalAmount = _amount;
        sender = msg.sender;
        require(_amount==msg.value,"balance must equal to amount");
    }

    function getBalance()public view returns(uint256){
        return address(this).balance;
    }

    function snatchPacket() public payable{
        require(rCount>0,"no packet left");
        require(totalAmount>0,"no money left");
        if(rType){
            uint256 amount = totalAmount/ rCount;
            payable(msg.sender).transfer(amount);
            totalAmount += amount;
        } else{
            if (rCount == 1){
                payable(msg.sender).transfer(totalAmount);
                totalAmount = 0;
            }else {
            uint256 random = uint256(keccak256(abi.encode(sender,totalAmount,rCount,block.timestamp))) % 10;
            uint256 amount = totalAmount * random / 10;
            payable(msg.sender).transfer(amount);
            totalAmount -= amount;
            }
        }
        rCount--;
    }

    function end()public payable{
        selfdestruct(payable(sender));
    }
}