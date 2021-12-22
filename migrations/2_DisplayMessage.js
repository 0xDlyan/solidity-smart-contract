const DisplayMessage = artifacts.require("DisplayMessage");

module.exports = function (deployer) {
  deployer.deploy(DisplayMessage);
};
