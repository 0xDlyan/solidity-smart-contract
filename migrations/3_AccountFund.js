const AccountFund = artifacts.require("AccountFund");

module.exports = function (deployer) {
  deployer.deploy(AccountFund);
};
