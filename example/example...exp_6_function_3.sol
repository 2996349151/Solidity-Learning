// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract func{
    uint256 count;

    constructor(uint256 _c){
        count = _c;
    }

    function setCount(uint256 _c) public{
        count = _c;
    }

    function getCount() external view returns (uint256){
        return count;
    }

    function deposit() external payable{

    }

    function secret() internal pure{
        
    }
}