// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract HelloWorld {
    // State variable to store the greeting
    string private greeting = "Hello World!";
    
    // Event emitted when greeting is changed
    event GreetingChanged(string newGreeting);
    
    // Returns the current greeting
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
    
    // Changes the greeting
    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
        emit GreetingChanged(_newGreeting);
    }
}