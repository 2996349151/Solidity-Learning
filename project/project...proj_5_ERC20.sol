// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    string ercName;
    string ercSymbol;
    uint8 ercDecimal;
    uint256 ercTotalSupply;
    mapping(address=>uint256) ercBalances;
    mapping(address=>mapping(address=>uint256)) ercAllowance;
    address owner;


    constructor(string memory _name,string memory _sym, uint8 _decimals){
        ercName = _name;
        ercSymbol = _sym;
        ercDecimal = _decimals;
        ercTotalSupply = 1e8;
        owner = msg.sender;
        ercBalances[owner] = ercTotalSupply;
        
    }
    function name() override external  view returns (string memory){
        return ercName;
    }
    function symbol() override external  view returns (string memory){
        return ercSymbol;
    }
    function decimals() override external  view returns (uint8){
        return ercDecimal;
    }
    function totalSupply() override external  view returns (uint256){
        return ercTotalSupply;
    }
    function balanceOf(address _owner) override external  view returns (uint256 balance){
        return ercBalances[_owner];
    }
    function transfer(address _to, uint256 _value) override external returns (bool success){
        ercBalances[msg.sender] -= _value;
        ercBalances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }
    function transferFrom(address _from, address _to, uint256 _value) override public  returns (bool){
        ercBalances[_from] -= _value;
        ercBalances[_to] += _value;
        ercAllowance[_from][msg.sender] -= _value;

        emit Transfer(_from,_to,_value);
        return true;
    }
    function approve(address _spender, uint256 _value) override external  returns (bool){
        ercAllowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender,_spender,_value);
        return true;
    }
    function allowance(address _owner, address _spender) override external view returns (uint256 remaining){
        remaining = ercAllowance[_owner][_spender];
        
    }

    function mint() public returns (bool){
        
        transferFrom(owner,msg.sender,1e6);
        return true;
    }
}