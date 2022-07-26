//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0; // different versions of solidity 

contract SimpleStorage{ //contract is similair to a class.

    uint256 public favoriteNumber; 
    //public returns the value of 'favoriteNumber'
    //add {} to let solidity know to grab from the struct

    mapping(string => uint256) public nameToFavoriteNumber;
    //string is bing mapped to the uint256 number

    struct People{
        uint256 favoriteNumber;
        string name; //strings are secretly arrays 
    }

    //[] is an array is a way to store a list 
    //uint256[] public favoriteNumberList;
    People[] public people;
    //[] is dynamic but [3] limits us to storing 3 names
    // 0: 2, Patrick, 1: 7, John, 2: 32, Spencer
    
    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
    //calldata (temp variable cant mod), memory (temp variable can mod), storage (perm that can be mod)
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }


    // view, pure disallows the modification of state
    //view functions disallow update 
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

} 

//0xd9145CCE52D386f254917e481eB44e9943F39138 
//more things in your function the more gas is required
//type, the visibility, and the varible name of the object is the structure. 
//arrays, structs, and mappings and special types 
//mapping is sort of like a dictionary 
//0x01100c70af7bb1264Ec70250b4BbEf1128200d8a contract address on Kovan Testnet
