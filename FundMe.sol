//get funds from users
//withdraw funds
//set a minimum funding value in USD

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public miminimumUsd = 50;

    function fund() public payable {
        require(msg.value.getConversionRate() >= Mininmum_USD, "You need to spend more ETH!");
        //1e18 == 1 * 10 ** 18 == 1000000000000000000 
        //revert is when a gas is spent, reverse tranactions
    }

    function getPrice() public view returns(uint256) {
         //ABI 
        //address from data.chain.link
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        (, int256 price,,,) = priceFeed.latestRoundData();
       // (uint80 roundID int price uint startedAt, uint timeStamp, uint80 answeredInRound) = priceFeed.latestRoundData();
       //ETH in terms of USD theyre are 8 decimals places in terms in Ether
       return uint256(price * 1e10); // 1 * 10 == 10000000000
    }
    
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        return priceFeed.version();
    }


    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        // 3000_000000000000000000 = ETH / USD price
        //1_000000000000000000 ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    //function withdraw(){}
}
