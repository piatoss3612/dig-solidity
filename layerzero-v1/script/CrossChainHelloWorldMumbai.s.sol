// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import "../src/CrossChainHelloWorld.sol";
import "forge-std/Test.sol";

contract DeployScript is Script {
    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        new CrossChainHelloWorld(0xf69186dfBa60DdB133E91E9A4B5673624293d8F8);

        vm.stopBroadcast();
    }
}

contract SetupScript is Script {
    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        CrossChainHelloWorld instance = CrossChainHelloWorld(
            0x1e5501bf7a4821bE9251Aa617560c03f481A39bd
        );

        instance.trustAddress(0xe9b53942eadEeE83EB998554C042955B248bb30A);

        vm.stopBroadcast();
    }
}

contract CheckDataScript is Script {
    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(privateKey);

        CrossChainHelloWorld instance = CrossChainHelloWorld(
            0x1e5501bf7a4821bE9251Aa617560c03f481A39bd
        );

        console.log("data: ", instance.data());

        vm.stopBroadcast();
    }
}
