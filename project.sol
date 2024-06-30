// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GDSToken is ERC20 {
    uint public Max_transaction = 800;
    address private _owner;

    mapping(address => uint256) public Balance;

    constructor() ERC20("GDS Token", "GDS") {
        _owner = msg.sender;
        _mint(msg.sender, 10 * 10 ** decimals()); // Mint 10 tokens initially to the contract deployer
    }
    modifier onlyOwner{
      require(msg.sender == _owner,"Only owner can use this");
      _;
    }
    
    function deposit(address _address, uint256 _number) public onlyOwner {
        require(_number > 0, "Amount must be greater than 0");
        _mint(_address, _number);
        Balance[_address] += _number;
    }

    function withdraw(address _address, uint256 _number) public {
        require(Balance[_address] >= _number, "Insufficient balance");

        if (_number > Max_transaction) {
            revert("Transaction amount exceeds maximum allowed");
        }

        _burn(_address, _number);
        Balance[_address] -= _number;
    }


    function changeMaxTransaction(uint256 _newMax) public onlyOwner {
        Max_transaction = _newMax;
    }

    function owner() public view returns (address) {
        return _owner;
    }
}
