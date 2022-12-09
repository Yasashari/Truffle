# Truffle
Truffle debugging 


npm install -g truffle        (to install truffle)

truffle version               (check truffle verison)

truffle init		     (initialize truffle new project)    

truffle compile              (compile smart contract)

truffle test                 ( test smart contract)

truffle develop              (to get ganache develop console)

truffle migrate              deploy smart contract. this is deoployed only contracts which are not currently deployed.

migrate --rest               (to deploy smart contract on ganache)  deploy all the contracts from the begining



.................................................................................

get balance on address 

let x  = await smartcontractname.deployed()
await web3.eth.getBalance(x.address)     



options = { from: accounts[0], to : x.address, value: web3.utils.toWei('1', 'ether')}


options2 = { to : accounts[0] }


send({to : accounts[1]})


