// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract StringOperations {
    // State variables
    string public storedString = "Hello";
    
    // String comparison using keccak256 hash
    function compareStrings(string memory str1, string memory str2) public pure returns (bool) {
        return keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2));
    }
    
    // String concatenation using string.concat (Solidity 0.8.12+)
    function concatenateStrings(string memory str1, string memory str2) public pure returns (string memory) {
        return string.concat(str1, str2);
    }
    
    // Multiple string concatenation with a number using string.concat
    function concatenateWithNumber(string memory str1, uint256 number, string memory str2) public pure returns (string memory) {
        return string.concat(str1, " ", toString(number), " ", str2);
    }
    
    // Legacy concatenation using abi.encodePacked
    function concatenateStringsLegacy(string memory str1, string memory str2) public pure returns (string memory) {
        return string(abi.encodePacked(str1, str2));
    }
    
    // Convert uint to string using OpenZeppelin's approach
    function toString(uint256 value) internal pure returns (string memory) {
        // Special case for 0
        if (value == 0) {
            return "0";
        }
        
        // Get number of digits
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        
        // Create bytes array
        bytes memory buffer = new bytes(digits);
        
        // Fill buffer from right to left
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        
        return string(buffer);
    }
    
    // Demonstrate different encoding methods
    function demonstrateEncoding(string memory str1, string memory str2) public pure returns (bytes memory, bytes memory, bytes memory) {
        // abi.encode: Pads data to 32 bytes
        bytes memory encoded = abi.encode(str1, str2);
        
        // abi.encodePacked: Minimal encoding without padding
        bytes memory encodedPacked = abi.encodePacked(str1, str2);
        
        // keccak256: Creates a hash of the data
        bytes memory hashed = abi.encodePacked(keccak256(abi.encodePacked(str1, str2)));
        
        return (encoded, encodedPacked, hashed);
    }
    
    // Get string length (UTF-8 bytes length)
    function getStringLength(string memory str) public pure returns (uint256) {
        return bytes(str).length;
    }
}