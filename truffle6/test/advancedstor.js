const x = artifacts.require("AdvancedStorage");

contract("AdvancedStorage", () => {
  let advacedstorage = null;

  before(async () => {
    advacedstorage = await x.deployed();
  });

  it("elemant ekak add karamu", async () => {
    await advacedstorage.add(10);

    const result = await advacedstorage.ids(0);
    assert(result.toNumber() === 10);
  });

  it("get function eka check karmu", async () => {
    await advacedstorage.add(20);
    const result = await advacedstorage.get(1);
    assert(result.toNumber() === 20);
  });
  it("array eka chek karamu", async () => {
    const result = await advacedstorage.getAll();
    assert(result[0].toNumber() === 10);
    assert(result[1].toNumber() === 20);
  });
  it("array length eka check karmu", async () => {
    const result = await advacedstorage.length();
    assert(result.toNumber() === 2);
  });
});
