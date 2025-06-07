// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract ArrayExamples {
    // Fixed-size array
    uint[5] public fixedArray;
    
    // Dynamic array
    uint[] public dynamicArray;
    
    // Array of strings
    string[] public stringArray;
    
    // Memory array (only in functions)
    function createMemoryArray(uint size) public pure returns (uint[] memory) {
        // Memory arrays must be fixed-size
        uint[] memory memoryArray = new uint[](size);
        
        // Fill array with some values
        for(uint i = 0; i < size; i++) {
            memoryArray[i] = i + 1;
        }
        
        return memoryArray;
    }
    
    // Array operations
    function arrayOperations() public {
        // Push: Add to end of array
        dynamicArray.push(1);
        dynamicArray.push(2);
        
        // Pop: Remove and return last element
        if(dynamicArray.length > 0) {
            dynamicArray.pop();
        }
        
        // Length
        uint length = dynamicArray.length;
        
        // Delete: Resets element to default value (0)
        // but keeps array length unchanged
        if(length > 0) {
            delete dynamicArray[0];
        }
    }
    
    // Array limitations and gas considerations
    function arrayLimitations() public {
        // Fixed arrays are limited by stack depth (around 16 elements)
        uint[3] memory smallArray = [uint(1), 2, 3];
        
        // Dynamic arrays can grow but:
        // 1. Push operations cost more gas as size increases
        // 2. Iteration becomes expensive with large arrays
        // 3. Array length is limited by block gas limit
        
        // Use this array for demonstration
        for(uint i = 0; i < smallArray.length; i++) {
            dynamicArray.push(smallArray[i]);
        }
    }
    
    // When to use arrays vs mappings
    mapping(uint => uint) public numberMapping;
    
    function arrayVsMapping() public {
        // Arrays are better when you need:
        // 1. Length/size tracking
        // 2. Iteration over elements
        // 3. Sequential access
        // 4. Push/pop operations
        
        // Mappings are better when you need:
        // 1. Random access by key
        // 2. Sparse data structures
        // 3. Large number of elements
        // 4. No need for iteration
        
        // Example: Using mapping
        numberMapping[0] = 100;
        numberMapping[1] = 200;
        
        // No length property
        // No iteration capability
        // But very efficient key-based access
    }
}