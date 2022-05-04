// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

import "ds-test/test.sol";
import "../Ballot.sol";
import "forge-std/Test.sol";

contract ContractTest is DSTest {
    Ballot ballot;
    Vm private vm = Vm(HEVM_ADDRESS);
    bytes32[] proposalNames;

    address private addr1 = address(1);
    address private addr2 = address(2);

    function setUp() public {
        proposalNames.push(bytes32("perelyn"));
        proposalNames.push(bytes32("will"));
        proposalNames.push(bytes32("be"));

        ballot = new Ballot(proposalNames);

        emit log_named_address("Deployer is", ballot.chairperson());

        for (uint256 i = 0; i < proposalNames.length; i++) {
            emit log_bytes32(proposalNames[i]);
        }

        vm.warp(1);
    }

    function testExample() public {
        emit log_named_uint("The time is", block.timestamp);

        ballot.giveRightToVote(addr1);
        // log_named_uint("start time", ballot.voters(addr1).startTime);

        vm.prank(addr1);
        // ballot.vote(1);

        emit log_named_bytes32("The winner is", ballot.winnerName());
        emit log_named_uint("The winner is", ballot.winningProposal());
        assertTrue(true);
    }
}
// 0x706572656c796e00000000000000000000000000000000000000000000000000
// 0x706572656c796e00000000000000000000000000000000000000000000000000

// ["0x706572656c796e00000000000000000000000000000000000000000000000000", "0x77696c6c00000000000000000000000000000000000000000000000000000000", " "0x6265000000000000000000000000000000000000000000000000000000000000"]

// ["0x706572656c796e00000000000000000000000000000000000000000000000000"]
