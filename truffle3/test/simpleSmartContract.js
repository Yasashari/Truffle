const SimpleSmartContract = artifacts.require("SimpleSmartContract");

contract(SimpleSmartContract, () => {
  it("api meka depoloy karanna yanne", async () => {
    const simpleSmartContract = await SimpleSmartContract.deployed();
    console.log(simpleSmartContract.address);
    assert(simpleSmartContract.address !== "");
  });
});
