// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    //Mappings
    mapping(uint => string) public names;
    mapping(uint => Music) public Song;
    mapping(address => mapping(uint => Music)) public music;

   //similar data holder
    struct Music {
        string song;
        string artist;
    }
    constructor() {
        names [1] = "Aleks";
        names [2] = "Yaro";
        names [3] = "Raheem"; 
    }

    function addSong(
        uint _id, 
        string memory _title, 
        string memory _artist
     ) public {
        [_id] = Song( _title, _artist);
    }

     function addMySong(
        uint _id, 
        string memory _title, 
        string memory _artist
    ) public {
        myMusic[msg.sender][_id] = Song( _title, _artist);
        //solidity global variable is called msg. 
    }

}
