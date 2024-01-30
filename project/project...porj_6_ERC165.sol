// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

import "./IERC165.sol";
contract ERC165 is IERC165{
    mapping(bytes4 => bool) supportedInterfaces;

    constructor() {
        supportedInterfaces[IERC165.supportsInterface.selector] = true;
    }

    function supportsInterface(bytes4 interfaceID) override external view returns (bool) {
        return supportedInterfaces[interfaceID];
    }
}