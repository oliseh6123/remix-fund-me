// Get funds from users
// Withdraw funds
// Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.2 < 0.9.2;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 5;
    
    function fund() public payable {
        // Allow to send money $
        // Have a minimum $ sent
        // 1. How do we send ETH to this contract?
        require(msg.value >= minimumUsd, "didn't send enough ETH"); // 1e18 = 1 ETH = 10000000000000000000 = 1 * 10 ** 18

        // What is a revert?
        // Undo any action that have been done, and send the remaining gas back


    }
    function price() public{
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI

    }
    function getConversionRate() public{

    }
    function getVersion() view public returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}