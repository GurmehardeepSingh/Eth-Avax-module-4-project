// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GDSToken is ERC20 {
    uint public Max_transaction = 800;
    address private _owner;

    struct ShopItem {
        string name;
        uint256 price;
    }

    ShopItem[] public shopItems;

    mapping(address => uint256) public Balance;

    constructor() ERC20("GDS Token", "GDS") {
        _owner = msg.sender;
        _mint(msg.sender, 10 * 10 ** decimals()); // Mint 10 tokens initially to the contract deployer
        addItemToShop("Item 1", 5 * 1 ** decimals());
        addItemToShop("Item 2", 10 * 1 ** decimals());
        addItemToShop("Item 3", 15 * 1 ** decimals());
    }

    modifier onlyOwner {
        require(msg.sender == _owner, "Only owner can use this");
        _;
    }
    
    function deposit(address recipient, uint256 amount) public onlyOwner {
    require(amount > 0, "Amount must be greater than 0");
    require(balanceOf(_owner) >= amount, "Insufficient balance");

    _transfer(_owner, recipient, amount);
    Balance[recipient]+=amount;
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

    function addItemToShop(string memory name, uint256 price) public onlyOwner {
        shopItems.push(ShopItem(name, price));
    }
    function Redeem(uint256 index) public {
    require(index < shopItems.length, "Invalid item index");

    ShopItem storage item = shopItems[index];
    require(balanceOf(msg.sender) >= item.price, "Insufficient balance");

    _transfer(msg.sender, _owner, item.price);

}


    function getShopItems() public view returns (ShopItem[] memory) {
        return shopItems;
    }
}
