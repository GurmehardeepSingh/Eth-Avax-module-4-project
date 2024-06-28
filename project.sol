// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyToken {

    uint public Total_Supply = 0;
    uint public Max_transaction = 800;
    mapping(address => uint) public Balance;
    function deposit(address _address,uint _number) public {
      require(_number>0,"Amount must be greater than 0");
    Total_Supply+= _number;
    Balance[_address]+= _number;
    }
    function Withdraw(address _address,uint _number) public {
    
    require(Balance[_address] >= _number,"Available balance should be greater than amount");
    if(_number>Max_transaction){
      revert("Transaction has been reverted, Please stay below the max transaction range");
    }
    Total_Supply-= _number;
    Balance[_address]-= _number;
     
     assert(Total_Supply >= 0);

    }
}
