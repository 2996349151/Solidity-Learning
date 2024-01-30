// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract events {
    event info(address _who, uint _amount);

    function test() public payable returns (address){
        emit info(msg.sender,msg.value);
        return msg.sender;
    }
}