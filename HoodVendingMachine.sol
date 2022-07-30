//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract HoodVendingMachine { //Introducing the very first hood vending machine on blockchain
    address public owner;
    mapping (address => uint) public donutBalances;

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }
//first we have to get the balance of our Hood Vending Machines
    function getVendingMachingBalance() public view returns (uint) {
        return donutBalances[address(this)];
    }
//secure that only the owner can restock the machines
    function restock(uint amount) public {
        require(msg.sender == owner, "Only the OG can restock this bruh.");
        donutBalances[address(this)] += amount;
    }
//create the ability for users to be able to purchase
    function purchase(uint amount) public payable {
        require(msg.value >= amount * 2 ether, "Cough up at least a dub per donut");
        require(donutBalances[address(this)] >= amount, "Not enough donuts in stock to fulfill purchase request.");
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }
}
