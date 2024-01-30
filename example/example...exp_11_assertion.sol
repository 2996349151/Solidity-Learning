// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract assertion {
    function deposit (uint _amount) public payable{
        assert(_amount > 0);
        require(_amount > 10);
    }
}