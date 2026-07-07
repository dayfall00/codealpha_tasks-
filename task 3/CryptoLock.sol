// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CryptoLock {

    struct Deposit {
        uint amount;
        uint unlockTime;
    }

    mapping(address => Deposit) public deposits;

    // Deposit Ether with lock time
    function deposit(uint _lockTimeInMinutes) public payable {

        require(msg.value > 0, "Send some Ether");

        deposits[msg.sender] = Deposit({
            amount: msg.value,
            unlockTime: block.timestamp + (_lockTimeInMinutes * 1 minutes)
        });
    }

    // Withdraw Ether after unlock time
    function withdraw() public {

        Deposit storage userDeposit = deposits[msg.sender];

        require(userDeposit.amount > 0, "No funds deposited");
        require(block.timestamp >= userDeposit.unlockTime, "Funds are still locked");

        uint amount = userDeposit.amount;

        userDeposit.amount = 0;

        payable(msg.sender).transfer(amount);
    }

    // Check remaining lock time
    function getRemainingTime() public view returns(uint) {

        if(block.timestamp >= deposits[msg.sender].unlockTime) {
            return 0;
        }

        return deposits[msg.sender].unlockTime - block.timestamp;
    }

    // Check deposited amount
    function getBalance() public view returns(uint) {
        return deposits[msg.sender].amount;
    }
}