// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

contract OptimizedArraySort {

    //@notice chnaged param location from calldata to memory
    function sortArray(uint256[] memory data) external pure returns (uint256[] memory) {
       
       //@notice creating a memory var so to access the length we don't need to always access storage
        uint256 dataLen = data.length;
        
       //@notice removed the copying of the array 
        // Create 'working' copy
        // uint[] memory _data = new uint256[](dataLen);
        // for (uint256 k = 0; k < dataLen; k++) {
        //     _data[k] = data[k];
        // }

    //@notice changed the for loop to a while loop which saved a ton of gas
       uint256 i = dataLen-1;
        while (i > 0) {
            uint256 j;
            while(j < i) {
                if(data[i] < data[j]){
                    uint256 temp = data[i];
                    data[i] = data[j];
                    data[j] = temp;
                }
                unchecked {
                    j += 1;
                }
            }
            unchecked {
                i -= 1;
            }
        }

        
        return data;
    }
}
