// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract receiving {

    uint256 totalAmount;
    address[] addrs;

    receive() external payable {
        totalAmount += msg.value;
        addrs.push(msg.sender);
    }

    function getBalance() public view returns (uint256,uint256){
        return (totalAmount,address(this).balance);
    }

    //only valid when no receive() or wrong call for function
    fallback() external payable {
        totalAmount += msg.value;
        addrs.push(msg.sender);
    }

}