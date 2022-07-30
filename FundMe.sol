//get funds from users
//withdraw funds
//set a minimum funding value in USD

//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18; //this is not gas efficient

    address[] public funders; //donations and contributors 
    mapping(address => uint256) public addressToAmountFunded; //how much each person sent

    address public owner;

    constructor(){ //function that gets called immediately once called
        owner = msg.sender;
    }
     modifier onlyOwner {
        require(msg.sender == owner, "This aint yo money bruh!");
        _; //doing the rest of the code, doing this require statement first
     }

    function fund() public payable {
        //msg.value.getConversionRate();
        require(msg.value.getConversionRate() >= minimumUsd, "You aint got it dawg"); //1e18 = 1* 10 ** 18 ==1000000000000000000 
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public { //for = loop [a,b,c,d]
        /* starting index, ending index, step amount */ //this is another way to comment
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex = funderIndex++){
            //code '++' means +1 
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
    }
    //reset the array and actually withdraw the funds
    //funders = new address[](0);

    //transfer
    //payable(msg.sender).transfer(address(this).balance); //payable(msg.sender).transfer(address(this).balance);

    //send
    //bool sendSuccess = payable(msg.sender).send(address(this).balance);
    //require(sendSuccess, "Send Failed");

    //call
    //(bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
    //require(callSuccess, "Call Failed");

}
