// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract TransferFund{
// Variable which will store the owner address and pause the contract by default
    address public _owner;
    bool public _active;
// Array that will store the value tranfered by a specific address    
    mapping(address => uint) public balanceReceived;

// Function that will be called during the smart contract deployment
constructor() {
    _owner = msg.sender;
}

// This function will display the address of the smart contract owner
function getOwnerAddress() public view returns (address)
{ return _owner;
}

// This function will display the funds withing the smart contract
function getBalance() public view returns (uint)
{
    return address(this).balance;
}

// This function can receive Ether, it's a payable function.    
// instance.sendMoney({value: web3.utils.toWei("1","ether")})
function sendMoney() public payable {
    balanceReceived[msg.sender] += msg.value;
}

// This function will automatically withdraw all available funds stored at the address of the Smart Contract to the variable in the as function argument given address.
function withdrawAllFund (address payable _toAddress) public 
{
    //require(_owner == msg.sender, "Only the owner can withdraw.");
    require (_active == true, "The contract is curently paused");
    //_toAddress.transfer(address(this).balance);

    // Retrieve how much the user had previously send.
    uint balanceToSend = balanceReceived[msg.sender];
    // Reset user current balance and send him all his funds
    balanceReceived[msg.sender] = 0;
    _toAddress.transfer(balanceToSend);
}

// This function will allow the user to withdraw a specific amont of his deposited funds
function withdrawMoney(address payable _toAddress, uint _amont) public {
   // Check available fund to withdraw
   require(_amont <= balanceReceived[msg.sender],"Not enough funds");
   balanceReceived[msg.sender] -= _amont;
   _toAddress.transfer(_amont);
}

// This function will return if the smart contract is enable or not. By default it is enabled.
function getStatus() public view returns (bool) {
    return _active;
}

// This function will allow the owner to pause the smart contract.
function pauseContract() public {
    require(_owner == msg.sender, "Only the owner can pause the contract.");
    _active = false;
}
// This function will allow the owner to activate the smart contract.
function activateContract() public {
    require(_owner == msg.sender, "Only the owner can enable the contract.");
    _active = true;
}

// This function will allow the owner to destroy the smart contract and send all funds to a specified address
function destroySmartContract(address payable _toAddress) public {
    require(_owner == msg.sender, "Only the owner can destroy this smart contract.");
    selfdestruct(_toAddress);
}

}