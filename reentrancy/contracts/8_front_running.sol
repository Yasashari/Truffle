//SPDX-License-Identifier:MIT

pragma solidity 0.8.7 ;

contract Findsolution{

    bytes32 public hash = 0xbcf9eef2f09d148a391201c57df3774ddff4539d955f7021cfb6b0a672e0d43f ;
   
    fallback() external payable{}

    function solve(string memory _solution) public{
         require(hash ==  keccak256(abi.encodePacked(_solution)),"incorrect answer");

        hash ==  keccak256(abi.encodePacked(_solution)) ;
        (bool sent , )=msg.sender.call{value:address(this).balance}("");

        require(sent , "Failed transaciton");

    }


}