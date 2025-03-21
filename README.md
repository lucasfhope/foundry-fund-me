# Fund Me Solidity Smart Contract

This is a simple smart contract that allows users to contribute ETH, and lets the contract owner withdraw the accumulated funds.

- (#Getting Started)
- 

# Getting Started

## Requirements

- **git**
    - Try running `git --version` to see if it is installed
- **foundry**
    - Try running `forge --version` to se if it is installed

## Quickstart

```bash
git clone https://github.com/lucasfhope/solidity-fund-me.git
cd solidity-fund-me
make
```

# Usage

## Testing

To run the unit and integration tests, use:

```bash
forge test
```

You can also test a single test function with:

```bash
forge test --mt testFunctionName
```

To run a forked test on a forked Seplolia network, use:

```bash
forge test --fork-url $SEPOLIA_RPC_URL
```

To test the coverage of the tests, you can use:

```bash
forge coverage
```

## Deployment to the Sepolia test network

1. Setup environment variables

Look at the env.example and set up your own `.env` file:

- SEPOLIA_RPC_URL: This is url of the Sepolia testnet node you are working with. You can get setup with one for free through Alchemy.
- ETHERSCAN_API_KEY: This will allow you to verify your contract on [Etherscan](https://etherscan.io).
- KEYSTORE_FILE_PATH: Store your wallet private key locally with the command `cast wallet import [name] --interactive`

If you would like to use your environment variables from `.env` on the command line, run the command `source .env`. You can also use the name of the key rather than the entire file path after `--keystore` on the command line. If you use keystore, you will need to input your password you set when you created the key whenever you want to use it.

2. Get testnet ETH

You will need to get SepoliaETH from a faucet to deploy this contract or interact with my contract. Check out (https://faucets.chain.link/).

3. Deploy

```bash
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --keystore $KEYSTORE_FILE_PATH --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## Scripts

After deploying to the Sepolia testnet, you can use the scripts to interact with the contract.

```bash
forge script script/Interactions.s.sol:FundFundMe --rpc-url $SEPOLIA_RPC_URL --keystore $KEYSTORE_FILE_PATH  --broadcast
forge script script/Interactions.s.sol:WithdrawFundMe --rpc-url $SEPOLIA_RPC_URL --keystore $KEYSTORE_FILE_PATH  --broadcast
```

or you can use `cast`:

```bash
cast send <CONTRACT_ADDRESS> "fund()" --value 0.1ether --keystore $KEYSTORE_FILE_PATH --rpc-url $EPOLIA_RPC_URL
cast send <CONTRACT_ADDRESS> "withdraw()"  --keystore $KEYSTORE_FILE_PATH --rpc-url $SEPOLIA_RPC_URL
```

## Estimate gas

You can estimate how much gas would be used during the tests by using:

```bash
forge snapshot
```

And you'll see an output file called `.gas-snapshot`.

## Formatting

To run soldity code formatting, use:

```bash
forge fmt
```

## Makefile

You can use the arranged Makefile for all of the previous commands. 

If you want to deploy or interact with a contract on the SEPLOIA testnet, make sure your `.env` file is set up with the correct environment variables. To deploy or interact, make sure you add `ARGS="sepolia" at the end of the command or the command will default to your local anvil chain. For example:

```bash
make deploy ARGS="sepolia"
```

# My Fund Me Smart Contract

This contract is deployed on the Sepolia testnet. You can interact with my contract and send it SepoliaETH at this address:

`0x171347a51e682dD3457a30738fE7228b5c33Ec5A`
