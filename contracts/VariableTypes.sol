// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract VariableTypes {
    // Storage Variables - Persistent state variables
    string public storedData = "This is stored in blockchain storage";
    uint256[] public numbers;
    
    // Constant Variable - Value fixed at compile time
    // Gas efficient as value is replaced during compilation
    uint256 public constant MAX_NUMBERS = 100;
    
    // Immutable Variable - Can be set once in constructor
    // Gas efficient as value is replaced during deployment
    address public immutable DEPLOYER;
    
    constructor() {
        DEPLOYER = msg.sender;
        numbers.push(1);  // Initialize storage array
    }
    
    // Function demonstrating memory vs calldata for parameters
    // Calldata is read-only and more gas efficient for parameters
    function processString(string calldata _text) public pure returns (string memory) {
        // Cannot modify _text as it's calldata
        return _text;
    }
    
    // Function demonstrating memory usage
    // Memory is mutable but temporary
    function concatenateString(string memory _text) public view returns (string memory) {
        // Create new string in memory
        string memory result = string(
            abi.encodePacked(storedData, " + ", _text)
        );
        return result;
    }
    
    // Function demonstrating storage vs memory
    function updateAndReturn(uint256 newNumber) public returns (uint256[] memory) {
        // Storage reference - modifies blockchain state
        numbers.push(newNumber);
        
        // Memory array - temporary copy
        uint256[] memory tempArray = new uint256[](numbers.length);
        for(uint i = 0; i < numbers.length; i++) {
            tempArray[i] = numbers[i];
        }
        
        return tempArray;
    }
}