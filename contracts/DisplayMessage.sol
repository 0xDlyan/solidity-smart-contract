// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Contract name
contract DisplayMessage {
// Variable that store our message
    string public _message;

// Function that will set our initial message
function initMessage() public 
{
    _message = "First Smart Contract";
}

// Function that will display our message
function getMessage() public view returns (string memory) 
{
    return _message;
}

// Function that will set a new message
function setMessage(string memory newMessage) public
{
_message = newMessage;
}

}