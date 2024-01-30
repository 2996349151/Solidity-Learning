// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

struct Player{
    address name;
    uint256 amount;
}

contract bet_game {

    Player[] bigs;
    Player[] smalls;
    uint256 totalBig;
    uint256 totalSmall;
    address public owner;
    bool isFinished;
    uint256 minBet;
    uint256 endTime;

    constructor(uint256 _min){
        owner = msg.sender;
        isFinished = false;
        minBet = _min;
        endTime = block.timestamp + 300;
    }

    function getBalance()public view returns (uint256){
        return address(this).balance;
    }
    function bet(bool isBig) public payable{
        require(isFinished=false,"game finished");
        require(msg.value>minBet,"not enough bet amount");
        require(block.timestamp<endTime,"game finished");

        if(isBig){
            Player memory player = Player(msg.sender,msg.value);
            bigs.push(player);
            totalBig += msg.value;
        } else{
            Player memory player = Player(msg.sender,msg.value);
            smalls.push(player);
            totalSmall += msg.value;
        }
    }   

    function open() public payable{
        require(isFinished=true,"game not finished");
        require(block.timestamp>=endTime,"game not finished");

        uint256 random = uint256(keccak256(abi.encode(block.timestamp,msg.sender,owner))) % 18;
        if (random <=8){
            for(uint256 i=0;i<smalls.length;i++){
                Player memory player = smalls[i];
                uint256 bonus = player.amount + totalBig * player.amount / totalSmall * 99 / 100;
                payable(player.name).transfer(bonus);
            }
            payable(owner).transfer(totalBig / 100);
        } else{
            for(uint256 i=0;i<bigs.length;i++){
                Player memory player = bigs[i];
                uint256 bonus = player.amount + totalSmall * player.amount / totalBig * 99 / 100;
                payable(player.name).transfer(bonus);
            }
            payable(owner).transfer(totalSmall / 100);
        }
    }


}