const cont1 = artifacts.require("EtherStore");
const cont2 = artifacts.require("Attackk");

module.exports = function (deployer) {
  deployer.deploy(cont1).then(function () {
    return deployer.deploy(cont2, cont1.address);
  });
};

// var account1 = "0xf881BeDAE325CC1cE375c046801EEBBcB130f0ed";

// const y = artifacts.require("Attackk");

// module.exports = function (deployer) {
//   deployer.deploy(y, account1);
// };
