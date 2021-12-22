const TransferFund = artifacts.require("TransferFund");

module.exports = function (deployer) {
  deployer.deploy(TransferFund);
};
