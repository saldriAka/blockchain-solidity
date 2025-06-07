// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract GasOptimization {
    // Pack variables to use less storage slots
    // These variables pack into a single 256-bit slot
    uint128 public number1;     // 16 bytes
    uint96 public number2;      // 12 bytes
    uint16 public number3;      // 2 bytes
    uint8 public number4;       // 1 byte
    bool public flag;           // 1 byte
    
    // Unpacked - each uses a full slot
    uint256 public bigNumber;   // 32 bytes
    uint8 public smallNumber;   // 1 byte but uses full slot
    
    // Fixed size array is cheaper than dynamic
    uint[10] public fixedArray;
    
    // Cheaper than string
    bytes32 public constant HASH = keccak256("MyString");
    
    // Events for cheaper storage
    event ValueChanged(uint256 newValue);
    
    // Use unchecked for known safe math
    function sumArray(uint256[] calldata arr) public pure returns (uint256) {
        uint256 sum;
        unchecked {
            for(uint256 i = 0; i < arr.length; i++) {
                sum += arr[i];
            }
        }
        return sum;
    }
    
    // Short circuit to save gas
    function complexCheck(uint256 x, uint256 y) public pure returns (bool) {
        // Put cheaper check first
        return x < 100 && complexOperation(y);
    }
    
    function complexOperation(uint256 y) private pure returns (bool) {
        // Expensive operation
        return keccak256(abi.encodePacked(y)) > bytes32(0);
    }
    
    // Use calldata instead of memory for read-only arrays
    function processArray(uint256[] calldata arr) public pure returns (uint256) {
        return arr[0];
    }
    
    // Replace memory with calldata for read-only strings
    function processString(string calldata str) public pure returns (bytes32) {
        return keccak256(bytes(str));
    }
    
    // Batch operations to save gas
    uint256[] public values;
    
    function addMultipleValues(uint256[] calldata newValues) public {
        uint256 len = newValues.length;
        for(uint256 i = 0; i < len; i++) {
            values.push(newValues[i]);
        }
    }
}