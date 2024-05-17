// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Ownable.sol";
import "./Address.sol";

contract ConsentContract is Ownable {
    using Address for address;

    struct Consent {
        string data;
        address firstParty;
        address secondParty;
        bool isAccepted;
    }

    Consent[] private consents;
    mapping(address => bool) public isAdmin;

    event ConsentInitiated(uint256 indexed consentId, address indexed firstParty, address indexed secondParty, string data);
    event ConsentResponded(uint256 indexed consentId, address indexed responder, bool isAccepted);

    constructor() Ownable(msg.sender) {
        isAdmin[msg.sender] = true;
    }

    modifier onlyAdmin() {
        require(isAdmin[msg.sender], "Only admin can perform this action");
        _;
    }

    /**
     * @dev Add a new admin
     * @param admin The address of the admin to be added
     */
    function addAdmin(address admin) external onlyOwner {
        isAdmin[admin] = true;
    }

    /**
     * @dev Remove an admin
     * @param admin The address of the admin to be removed
     */
    function removeAdmin(address admin) external onlyOwner {
        isAdmin[admin] = false;
    }

    /**
     * @dev Initiate a new consent
     * @param firstParty The address of the first party
     * @param secondParty The address of the second party
     * @param data The consent data
     */
    function initiateConsent(address firstParty, address secondParty, string memory data) external onlyAdmin {
        require(firstParty != address(0), "Invalid first party address");
        require(secondParty != address(0), "Invalid second party address");

        uint256 consentId = consents.length;
        consents.push(Consent(data, firstParty, secondParty, false));

        emit ConsentInitiated(consentId, firstParty, secondParty, data);
    }

    /**
     * @dev Respond to a consent
     * @param consentId The ID of the consent
     * @param isAccepted The response status (true for accepted, false for rejected)
     */
    function respondToConsent(uint256 consentId, bool isAccepted) external {
        require(consentId < consents.length, "Invalid consent ID");

        Consent storage consent = consents[consentId];
        require(msg.sender == consent.secondParty, "Only second party can respond to consent");

        consent.isAccepted = isAccepted;

        emit ConsentResponded(consentId, msg.sender, isAccepted);
    }

    /**
     * @dev Get the details of a consent
     * @param consentId The ID of the consent
     * @return The consent data, first party address, second party address, and acceptance status
     */
    function getConsent(uint256 consentId) external view returns (string memory, address, address, bool) {
        require(consentId < consents.length, "Invalid consent ID");

        Consent storage consent = consents[consentId];
        require(msg.sender == consent.firstParty || msg.sender == consent.secondParty || msg.sender == owner(), "Unauthorized access");

        return (consent.data, consent.firstParty, consent.secondParty, consent.isAccepted);
    }
}
