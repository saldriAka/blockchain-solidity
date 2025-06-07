//SPDX-License-Identifier: MIT
 
pragma solidity 0.7.0;
 
contract ExampleWrapAround {
    
    uint8 public myUint8 = 250; 
 
    function decrement() public {
        myUint8--;
    }
 
    function increment() public {
        myUint8++;
    }
}