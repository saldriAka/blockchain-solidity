// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
// Basic error handling example
contract BasicErrorHandling {
    uint256 public value;
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    // Example using require()
    function setValue(uint256 _newValue) public {
        // Check caller is owner
        require(msg.sender == owner, "Not the owner");
        // Validate input
        require(_newValue != 0, "Value cannot be zero");
        // Check not same value
        require(_newValue != value, "Same value already set");
        
        value = _newValue;
    }
    
    // Example using assert()
    function divide(uint256 _dividend, uint256 _divisor) public pure returns (uint256) {
        // Assert should be used to check for conditions that should never be false
        // Failing assertion probably means there's a bug
        assert(_divisor != 0);
        return _dividend / _divisor;
    }
    
    // Example using revert()
    function processSomething(uint256 _value) public pure returns (uint256) {
        if (_value == 0) {
            revert("Value cannot be zero");
        }
        if (_value > 100) {
            revert("Value too high");
        }
        return _value * 2;
    }
}
 
// Advanced error handling with try/catch
contract ExternalContract {
    uint256 public value;
    
    function setValue(uint256 _value) external {
        require(_value != 0, "Value cannot be zero");
        value = _value;
    }
    
    function doRevert() external pure {
        revert("Always reverts");
    }
}
 
contract TryCatchExample {
    event Success(string message, uint256 value);
    event Failure(string message, bytes data);
    
    ExternalContract public extContract;
    
    constructor() {
        extContract = new ExternalContract();
    }
    
    // Try/Catch with external calls
    function tryExternalCall(uint256 _value) public {
        try extContract.setValue(_value) {
            emit Success("Value set successfully", _value);
        } catch Error(string memory reason) {
            // Catches revert() and require() with error message
            emit Failure("Failed with error", bytes(reason));
        } catch Panic(uint errorCode) {
            // Catches assert() failures and division by zero
            emit Failure("Failed with panic", abi.encodePacked(errorCode));
        } catch (bytes memory lowLevelData) {
            // Catches any other errors
            emit Failure("Failed with low level error", lowLevelData);
        }
    }
}
 
// Custom errors example (Solidity 0.8.4+)
contract CustomErrorsExample {
    // Define custom errors
    error Unauthorized(address caller);
    error InvalidValue(uint256 value);
    error DeadlineExceeded(uint256 deadline, uint256 currentTime);
    
    address public owner;
    uint256 public value;
    
    constructor() {
        owner = msg.sender;
    }
    
    function setValue(uint256 _newValue) public {
        // Using custom error with parameters
        if (msg.sender != owner) {
            revert Unauthorized(msg.sender);
        }
        
        if (_newValue == 0) {
            revert InvalidValue(_newValue);
        }
        
        if (_newValue == value) {
            revert("Value already set");  // Traditional revert still works
        }
        
        value = _newValue;
    }
    
    function doSomethingBeforeDeadline(uint256 deadline) public view {
        if (block.timestamp > deadline) {
            revert DeadlineExceeded(deadline, block.timestamp);
        }
        // Do something...
    }
}