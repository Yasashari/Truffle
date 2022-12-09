const x = artifacts.require("helloworld");

module.exports = function (deployer) {
  deployer.deploy(x);
};
