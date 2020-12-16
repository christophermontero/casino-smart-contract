// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22;

import "./Ownable.sol";
import "./Dead.sol";

/**
 * @title Casino
 * @dev Set the bet and the house edge
 */
 contract Casino is Dead{
     uint minBet;
     uint houseEdge;
     uint winningNum;
     uint amountWon;

    // event for Winner
     event Won(bool status, uint amount);

    /**
     * @dev Set the initial state of contract
     * @param _minBet Minimum bet
     * @param _houseEdge House profit margin in %
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

    /**
     * @dev Trigger the event when user wins
     * @param num Number to bet
     */
     function bet(uint num) payable public{
         require(num > 0 && num <= 10);
         require(msg.value >= minBet);
         winningNum = (uint256(keccak256(block.timestamp, block.difficulty)) % 5) + 1;
         if (num == winningNum) {
             amountWon = msg.value * (100 - houseEdge)/10;
             if(!msg.sender.send(amountWon)) revert();
             emit Won(true, amountWon);
         } else {
             emit Won(false, 0);
         }
     }

    /**
     * @dev View Casino balance
     */
     function checkBalance() Owned public view returns(uint){
         return address(this).balance / 1e18; // balance in ETH
     }

    /**
     * @dev View winning number
     */
     function checkWinNumber() Owned public view returns(uint){
         return winningNum;
     }
 }