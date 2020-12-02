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
 }