# Fund Me Solidity Smart Contract

This is a simple smart contract that allows users to contribute ETH, and lets the contract owner withdraw the accumulated funds.

- [Fund Me Solidity Smart Contract](#fund-me-solidity-smart-contract)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
- [Usage](#usage)
  - [Test](#test)
  - [Deploy](#deploy)
  - [Interact](#interact)
  - [Estimate gas](#estimate-gas)
  - [Format](#format)
  - [Use the Makefile](#use-the-makefile)
- [My Fund Me Smart Contract](#my-fund-me-smart-contract)

# Getting Started

## Requirements

- **git**
    - Try running `git --version` to see if it is installed
- **foundry**
    - Try running `forge --version` to see if it is installed

## Quickstart

```bash
git clone https://github.com/lucasfhope/solidity-fund-me.git
cd solidity-fund-me
make
```

# Usage

## Test

To run the unit and integration tests, use the command:

```bash
forge test
```

You can also test a single test function with:

```bash
forge test --mt testFunctionName
```

To run a forked test on a forked Seplolia testnet, you must have an rpc-url of a Sepolia testnet node:

```bash
forge test --fork-url $SEPOLIA_RPC_URL
```

To test the coverage of the tests, you can use the command:

```bash
forge coverage
```

## Deploy

### Local deployment

1. Run a local anvil node

```bash
make anvil
```

Make sure this node remains running in a seperate terminal.

2. Deploy to the local anvil chain

```bash
make deploy
```

### Deployment to the Sepolia testnet

1. Setup environment variables

Look at the env.example and set up your own `.env` file:

- SEPOLIA_RPC_URL: This is url of the Sepolia testnet node you are working with. You can get setup with one for free through [Alchemy](https://www.alchemy.com).
- ETHERSCAN_API_KEY: This will allow you to verify your contract on [Etherscan](https://etherscan.io).
- KEYSTORE_FILE_PATH: Store your wallet private key locally with the command `cast wallet import [name] --interactive`

If you would like to use your environment variables from `.env` on the command line, run the command `source .env`. You can also use the name of the key rather than the entire file path after `--keystore` on the command line. If you use keystore, you will need to input your password you set when you created the key whenever you want to use it.

2. Get testnet ETH

You will need to get Sepolia ETH from a faucet to deploy this contract or interact with my contract. Check out [faucets.chain.link](https://faucets.chain.link/).

3. Deploy

```bash
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --keystore $KEYSTORE_FILE_PATH --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## Interact

After deploying to your local anvil chain or the Sepolia testnet, you can use the scripts or `cast` to interact with the contract.

### Local anvil chain
```bash
forge script script/Interactions.s.sol:FundFundMe --rpc-url http://localhost:8545 --private-key <ANVIL PRIVATE KEY> --broadcast
forge script script/Interactions.s.sol:WithdrawFundMe --rpc-url http://localhost:8545 --private-key <ANVIL PRIVATE KEY> --broadcast
```
or
```bash
cast send <CONTRACT_ADDRESS> "fund()" --value 0.1ether --rpc-url $EPOLIA_RPC_URL  --private-key <ANVIL PRIVATE KEY>
cast send <CONTRACT_ADDRESS> "withdraw()" --rpc-url $SEPOLIA_RPC_URL  --private-key <ANVIL PRIVATE KEY>
```

### Sepolia testnet
```bash
forge script script/Interactions.s.sol:FundFundMe --rpc-url $SEPOLIA_RPC_URL --keystore $KEYSTORE_FILE_PATH  --broadcast
forge script script/Interactions.s.sol:WithdrawFundMe --rpc-url $SEPOLIA_RPC_URL --keystore $KEYSTORE_FILE_PATH  --broadcast
```
or
```bash
cast send <CONTRACT_ADDRESS> "fund()" --value 0.1ether  --rpc-url $SEPOLIA_RPC_URL --keystore $KEYSTORE_FILE_PATH
cast send <CONTRACT_ADDRESS> "withdraw()" --rpc-url $SEPOLIA_RPC_URL --keystore $KEYSTORE_FILE_PATH
```

## Estimate gas

You can estimate how much gas would be used during the tests by using:

```bash
forge snapshot
```

And you'll see an output file called `.gas-snapshot`.

## Format

To run soldity code formatting, use:

```bash
forge fmt
```

## Use the Makefile

You can use the arranged Makefile for all of the previous commands. 

If you want to deploy or interact with the contract on the SEPLOIA testnet, make sure your `.env` file is set up with the correct environment variables. To deploy or interact with the contract, make sure you add `ARGS="sepolia" at the end of the command or the command will default to anvil. For example:

```bash
make deploy ARGS="sepolia"
```

# My Fund Me Smart Contract

This contract is deployed on the Sepolia testnet. You can interact with my contract and send it Sepolia ETH at this address:

`0x29b5aD2b4a2930174c7e6527ff144d29f1523045`

You can also check out my contract on [Etherscan](https://sepolia.etherscan.io/address/0x29b5aD2b4a2930174c7e6527ff144d29f1523045).

--- 

This project was created while taking the Foundry Full Course on Cyfrin Updraft. 

This project is based on https://github.com/Cyfrin/foundry-fund-me-cu.
