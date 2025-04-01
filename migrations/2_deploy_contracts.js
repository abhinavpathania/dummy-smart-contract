const DummyContract = artifacts.require("DummyContract");

module.exports = function (deployer) {
    deployer.deploy(DummyContract, "Hello, Blockchain!");
};
