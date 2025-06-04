//SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

contract MyContact{
    string public ourString = "Hello, World!";

    function updateOurtString(string memory _updateString) public  {
        ourString = _updateString;
    }
}