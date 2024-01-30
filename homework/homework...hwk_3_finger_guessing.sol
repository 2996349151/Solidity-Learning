// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract fingerGuessing{
    address public player1;
    address public player2;
    bytes32 hash1;
    bytes32 hash2;
    uint8 decision1;
    uint8 decision2;
    uint8 public state;
    bool proved1;
    bool proved2;
    string public end;

    constructor(address p1 ,address p2){
        player1 = p1;
        player2 = p2;
        hash1 = 0x0;
        hash2 = 0x0;
        decision1 = 0;
        decision2 = 0;
        proved1 = false;
        proved2 = false;
        state = 0;
        end = "Game in progress";
    }
    function mark(uint8 d1,uint8 d2) private pure returns (string memory){
        if (d1 == d2) return "Draw! Next round.";
        if (d1 == 1){
            if (d2 == 2) return "Player 1 Win !";
            return "Player 2 Win !";
        }
        if (d1 == 2){
            if (d2 == 3) return "Player 1 Win !";
            return "Player 2 Win !";
        }
        if (d1 == 3){
            if (d2 == 1) return "Player 1 Win !";
            return "Player 2 Win !";
        }
        return "";
    }

    function decideHash(bytes32 h)public {
        end = "Game in progess";
        if (msg.sender == player1){
            require(hash1==0x0,"You have made your decision!");
            hash1 = h;
            state++;
        }
        if (msg.sender == player2){
            require(hash2==0x0,"You have made your decision!");
            hash2 = h;
            state++;
        }
        if (state == 1) end = "Wait for another player to decide.";
        
    }

    function decideProve(uint8 decision,string memory salt) public{
        if (state < 2) end = "Not enough decision!";
        end = "Wait for proving decision.";
        if (msg.sender == player1){
            require(hash1 == keccak256(abi.encode(decision,salt)),"Fail to prove your decision");
            require(proved1 == false,"You have proved your decision!");
            proved1 = true;
            decision1 = decision;
            state ++;
        }
        if (msg.sender == player2){
            require(hash2 == keccak256(abi.encode(decision,salt)),"Fail to prove your decision");
            require(proved2 == false,"You have proved your decision!");
            proved2 = true;
            decision2 = decision;
            state ++;
        }
        if (state == 4){
            end = mark(decision1,decision2);
            hash1 = 0x0;
            hash2 = 0x0;
            decision1 = 0;
            decision2 = 0;
            state = 0;
        }

    }

    function test() public pure returns (bytes32,bytes32){
        bytes32 a = keccak256(abi.encode(2,'a'));
        bytes32 b = keccak256(abi.encode(1,'a'));
        return (a,b);
    }
}   
