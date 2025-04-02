// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DataStorage {
    string private storedData;

    function setData(string memory _data) public {
        storedData = _data;
    }

    function getData() public view returns (string memory) {
        return storedData;
    }
}
