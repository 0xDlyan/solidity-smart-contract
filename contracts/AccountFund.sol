// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Contract name
contract AccountFund {

// Will store the amount of ETH we received
    uint public balanceReceived;

// Function that will store in the variable the amount sent to our smart contract from the transaction
    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

// Function that will give us the amount received from the last transation with our smart contract
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

}