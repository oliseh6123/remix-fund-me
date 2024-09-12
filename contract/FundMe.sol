// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.2 < 0.9.2;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 5e18; //5 * 1e18 or 5 * 10 ** 18

    address[] public funders;

    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    
    function fund() public payable {
        // Allow to send money $
        // Have a minimum $ sent
        // 1. How do we send ETH to this contract?
        require(msg.value >= minimumUsd, "didn't send enough ETH"); // 1e18 = 1 ETH = 10000000000000000000 = 1 * 10 ** 18
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

        // What is a revert?
        // Undo any action that have been done, and send the remaining gas back


    }
    function getPrice() public view returns (uint256){
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        ( , int256 price,,,) = priceFeed.latestRoundData();
        // typecasting to convert int to uint
        return uint256(price * 1e10);
        // ABI

    }
    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        // 1ETH?
        //2000_000000000000000000
        uint256 ethPrice = getPrice();
        //(2000_000000000000000000 * 1_000000000000000000)/1e18
        // $2000 = 1eth
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;

    }
    function getVersion() view public returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}