// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

contract format {
    bytes8 example = 0x11030330f020D5C5;

    //uint conversion — truncated from left when converting to lower //bytes; adds 0 to the left when coverting to higher bytes
    uint64 public v1 = uint64(example);
    //uint64 conversion is allowed for bytes8
    uint32 public v2 = uint32(v1);
    //v2 == uint32(0xf020D5C5)
    uint96 public v3 = uint96(v1);
    bytes12 public b = bytes12(v3);
    //bytes16(uint32(uint64(example))) = 0x0000000011030330f020d5c5
    bytes4 public b1 = bytes4(v2);
    //bytes4(uint32(uint64(example))) = 0xf020D5C5

    //bytes to bytes conversion — truncates from right
    bytes4 public b2 = bytes4(example);
    //bytes4(example) 0x11030330

    //string conversion — truncates from right when converting to lower //bytes; adds 0 to the right when coverting to higher bytes
    string public s = "abcd";
    bytes public b3 = bytes(s);
    //b3 = 0x61626364
    bytes2 public b4 = bytes2(b3);
    //b4 = bytes2(bytes(s)) = 0x6162
    bytes16 public b5 = bytes16(b3);
    //b5 = bytes16(bytes(s)) = 0x61626364000000000000000000000000
    string public s1 = string(b3);
    //s1 = “abcd”

    //address conversion
    address a1 = 0x2014a9707099DFcbA3Bb91D23b31cF7Be61941d9;
    bytes20 public b6 = bytes20(a1); // works
    bytes32 public b7 = bytes32(abi.encode(a1)); //works

    //bool conversion
    bytes32 public b8 = bytes32(abi.encode(true)); //works
}
