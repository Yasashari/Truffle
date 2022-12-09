pragma solidity ^0.8.4;

contract SimpleStorage{

uint data;

function updatedata(uint _data)external{
data=_data ;
}

 function readdata() external view returns(uint) {
 return data; 
}


}
