# Fund Me ETH

This is a simple smart contract that allows users to contribute ETH, and lets the contract owner withdraw the accumulated funds.

# Getting Started

## Requirements

- **git**
    - Try running `git --version` to see if it is installed
- **foundry**
    - Try running `forge --version` to se if it is installed

## Quickstart

```bash
git clone https://github.com/lucasfhope/Fund-Me-ETH.git
cd Fund-Me-ETH
make
```

## Testing

This project includes unit and integration tests. To run the tests, use:

`forge test`

or

`make test`

You can also test a single test function with:

`forge test --match-test testFunctionName`

To test the coverage of the tests, you can use:

`forge coverage`

## Deployment to a testnet or mainnet

1. Setup environment variables

You'll want to set your SEPOLIA_RPC_URL and DEV_ACCOUNT_PRIVATE_KEY as environment variables. You can add them to a .env file. 

    - DEV_ACCOUNT_PRIVATE_KEY: The private key of your account. THIS IS FOR DEVELOPMENT ONLY, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
        
    - SEPOLIA_RPC_URL: This is url of the sepolia testnet node you're working with. You can get setup with one for free from Alchemy.

Optionally, add your ETHERSCAN_API_KEY if you want to verify your contract on [Etherscan](https://etherscan.io).

2. Get testnet ETH

You will need to get SepoliaETH from a faucet to deploy this contract or interact with my contract.

3. Deploy

```bash
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## Scripts

After deploying to a testnet or local net, you can run the scripts.

```bash
forge script script/Interactions.s.sol:FundFundMe --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY  --broadcast
forge script script/Interactions.s.sol:WithdrawFundMe --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY  --broadcast
```

or you can use `cast`:

```bash
cast send <CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
cast send <CONTRACT_ADDRESS> "withdraw()"  --private-key <PRIVATE_KEY>
```

## Estimate gas

You can estimate how much gas things cost by running by using:

```bash
forge snapshot
```

And you'll see an output file called `.gas-snapshot`


## Formatting

To run code formatting, use:

```bash
forge fmt
```

# My Fund Me Smart Contract

This contract is deployed on the Sepolia testnet. You can interact with my contract and send it SepoliaETH at this address:

`0x171347a51e682dD3457a30738fE7228b5c33Ec5A`
