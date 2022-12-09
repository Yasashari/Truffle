const HelloBlockchain = artifacts.require("HelloBlockchain");
const todolist = artifacts.require("Todolist");
const num = artifacts.require("Num");

module.exports = function (deployer) {
  deployer.deploy(HelloBlockchain, "Hello Blockchain");
  deployer.deploy(todolist, "Todo list");
  deployer.deploy(num, "Number");
};
