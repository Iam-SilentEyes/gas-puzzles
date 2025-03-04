// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.15;

contract OptimizedArraySum{
    // Do not modify this
    uint256[] array;
   

    // Do not modify this
    function setArray(uint256[] memory _array) external {
        require(_array.length <= 10, 'too long');
        array = _array;
    }

    //just added a return val rather than declaring another var
    function getArraySum() external view returns (uint256 sum) {    
        for (uint256 i = 0; i <array.length; i++) {
            sum += array[i];
        }

        return sum;
       
    }

}
