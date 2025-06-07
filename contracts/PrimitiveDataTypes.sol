// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract PrimitiveDataTypes {
    // Boolean type
    bool public isActive = true;
    
    // Integer types
    int8 public smallNumber = -128;    // -128 to 127
    uint8 public smallUnsigned = 255;  // 0 to 255
    int public signedNumber = -1234;   // default int256
    uint public unsignedNumber = 1234; // default uint256
    
    // Address types
    address public contractOwner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address payable public payableAddress; // can receive Ether
    
    // Byte types
    bytes1 public singleByte = 0xFF;   // Fixed-size byte array (1 byte)
    bytes public dynamicBytes;         // Dynamic-size byte array
    
    // Fixed-point numbers (not fully supported yet)
    // fixed public fixedNumber;       // Fixed point number
    
    // Function to demonstrate type assignments
    function updateValues(
        bool _isActive,
        uint8 _small,
        address _owner,
        bytes1 _byte
    ) public {
        isActive = _isActive;
        smallUnsigned = _small;
        contractOwner = _owner;
        singleByte = _byte;
    }
    
    // Function to demonstrate type conversions
    function typeConversions() public pure returns (uint) {
        int16 smallInt = 250;
        // uint32 mediumUint = uint32(smallInt); // explicit conversion required
        // return mediumUint;
    }
}