// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract PaymentContract {
    address public owner;
    uint256 public totalFunds;

    constructor() {
        owner = msg.sender;
    }

    
    function depositFunds() public payable virtual {
        require(msg.value > 0, "Must send some ether");
        totalFunds += msg.value;
    }

    
    function getBalance() public view virtual returns (uint256) {
        return address(this).balance;
    }

    
    function calculateSum(uint256 a, uint256 b) public pure virtual returns (uint256) {
        return a + b;
    }

    
    function withdraw(uint256 amount) public virtual {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= address(this).balance, "Insufficient balance");
        totalFunds -= amount;
        payable(msg.sender).transfer(amount);
    }
}

contract ExtendedPaymentContract is PaymentContract {
    
    function depositFunds() public payable override {
        super.depositFunds(); 
        
    }

    
    function getBalance() public view override returns (uint256) {
        return super.getBalance(); 
    }

    
    function calculateSum(uint256 a, uint256 b) public pure override returns (uint256) {
        return super.calculateSum(a, b); 
    }
}
