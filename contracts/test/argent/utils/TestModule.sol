pragma solidity ^0.6.4;
import "../../../wallet/BaseWallet.sol";
import "../../../modules/common/BaseModule.sol";
import "../../../modules/common/RelayerModule.sol";


/**
 * @title TestModule
 * @dev Basic test module.
 */
contract TestModule is BaseModule, RelayerModule {
    bytes32 constant NAME = "TestModule";

    bool boolVal;
    uint256 uintVal;

    constructor(ModuleRegistry _registry, bool _boolVal, uint256 _uintVal)
        public
        BaseModule(_registry, GuardianStorage(0), NAME)
    {
        boolVal = _boolVal;
        uintVal = _uintVal;
    }

    function init(BaseWallet _wallet) public onlyWallet(_wallet) {
        _wallet.enableStaticCall(
            address(this),
            bytes4(keccak256("getBoolean()"))
        );
        _wallet.enableStaticCall(address(this), bytes4(keccak256("getUint()")));
        _wallet.enableStaticCall(
            address(this),
            bytes4(keccak256("getAddress(address)"))
        );
    }

    function getBoolean() public view returns (bool) {
        return boolVal;
    }

    function getUint() public view returns (uint256) {
        return uintVal;
    }

    function getAddress(address _addr) public view returns (address) {
        return _addr;
    }

    // *************** Implementation of RelayerModule methods ********************* //

    // Overrides to use the incremental nonce and save some gas
    function checkAndUpdateUniqueness(
        BaseWallet _wallet,
        uint256 _nonce,
        bytes32 /* _signHash */
    ) internal returns (bool) {
        return checkAndUpdateNonce(_wallet, _nonce);
    }

    function validateSignatures(
        BaseWallet _wallet,
        bytes memory, /* _data */
        bytes32 _signHash,
        bytes memory _signatures
    ) internal view returns (bool) {
        address signer = recoverSigner(_signHash, _signatures, 0);
        return isOwner(_wallet, signer); // "GM: signer must be owner"
    }

    function getRequiredSignatures(
        BaseWallet, /* _wallet */
        bytes memory /*_data */
    ) internal view returns (uint256) {
        return 1;
    }
}
