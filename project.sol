// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyToken {

    uint public Total_Supply = 0;
    uint public Max_transaction = 800;
    address public owner;

    mapping(address => uint) public Balance;

    constructor() {
        owner = msg.sender; // Contract deployer is the owner
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }

    function deposit(address _address, uint _number) public {
        require(_number > 0, "Amount must be greater than 0");
        Total_Supply += _number;
        Balance[_address] += _number;
    }

    function withdraw(address _address, uint _number) public {
        require(Balance[_address] >= _number, "Insufficient balance");

        if (_number > Max_transaction) {
            revert("Transaction amount exceeds maximum allowed");
        }

        Total_Supply -= _number;
        Balance[_address] -= _number;

        assert(Total_Supply >= 0);
    }

    function transfer(address _to, uint _amount) public {
        require(_amount > 0, "Amount must be greater than 0");
        require(Balance[msg.sender] >= _amount, "Insufficient balance");

        Balance[msg.sender] -= _amount;
        Balance[_to] += _amount;
    }

    function changeMaxTransaction(uint _newMax) public onlyOwner {
        Max_transaction = _newMax;
    }

    
}
