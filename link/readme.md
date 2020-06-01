

# LinkDunia P2P fiat to CUSD using Chainlink Oracles

## Problem

Asynchronous payment flows are complex to manage in blockchain because they depend on customer interactions that happen outside of the blockchain. There are solutions to this problem but they come in centralized forms which would require trusting a third party that will verify all payments intents confirmations coming from multiples channels and perform operations in the blockchain according to these intents status. 

## Solution

The solution was to use smart contracts that can interact with real world existing payment channels (ussd - bank account - credit card - cryptocurrencies)  through the use of ChainLink. The use of ChainLink allows the contract to be able to confirm whether or not a payment intent has been created-fullfilled-cancelled-failed or not. Multiple ChainLink nodes can be used to increase decentralization and therefore the security of the validations.

This solution involves the wallet manager, creating a payment intent for a specified user account with the equivalent amount of Cusd to be deposited and locking up the balance in a smart contract. This balance is then unlocked when the payment intent is `fullfilled`, the smart contract uses Chainlink Oracles to confirm that the payment intent has been fullfiled via the desired method. The contract can confirm with multiple Oracles making it more decentralized and therefore more secure. If the intent is fullfilled then the user can withdraw their funds, if the intent isn't fullfilled within 30 minutes the wallet manager can burn withdram their funds from the contract.

## Procedure



## Some Notes

- A wallet manager should select up to 3 nodes for cost efficient and secure confirmations, the more nodes chosen the more secure it is but it costs more in terms of LINK and Ethereum to run the confirmations.
- If the payment intent isn't fullfiled after a 30 min of deployment and running the confirmations can the wallet manager get his locked funds back.

## How it Works

In this section we will give you more details in terms of how the contract works.

### The Adapter

The Adapter uses a custom API that parses the DuniaLink together with the payment intent ID to retrieve the `paymentStatus` determining if the intent was fullfiled or not. This is triggered by the ChainLink Node which in turn is called by the Smart Contract.

### The Smart Contracts
The factory contract produces all the DuniaLink agreements containing the funds and all the ChainLink functionality to do the transfers and confirmations.

### Future Work
Multi-Channel Handling
like a proper payment engine supporting : 
    * Cash
    * Cryptocurrencies
    * Bank deposit
    * Credit card
    * Debit card

