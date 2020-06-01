pragma solidity ^0.6.4;
import "../base/Owned.sol";


/**
 * @title DappRegistry
 * @dev Registry of dapp contracts and methods that have been authorised by duniaPay.
 * Registered methods can be authorised immediately for a dapp key and a wallet while
 * the authoirsation of unregistered methods is delayed for 24 hours.
 */
contract DappRegistry is Owned {
    // [contract][signature][bool]
    mapping(address => mapping(bytes4 => bool)) internal authorised;

    event Registered(address indexed _contract, bytes4[] _methods);
    event Deregistered(address indexed _contract, bytes4[] _methods);

    /**
     * @dev Registers a list of methods for a dapp contract.
     * @param _contract The dapp contract.
     * @param _methods The dapp methods.
     */
    function register(address _contract, bytes4[] calldata _methods)
        external
        onlyOwner
    {
        for (uint256 i = 0; i < _methods.length; i++) {
            authorised[_contract][_methods[i]] = true;
        }
        emit Registered(_contract, _methods);
    }

    /**
     * @dev Deregisters a list of methods for a dapp contract.
     * @param _contract The dapp contract.
     * @param _methods The dapp methods.
     */
    function deregister(address _contract, bytes4[] calldata _methods)
        external
        onlyOwner
    {
        for (uint256 i = 0; i < _methods.length; i++) {
            authorised[_contract][_methods[i]] = false;
        }
        emit Deregistered(_contract, _methods);
    }

    /**
     * @dev Checks if a method is registered for a dapp contract.
     * @param _contract The dapp contract.
     * @param _method The dapp method.
     * @return true if the method is registered.
     */
    function isRegistered(address _contract, bytes4 _method)
        external
        view
        returns (bool)
    {
        return authorised[_contract][_method];
    }

    /**
     * @dev Checks if a list of methods are registered for a dapp contract.
     * @param _contract The dapp contract.
     * @param _methods The dapp methods.
     * @return true if all the methods are registered.
     */
    function isRegistered(address _contract, bytes4[] calldata _methods)
        external
        view
        returns (bool)
    {
        for (uint256 i = 0; i < _methods.length; i++) {
            if (!authorised[_contract][_methods[i]]) {
                return false;
            }
        }
        return true;
    }
}