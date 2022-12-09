//SPDX-License-Identifier:MIT

pragma solidity 0.6.5;

contract overflow_uderflow {
   uint public underx =  0;
   uint public overx =  2**256-1;


   function checkover () external  {
       overx = overx + 1 ;
   }

    function checkunder () external  {
       underx = underx - 1 ;
   }
}