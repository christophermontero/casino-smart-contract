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

     fallback() external {
         revert();
     }

    /**
     * @dev Trigger the event when user wons
     * @param num Number to bet
     */
     function bet(uint num) payable public{
         require(num > 0 && num <= 10);
         require(msg.value >= minBet);
         bytes memory bytes2Hashed = toBytes(block.timestamp + block.difficulty);
         winningNum = uint(keccak256(bytes2Hashed));
         if (num == winningNum) {
             amountWon = msg.value * (100 - houseEdge)/10;
             if(!msg.sender.send(amountWon)) revert();
             emit Won(true, amountWon);
         } else {
             emit Won(false, 0);
         }
     }

     function toBytes(uint256 x) public pure returns(bytes memory b) {
        b = new bytes(32);
        assembly { mstore(add(b, 32), x) }
     }

    /**
     * @dev View Casino balance
     */
     function checkBalance() Owned public view returns(uint){
         return address(this).balance / 1e18; // balance in ETH
     }
 }