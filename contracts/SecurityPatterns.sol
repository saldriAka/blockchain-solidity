// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract SecurityPatterns {
    // State variables
    address public owner;
    bool public paused;
    uint256 public lastActionTimestamp;
    mapping(address => uint256) public balances;
    
    // Constants
    uint256 public constant COOLDOWN_PERIOD = 1 days;
    uint256 public constant MAX_BALANCE = 1000 ether;
    
    // Events
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event Paused(address account);
    event Unpaused(address account);
    
    // Constructor
    constructor() {
        owner = msg.sender;
    }
    
    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    
    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }
    
    modifier withCooldown() {
        require(block.timestamp >= lastActionTimestamp + COOLDOWN_PERIOD, 
                "Action in cooldown");
        _;
        lastActionTimestamp = block.timestamp;
    }
    
    modifier validAmount(uint256 amount) {
        require(amount > 0, "Amount must be positive");
        require(amount <= MAX_BALANCE, "Amount exceeds maximum");
        _;
    }
    
    // Reentrancy Guard
    bool private locked;
    modifier noReentrant() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }
    
    // Functions
    function pause() public onlyOwner {
        paused = true;
        emit Paused(msg.sender);
    }
    
    function unpause() public onlyOwner {
        paused = false;
        emit Unpaused(msg.sender);
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
    
    // Example of multiple modifiers
    function deposit() public payable 
        whenNotPaused 
        withCooldown 
        validAmount(msg.value) 
    {
        balances[msg.sender] += msg.value;
    }
    
    // Example of reentrancy protection
    function withdraw(uint256 amount) public 
        whenNotPaused 
        noReentrant 
        validAmount(amount) 
    {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        balances[msg.sender] -= amount;
        
        // Potential reentrancy attack vector, but protected by noReentrant
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }
    
    // Emergency withdrawal
    function emergencyWithdraw() public onlyOwner {
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }
}