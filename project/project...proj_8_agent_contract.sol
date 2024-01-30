// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract storageContract{
    address public implementation; //logic contract address
    mapping(address=>uint256) public points;
    uint256 public totalPlayer;
    address public owner;

}

contract logicContract is storageContract{
    modifier onlyOwner{
        require(msg.sender==owner,"only owner can do");
        _;
    }

    function addPlayer(address _player,uint256 _point) public onlyOwner virtual {
        require(points[_player]==0,"player already exists");
        points[_player] = _point;
    }

    function setPlayer(address _player,uint256 _point) public onlyOwner{
        require(points[_player]!=0,"player does not exist");
        points[_player] = _point;
    }
}

contract agentContract is storageContract{
    modifier onlyOwner{
        require(msg.sender==owner,"only owner can do");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function serImpl(address _impl) public { //change logic contract address
        implementation = _impl;
    }

    fallback() external {
        address impl = implementation;
        require(impl != address(0),"invalid logic contract address");

        assembly{
            let ptr := mload(0x40)
            calldatacopy(ptr,0,calldatasize())
            let result := delegatecall(gas(),impl,ptr,calldatasize(),0,0)
            let size := returndatasize()

            returndatacopy(ptr,0,size)

            switch result
                case 0 {revert(ptr,size)}
                default {return (ptr,size)}
        }
    }
}

contract logicContractUpgraded is logicContract{
    function addPlayer(address _player,uint256 _point)override public onlyOwner virtual{
        require(points[_player]==0,"player already exists");
        points[_player] = _point;
        totalPlayer++;
    }
}