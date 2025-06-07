// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract ControlFlow {
    // State variables
    uint256[] public numbers;
    
    // If/else example with ternary operator
    function checkValue(uint256 _value) public pure returns (string memory) {
        // Traditional if/else
        if (_value > 100) {
            return "Greater than 100";
        } else if (_value == 100) {
            return "Equal to 100";
        } else {
            return "Less than 100";
        }
    }
    
    // Ternary operator example
    function isEven(uint256 _number) public pure returns (string memory) {
        // Ternary operator: condition ? value if true : value if false
        return _number % 2 == 0 ? "Even" : "Odd";
    }
    
    // For loop example
    function sumArray() public view returns (uint256) {
        uint256 sum = 0;
        
        for(uint256 i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        
        return sum;
    }
    
    // While loop example (with break and continue)
    function findFirstMultipleOf(uint256 _number) public view returns (uint256) {
        uint256 i = 0;
        
        while(i < numbers.length) {
            // Skip if number is 0
            if(numbers[i] == 0) {
                i++;
                continue;
            }
            
            // Found a multiple
            if(numbers[i] % _number == 0) {
                break;
            }
            
            i++;
        }
        
        return i < numbers.length ? numbers[i] : 0;
    }
    
    // Function to add numbers for testing
    function addNumber(uint256 _number) public {
        numbers.push(_number);
    }
}