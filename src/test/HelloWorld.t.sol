// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

import "ds-test/test.sol";
import "../HelloWorld.sol";

contract HelloWorldTest is DSTest {
    HelloWorld helloWorld;
    uint256 num;

    function setUp() public {
        helloWorld = new HelloWorld();
        num = 7;
    }

    function testExample() public {
        helloWorld.storeNumber(num);
        uint256 newNum = helloWorld.num();
        assertEq(num, newNum);
        // assertTrue(true);
    }
}
