const x = artifacts.require("helloworld");

contract("helloworld", () => {
  it("api balanwa arake output Hellow World dha kiyla", async () => {
    const hello = await x.deployed();
    const result = await hello.hellow();
    assert(result === "Hello World");
  });
});
