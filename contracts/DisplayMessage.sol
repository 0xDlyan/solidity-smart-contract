// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Contract name
contract DisplayMessage {

// Function that will display our message
function myMessage() public pure returns (string memory) 
{
    return "First Smart Contract";
}

}