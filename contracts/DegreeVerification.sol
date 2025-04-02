// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DegreeVerification {
    struct Degree {
        string firstName;
        string lastName;
        string rollNumber;
        string gender;
        string course;
        string email;
        string year;
        string graduationYear;
        string gpa;
        bool exists;
    }

    mapping(bytes32 => Degree) private degrees;
    address public admin;

    event DegreeAdded(bytes32 indexed degreeHash, string firstName, string lastName, string rollNumber);

    constructor() {
        admin = msg.sender;
    }

    function addDegree(
        string memory _firstName,
        string memory _lastName,
        string memory _rollNumber,
        string memory _gender,
        string memory _course,
        string memory _email,
        string memory _year,
        string memory _graduationYear,
        string memory _gpa,
        bytes32 _hexCode
    ) public {
        require(msg.sender == admin, "Only admin can add degrees");
        require(!degrees[_hexCode].exists, "Degree already exists");

        degrees[_hexCode] = Degree(
            _firstName,
            _lastName,
            _rollNumber,
            _gender,
            _course,
            _email,
            _year,
            _graduationYear,
            _gpa,
            true
        );
        emit DegreeAdded(_hexCode, _firstName, _lastName, _rollNumber);
    }

    function verifyDegree(bytes32 _hexCode) public view returns (bool) {
        return degrees[_hexCode].exists;
    }
}
