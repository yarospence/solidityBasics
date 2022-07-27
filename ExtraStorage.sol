// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    // +5 
    //override or vitural override 
    //allows use to override certain function 
    //if they have virtual on them
    function store (uint256 _favoriteNumber) public override {
        //functions dont need ; 
      favoriteNumber = _favoriteNumber + 5; 
    }
} 
