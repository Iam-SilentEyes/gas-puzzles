//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

contract OptimizedDistribute {
    address payable public immutable contributor0;
    address payable public immutable contributor1;
    address payable public immutable contributor2;
    address payable public immutable contributor3;
    uint256 public immutable releaseTime;

    constructor(address payable[4] memory _contributors)payable{
        contributor0= _contributors[0];
        contributor1= _contributors[1];
        contributor2= _contributors[2];
        contributor3= _contributors[3];
        releaseTime = block.timestamp + 1 weeks;
        
    }


    function distribute() external{
        require(
            block.timestamp > releaseTime,
            "cannot distribute yet"
        );
        //@dev bitshifting saves 61 gas
         uint256 amount = address(this).balance >> 2;

        //@dev has to use send instead of transfer even tho it'snot recommended to save the last bit of gas lol
        contributor0.send(amount);
        contributor1.send(amount);
        contributor2.send(amount);
        // contributor3.transfer(amount);
        //@dev we use selfdestrcut to send the all remaining ether in this contract to the last contributor.This saves us 4000+ gas
        selfdestruct(contributor3);
    }
}
