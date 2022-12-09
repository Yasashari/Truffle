pragma solidity ^0.8.7;

contract Num{
  uint public w;
  uint i;
  uint j;
    function A() external  returns (uint) {
      for( i=0;i<3;i++){

        for( j=0;j<3;j++){

            w=w+i+2*j;
          

        }
         j=0;
      }
      return w;
     }
    }