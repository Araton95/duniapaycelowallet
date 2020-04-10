pragma solidity ^0.6.4;
import "../../../wallet/BaseWallet.sol";
import "../../../modules/common/OnlyOwnerModule.sol";


/**
 * @title TestModule
 * @dev Basic test module.
 */
contract TestOnlyOwnerModule is OnlyOwnerModule {
    bytes32 constant NAME = "TestOnlyOwnerModule";

    constructor(ModuleRegistry _registry)
        public
        BaseModule(_registry, GuardianStorage(0), NAME)
    {}
}
