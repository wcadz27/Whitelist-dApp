// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAdresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAdresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max addresses has been reached");
        whitelistedAdresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}