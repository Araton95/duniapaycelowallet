pragma solidity ^0.6.4;


/**
 * @dev Interface for an ENS Mananger.
 */
interface IENSManager {
    event RootnodeOwnerChange(
        bytes32 indexed _rootnode,
        address indexed _newOwner
    );
    event ENSResolverChanged(address addr);
    event Registered(address indexed _owner, string _ens);
    event Unregistered(string _ens);

    function changeRootnodeOwner(address _newOwner) external;

    function register(string calldata _label, address _owner) external;

    function isAvailable(bytes32 _subnode) external view returns (bool);

    function getENSReverseRegistrar() external view returns (address);

    function ensResolver() external view returns (address);
}
