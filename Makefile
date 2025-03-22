-include .env

.PHONY: all test clean remove install update build format anvil deploy send-eth

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

help:
	@echo "Usage:"
	@echo "  make deploy [ARGS=...]\n    example: make deploy ARGS=\"sepolia\""
	@echo ""
	@echo "  make fund [ARGS=...]\n    example: make fund ARGS=\"sepolia\""
	@echo ""
	@echo "  make withdraw [ARGS=...]\n    example: make withdraw ARGS=\"sepolia\""

all: clean remove install update build

# Clean the repo
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install cyfrin/foundry-devops@0.2.2 --no-commit && forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit && forge install foundry-rs/forge-std@v1.8.2 --no-commit

# Update Dependencies
update:; forge update

build:; forge build

test :; forge test

format :; forge fmt

snapshot :; forge snapshot

anvil :; anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

NETWORK_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

ifeq ($(findstring sepolia,$(ARGS)), sepolia)
	NETWORK_ARGS := --rpc-url $(SEPOLIA_RPC_URL) --keystore $(KEYSTORE_FILE_PATH) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv
endif

deploy:
	@forge script script/DeployFundMe.s.sol:DeployFundMe ${NETWORK_ARGS}

fund:
	@forge script script/Interactions.s.sol:FundFundMe ${NETWORK_ARGS}

# only contract owner can withdraw
withdraw:
	@forge script script/Interactions.s.sol:WithdrawFundMe ${NETWORK_ARGS}