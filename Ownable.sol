pragma solidity ^0.4.21;

contract Ownable {
    address owner;

    function Ownable() public {
        owner = msg.sender;
    }
}