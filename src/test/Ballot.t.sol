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

        // emit log_named_address("Deployer is", ballot.chairperson());

        // gets the bytes conversion of the strings
        // for (uint256 i = 0; i < proposalNames.length; i++) {
        //     emit log_bytes32(proposalNames[i]);
        // }
    }

    // Check if voter can vote < 300 seconds after given the right to
    function testVote() public {
        // set block.timestamp to 0
        vm.warp(0);
        emit log_named_uint(
            "Timestamp when addr1 is given right to vote",
            block.timestamp
        );
        ballot.giveRightToVote(addr1);

        // (uint256 startTime, uint256 vote) = ballot.getVoter(addr1);
        // emit log_named_uint("this is start time", startTime);
        // emit log_named_uint("this is vote", vote);

        // set block.timestamp to 19
        vm.warp(299);
        emit log_named_uint("Timestamp when addr1 votes", block.timestamp);
        vm.prank(addr1);
        ballot.vote(0);

        emit log_named_uint("The winner is", ballot.winningProposal());
    }

    // Check if voter can not vote > 300 seconds after given the right to
    function testFailVote() public {
        // set block.timestamp to 0
        vm.warp(0);
        emit log_named_uint(
            "Timestamp when addr1 is given right to vote",
            block.timestamp
        );
        ballot.giveRightToVote(addr1);

        // set block.timestamp to 21
        vm.warp(301);
        emit log_named_uint("Timestamp when addr1 votes", block.timestamp);
        vm.prank(addr1);
        ballot.vote(0);

        emit log_named_uint("The winner is", ballot.winningProposal());
    }
}
