//SPDX-License-Identifier:MIT

pragma solidity 0.8.7 ;

contract A {
   
   uint public x ;

   function setx() public {
     x = 10;
   }

}


contract B {
 
   A a ;

   constructor(address _a) {
       a = A(_a);
   }

   function mainSetx() public {
       a.setx() ; 
   }

}


contract C {

    
   uint public x ;

   function setx() public {
     x = 20;
   }

}