// SPDX-License-Identifier: MIT
pragma solidity^0.8.7;

import "./IERC721.sol";
import "./IERC165.sol";

interface ERC721TokenReceiver{
    function onERC721Received(address _operator,address _from,uint256 _tokenId,bytes memory _data) external returns (bytes4);
}

contract ERC721 is IERC165,IERC721{
    //ERC165
    mapping(bytes4=>bool) supportsInterfaces;
    bytes4 invalidID = 0xffffffff;
    bytes4 constant ERC165_InterfaceID = 0x01ffc9a7;
    bytes4 constant ERC721_InterfaceID = 0x80ac58cd;

    //IERC721
    mapping(address=>uint256) ercTokenCount;
    mapping(uint256=>address) ercTokenOwner;
    mapping(uint256=>address) ercTokenApproved;
    mapping(address=>mapping(address=>bool)) ercAllApproved;

    constructor (){
        _registerInterface(ERC165_InterfaceID);
        _registerInterface(ERC721_InterfaceID);
    }

    //IERC165
    modifier onlyApproved(uint256 _tokenId){
        address owner = ercTokenOwner[_tokenId];
        require(msg.sender == owner ||
                ercAllApproved[owner][msg.sender]);
        _;

    }

    modifier onlyTransfer(uint256 _tokenId, address _from){
        address owner = ercTokenOwner[_tokenId];
        require(owner == _from);
        require(msg.sender==owner ||
                ercTokenApproved[_tokenId] == msg.sender ||
                ercAllApproved[owner][msg.sender]);  
        _;
    }
    function _registerInterface(bytes4 interfaceID) internal{
        supportsInterfaces[interfaceID] = true;
    }
    function supportsInterface(bytes4 interfaceID) override external view returns (bool){
        require(invalidID==interfaceID,"invalid interface ID");
        return supportsInterfaces[interfaceID];
    }

    //ERC721
    function balanceOf(address _owner) override external view returns (uint256){
        return ercTokenCount[_owner];
    }

    function ownerOf(uint256 _tokenId) override external view returns (address){
        return ercTokenOwner[_tokenId];
    }

    function getApproved(uint256 _tokenId) override external view returns (address){
        return ercTokenApproved[_tokenId];
    }

    function isApprovedForAll(address _owner, address _operator) override external view returns (bool){
        return ercAllApproved[_owner][_operator];
    }

    function approve(address _approved, uint256 _tokenId) override onlyApproved(_tokenId) external payable{
        ercTokenApproved[_tokenId] = _approved;
    }

    function setApprovalForAll(address _operator, bool _approved) override external{
        ercAllApproved[msg.sender][_operator] = _approved;
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) override external payable{
        _transferFrom(_from,_to,_tokenId);
    }

    function _transferFrom(address _from, address _to, uint256 _tokenId) internal onlyTransfer(_tokenId,_from){
        ercTokenOwner[_tokenId] = _to;
        ercTokenCount[_from] -= 1;
        ercTokenCount[_to] += 1;
        ercTokenApproved[_tokenId] = address(0);
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes memory data) override external payable{
        _safeTransferFrom(_from,_to,_tokenId,data);
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId) override external payable{
        _safeTransferFrom(_from,_to,_tokenId,"");
    }

    function _safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes memory data) internal {
        _transferFrom(_from,_to,_tokenId);

        //add safe code
    }
}