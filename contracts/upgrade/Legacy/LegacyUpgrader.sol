pragma solidity ^0.6.4;


/**
 * @title Legacy Upgrader
 * @dev Old Interface for a contract that could upgrade wallets by enabling/disabling modules.
 */
interface LegacyUpgrader {
    /**
     * @dev Upgrades a wallet by enabling/disabling modules.
     * @param _wallet The owner.
     */
    function upgrade(
        address payable _wallet,
        address[] calldata _toDisable,
        address[] calldata _toEnable
    ) external;

    function toDisable() external view returns (address[] memory);

    function toEnable() external view returns (address[] memory);
}
