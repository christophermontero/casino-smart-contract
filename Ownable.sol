// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;


/**
 * @title Ownable
 * @dev Set owner
 */
contract Ownable {
    address private owner;

    /**
     * @dev Set contract deployer as owner
     */
    constructor() {
        owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
    }

    // modifier to check if caller is owner
    modifier Owned {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }
}
