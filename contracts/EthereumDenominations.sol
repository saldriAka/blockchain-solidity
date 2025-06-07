// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract EthereumDenominations {
    // Ethereum denominations
    uint public constant WEI_IN_GWEI = 1e9;      // 1 gwei = 10^9 wei
    uint public constant WEI_IN_ETHER = 1e18;    // 1 ether = 10^18 wei
    
    // Address types
    address public immutable owner;               // Regular address (cannot receive ether)
    address payable public treasury;              // Payable address (can receive ether)
    
    // Track balances
    mapping(address => uint256) public balances;
    
    constructor() {
        owner = msg.sender;
        treasury = payable(msg.sender);  // Convert regular address to payable
    }
    
    // Demonstrate wei conversions
    function convertWeiToGwei(uint256 _wei) public pure returns (uint256) {
        return _wei / WEI_IN_GWEI;  // Convert wei to gwei
    }
    
    function convertWeiToEther(uint256 _wei) public pure returns (uint256) {
        return _wei / WEI_IN_ETHER; // Convert wei to ether
    }
    
    // Demonstrate address payable functionality
    receive() external payable {
        balances[msg.sender] += msg.value;
    }
    
    function withdrawToTreasury() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 balance = address(this).balance;
        
        // Transfer to payable address
        (bool success, ) = treasury.call{value: balance}("");
        require(success, "Transfer failed");
    }
    
    // Demonstrate address conversion
    function updateTreasury(address _newTreasury) public {
        require(msg.sender == owner, "Only owner can update treasury");
        treasury = payable(_newTreasury);  // Convert regular address to payable
    }
    
    // Get contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}