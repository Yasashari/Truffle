const todolist = artifacts.require("Todolist");

module.exports = function (deployer) {
  deployer.deploy(todolist, "Todo list");
};
