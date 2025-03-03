// SPDX-License-Indentifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fundFundMe(address contractAddress) public {
        vm.startBroadcast();
        FundMe(payable(contractAddress)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("FundMe funded with %s", SEND_VALUE);
    }

    function run() external {
        address contractAddress = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);

        fundFundMe(contractAddress);
    }
}

contract WithdrawFundMe is Script {
    function withdrawFundMe(address contractAddress) public {
        vm.startBroadcast();
        FundMe(payable(contractAddress)).withdraw();
        vm.stopBroadcast();
        console.log("FundMe withdrawn from");
    }

    function run() external {
        address contractAddress = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);

        withdrawFundMe(contractAddress);
    }
}
