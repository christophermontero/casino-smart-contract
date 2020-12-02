// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.21;


/**
 * @title Ownable
 * @dev Set owner
 */
contract Ownable {
    address private owner;

    /**
     * @dev Set contract deployer as owner
     */
    function Ownable() public {
        owner = msg.sender;
    }

    // modifier to check if caller is owner
    modifier Owned {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }
}
