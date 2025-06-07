// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract MappingsAndStructs {
    // Simple mapping
    mapping(address => uint256) public balances;
    
    // Nested mapping
    mapping(address => mapping(address => bool)) public isApproved;
    
    // Struct definition
    struct User {
        string name;
        uint256 age;
        address wallet;
        bool isActive;
    }
    
    // Mapping using struct
    mapping(address => User) public users;
    
    // Array of custom struct
    User[] public userList;
    
    // Events
    event UserCreated(address indexed userAddress, string name);
    event BalanceUpdated(address indexed user, uint256 newBalance);
    
    // Add balance to address
    function addBalance(uint256 _amount) public {
        balances[msg.sender] += _amount;
        emit BalanceUpdated(msg.sender, balances[msg.sender]);
    }
    
    // Approve address to manage funds
    function approve(address _spender) public {
        isApproved[msg.sender][_spender] = true;
    }
    
    // Create new user
    function createUser(string memory _name, uint256 _age) public {
        User memory newUser = User({
            name: _name,
            age: _age,
            wallet: msg.sender,
            isActive: true
        });
        
        users[msg.sender] = newUser;
        userList.push(newUser);
        
        emit UserCreated(msg.sender, _name);
    }
    
    // Update user information
    function updateUser(string memory _newName, uint256 _newAge) public {
        require(users[msg.sender].wallet == msg.sender, "User does not exist");
        
        users[msg.sender].name = _newName;
        users[msg.sender].age = _newAge;
    }
    
    // Get user count
    function getUserCount() public view returns (uint256) {
        return userList.length;
    }
    
    // Check if user exists and is active
    function isUserActive(address _userAddress) public view returns (bool) {
        return users[_userAddress].isActive;
    }
}