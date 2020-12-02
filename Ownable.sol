// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22;


/**
 * @title Ownable
 * @dev Set owner
 */
contract Ownable {
    address payable owner;

    /**
     * @dev Set contract deployer as owner
     */
    constructor() {
        owner = msg.sender;
    }

    // modifier to check if caller is owner
    modifier Owned {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }
}
