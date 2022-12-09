const x = artifacts.require("Crud");

contract("Crud", () => {
  let crud = null;

  before(async () => {
    crud = await x.deployed();
  });

  it("Check create new user function", async () => {
    await crud.create("Yasas");
    const user = await crud.read(1);

    assert(user[0].toNumber() === 1);
    assert(user[1] === "Yasas");
  });

  it("check update function", async () => {
    await crud.update(1, "Geeth");
    const user = await crud.read(1);

    assert(user[0].toNumber() === 1);
    assert(user[1] === "Geeth");
  });

  it("Should Not update a non-existing user", async () => {
    try {
      await crud.update(2, "Frankk");
    } catch (e) {
      assert(e.message.includes("Users does not exist"));
      return;
    }
    assert(false);
  });

  it("Shoud destroy a user ", async () => {
    await crud.destroy(1);
    try {
      await crud.read(1);
    } catch (e) {
      assert(e.message.includes("Users does not exist"));
      return;
    }

    assert(false);
  });

  it("shoud not destroy a non existing user", async () => {
    try {
      await crud.destroy(10);
    } catch (e) {
      assert(e.message.includes("Users does not exist"));
      return;
    }

    assert(false);
  });
});
