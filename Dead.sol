// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22;


import "./Ownable.sol";

/**
 * @title Dead
 * @dev Kill the contract
 */
contract Dead is Ownable{

    /**
     * @dev Set selfdestruct contract, only owner
     */
    function kill() public Owned{
        selfdestruct(owner);
    }
}
