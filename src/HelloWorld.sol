// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

contract HelloWorld {
    // Integer stored as a state variable
    uint256 public num;

    // Stores the unsigned integer that's passed into the function
    function storeNumber(uint256 _num) public {
        num = _num;
    }

    // retrieves the number that's stored in the `storeNumber` function
    // will return zero if an integer has not been stored
    function retrieveNumber() public view returns (uint256) {
        return num;
    }
}
