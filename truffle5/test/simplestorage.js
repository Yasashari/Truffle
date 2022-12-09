const x = artifacts.require("simpless");

contract("simpless", () => {
  it("data going to be checked", async () => {
    const simple = await x.deployed();
    await simple.set("Yasas");
    const result = await simple.get();
    assert(result === "Yasas");
  });
});
