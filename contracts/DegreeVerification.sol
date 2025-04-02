// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DegreeVerification {
    struct Degree {
        string studentName;
        string university;
        string degree;
        string graduationYear;
        bool exists;
    }

    mapping(bytes32 => Degree) private degrees;
    address public admin;

    event DegreeAdded(bytes32 indexed degreeHash, string studentName, string university);

    constructor() {
        admin = msg.sender;
    }

    function addDegree(
        string memory _studentName,
        string memory _university,
        string memory _degree,
        string memory _graduationYear
    ) public {
        require(msg.sender == admin, "Only admin can add degrees");
        
        bytes32 degreeHash = keccak256(abi.encodePacked(_studentName, _university, _degree, _graduationYear));
        require(!degrees[degreeHash].exists, "Degree already exists");

        degrees[degreeHash] = Degree(_studentName, _university, _degree, _graduationYear, true);
        emit DegreeAdded(degreeHash, _studentName, _university);
    }

    function verifyDegree(
        string memory _studentName,
        string memory _university,
        string memory _degree,
        string memory _graduationYear
    ) public view returns (bool) {
        bytes32 degreeHash = keccak256(abi.encodePacked(_studentName, _university, _degree, _graduationYear));
        return degrees[degreeHash].exists;
    }
}
