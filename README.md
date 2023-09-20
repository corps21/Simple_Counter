# Simple Counter using Foundry

This is a simple smart contract developed using Solidity that implements a basic counter functionality. The contract allows you to increment, decrement, and set the counter value. Additionally, it incorporates access control to ensure that only the contract owner can change the counter's value.

## Getting Started

Follow the steps below to deploy and interact with the Simple Counter contract using Foundry.

### Prerequisites

- [Foundry](https://foundry.finance/): Foundry is a platform that simplifies the process of deploying and managing smart contracts on the Ethereum blockchain. Ensure you have access to Foundry before proceeding.

### Deployment

1. Deploy the Smart Contract:
   - Copy the Solidity code provided in the contract file (Counter.sol).
   - Access the Foundry platform and navigate to the Smart Contract deployment section.
   - Paste the contract code into the editor.
   - Configure the contract deployment parameters as needed.
   - Deploy the contract on the Ethereum blockchain.

2. Interact with the Smart Contract:
   - Once the contract is deployed, you can interact with it using the functions provided.

## Contract Functions

### `constructor()`

- Initializes the contract by setting the contract owner to the address that deploys the contract.

### `onlyOwner` Modifier

- A custom modifier that restricts access to certain functions to the contract owner only.

### `setNumber(uint256 newNumber)`

- Allows the owner to set a new value for the counter.

#### Parameters

- `newNumber` (uint256): The new value to set for the counter.

### `increment()`

- Increments the counter by 1.

### `decrement()`

- Decrements the counter by 1.

## License

This contract is provided under the "UNLICENSED" SPDX-License-Identifier, which means it is open-source software, and you can use, modify, and distribute it without any restrictions. Please note that you should exercise caution and ensure compliance with legal and regulatory requirements when using or deploying smart contracts on the Ethereum blockchain.

## Contributing

If you want to contribute to this project or have any suggestions, feel free to create issues or pull requests in the project's repository.

## Acknowledgments

- Special thanks to the Ethereum and Solidity developer community for their continuous support and contributions to the ecosystem.

Happy coding! 🚀
