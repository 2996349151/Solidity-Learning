// SPDX-License-Identifier: Apache-2.0
pragma solidity^0.8.7;

contract Car {
    string brand;
    uint256 price;
    string version;

    constructor (string memory _brand,uint256 _price,string memory _version){
        brand = _brand;
        price = _price;
        version = _version;
    }
    function getInfo() public view returns (string memory,uint256,string memory){
        return (brand,price,version);
    }
}

contract factory{
    address[] allCars;
    function produce(string memory _brand,uint256 _price,string memory _version) public{
       Car car = new Car(_brand,_price,_version);
       allCars.push(address(car)); 
    }
    function getAllCars() public view returns(address[] memory){
        return allCars;
    }
}