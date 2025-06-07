// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract IntegerOverflowUnderflow {
    // By default, all arithmetic operations in Solidity 0.8+ 
    // will automatically check for overflow/underflow
    uint8 public myUint8 = 255; // maximum value for uint8
    
    // This will fail with a panic error
    function increment() public {
        myUint8++; // This will revert because 255 + 1 overflows uint8
    }
    
    // This will fail with a panic error
    function decrement() public {
        myUint8--; // This will revert because 0 - 1 underflows uint8
    }
    
    // Using unchecked block to allow overflow/underflow
    function incrementUnchecked() public {
        unchecked {
            myUint8++; // This will wrap around to 0
        }
    }
    
    // Using unchecked block to allow overflow/underflow
    function decrementUnchecked() public {
        unchecked {
            myUint8--; // This will wrap around to 255
        }
    }
    
    // Demonstrate unchecked block in calculations
    function multiply(uint256 x, uint256 y) public pure returns (uint256) {
        // Normal checked multiplication
        uint256 result1 = x * y; // Will revert on overflow
        
        // Unchecked multiplication
        unchecked {
            uint256 result2 = x * y; // Will not revert, will wrap around
            return result2;
        }
    }
}