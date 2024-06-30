Overview
The GDSToken smart contract is an ERC20 token implementation with additional features such as a shop system and transaction limits. This contract allows users to purchase items from a shop, deposit tokens to specific addresses, and withdraw tokens within a specified transaction limit. The owner of the contract has the ability to add shop items and change the maximum transaction limit.

Contract Details
Token Name: GDS Token
Token Symbol: GDS
Initial Supply: 10 GDS tokens
Maximum Transaction Limit: 800 GDS tokens (initially)
Features
1. Ownership
The contract uses an _owner address to restrict access to certain functions to the contract deployer.

2. Token Minting
Upon deployment, 10 GDS tokens are minted to the owner's address.

3. Shop System
Shop Items: The contract maintains a list of shop items, each with a name and price.
Redeem: Users can redeem items from the shop by transferring the required amount of GDS tokens to the owner.
4. Deposits and Withdrawals
Deposit: The owner can deposit tokens to any address.
Withdraw: Users can withdraw their tokens within the maximum transaction limit. If the withdrawal amount exceeds the limit, the transaction is reverted.
5. Maximum Transaction Limit
The owner can change the maximum transaction limit.
I already tried to connect with avalanche and it was successful but while recording the video i ran out of gas and couldnt redeem more from the faucet and as the deadline is approaching i am forced to submit this now.
