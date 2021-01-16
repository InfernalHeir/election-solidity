const Election = artifacts.require("../contracts/Election.sol");
module.exports = async (deployer) => {
    await deployer.deploy(Election);
}