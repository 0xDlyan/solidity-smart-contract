// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract TransferFund{
// Variable which will store the owner address
    address public owner;
    
// Function that will be called during the smart contract deployment
constructor() {
    owner = msg.sender;
}

// This function can receive Ether, it's a payable function.    
function sendMoney() public payable {}

// This function will automatically withdraw all available funds stored at the address of the Smart Contract to the variable in the as function argument given address.
function withdrawAllFund (address payable _toAddress) public 
{
    require(owner == msg.sender, "Only the owner can withdraw.");
    _toAddress.transfer(address(this).balance);
}

}