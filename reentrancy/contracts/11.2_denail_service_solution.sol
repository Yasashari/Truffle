// SPDX-License-Identifier: MIT
pragma solidity 0.8.7 ;

contract kingofEth{
   
   address public king;
   uint public balance ;
   mapping (address=>uint) balances;


   function claimThrone() public payable {
       require(msg.value > balance , "Need to pay more Ether");
    
       balances[msg.sender]+=msg.value;

       balance = msg.value;
       king =  msg.sender;

   }

   function withdraw() public payable {

       require(msg.sender != king , "current king cannot withdraw");

       uint amount =  balances[msg.sender];
       balances[msg.sender]=0; 

       (bool sent , )= msg.sender.call{value:amount}("");
       require(sent , "Failed trasaction");

   }
}

contract attack {

    function atta(kingofEth kingofeth) public payable{
          kingofeth.claimThrone{value:msg.value}();

    } 
}
