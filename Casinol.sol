// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;


import "./Dead.sol";

/**
 * @title Casino
 * @dev Set the bets and the house edge
 */
 contract Casino is Dead{
     uint minBet;
     uint houseEdge;
     uint winningNum;

    // event for Winner
     event Won(bool status, uint amount);

    /**
     * @dev Set the initial state of contract
     */
     constructor(uint _minBet, uint _houseEdge) payable{
         require(_minBet > 0);
         require(_houseEdge <= 100);
         minBet = _minBet;
         houseEdge = _houseEdge;
     }

     function() public {
         revert();
     }
 }