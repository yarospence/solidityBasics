// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // dashes is for comments   

//EVM, Ehthereum Virtual Machine
//Avalanche, Fantom, Polygon  (other blockchains we can work on)

contract SimpleStorage {

    // This gets initialized to zero!
    // <- This means that this section is a comment!
    //uint, int, bool, string, address, bytes
    uint256 favoriteNumber;

    //mapping resets all the numbers directly to 0 
    //dictionaries 
    mapping (string => uint256) public nameToFavoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
    }
    //this is the setup for array 
   // uint256[] public favoriteNumbersList;
    People[] public people;

    //store can hold basic numbers
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber; 
        retrieve();
    }
    // view, pure...dont allow modification on the stsate of the blockchain
    function retrieve() public view returns(uint256){
        return favoriteNumber; 
    }

    //pay attention to Capitalize letters grabs Capitalized text
    // calldata, memory, storage. string is secretly an array so we must use "memory" 
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] =_favoriteNumber;
    }
}
