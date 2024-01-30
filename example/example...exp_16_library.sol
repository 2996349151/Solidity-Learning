// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

import "./libString.sol";

contract lib {
    using libString for string;

    function isMyEqual(string memory a,string memory b)public pure returns (bool){
        return a.isEqual(b);
    }
}