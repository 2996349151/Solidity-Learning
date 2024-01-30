// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract func{
    function getSum() public pure returns (uint256){
        uint256 sum = 0;
        for(uint256 i = 1; i <= 100; i++){
            sum += i;
        }
        return sum;
    }

     function getSum2() public pure returns (uint256 sum){
        uint256 i = 0;
        while(i <= 100){
            sum += i;
        }
    }
}