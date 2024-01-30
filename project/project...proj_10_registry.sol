// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

struct contractInfo{
    address owner;
    address contractAddr;
    string version;
}
contract registry{
    mapping(string=>contractInfo) contracts;

    function addContract(string memory _name,address _addr,string memory _ver) public{
        if(contracts[_name].contractAddr == address(0)){
            contracts[_name].owner = msg.sender;
            contracts[_name].contractAddr = _addr;
            contracts[_name].version = _ver;
        } else{
            contracts[_name].contractAddr = _addr;
            contracts[_name].version = _ver;
        }
    }

    function getInfo(string memory _name) public view returns (contractInfo memory){
        return contracts[_name];
    }
}