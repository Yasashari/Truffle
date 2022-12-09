const SimpleStorage = artifacts.require("SimpleStorage.sol");

contract("SimpleStorage", () => {
  it("Shoud update data", async () => {
    const storage = await SimpleStorage.new();
    await storage.updatedata(10);

    const data = await storage.readdata();

    assert(data.toString() === "10");
  });
});
