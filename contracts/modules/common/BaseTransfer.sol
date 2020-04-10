pragma solidity ^0.6.4;

import "./BaseModule.sol";


// TODO Mock to Celo Contract
/**
 * @title BaseTransfer
 * @dev Module containing internal methods to execute or approve transfers
 */
contract BaseTransfer is BaseModule {
    // Mock token address for ETH
    address internal constant ETH_TOKEN = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    // *************** Events *************************** //

    event Transfer(
        address indexed wallet,
        address indexed token,
        uint256 indexed amount,
        address to,
        bytes data
    );
    event Approved(
        address indexed wallet,
        address indexed token,
        uint256 amount,
        address spender
    );
    event CalledContract(
        address indexed wallet,
        address indexed to,
        uint256 amount,
        bytes data
    );

    // *************** Internal Functions ********************* //

    /**
     * @dev Helper method to transfer CeloGold or Ccfa [West African CFA Stablecoin] for a wallet.
     * @param _wallet The target wallet.
     * @param _token The Ccfa address.
     * @param _to The recipient.
     * @param _value The amount of token to transfer
     * @param _data The data to *log* with the transfer.
     */
    function doTransfer(
        BaseWallet _wallet,
        address _token,
        address _to,
        uint256 _value,
        bytes memory _data
    ) internal {
        if (_token == ETH_TOKEN) {
            invokeWallet(address(_wallet), _to, _value, EMPTY_BYTES);
        } else {
            bytes memory methodData = abi.encodeWithSignature(
                "transfer(address,uint256)",
                _to,
                _value
            );
            invokeWallet(address(_wallet), _token, 0, methodData);
        }
        emit Transfer(address(_wallet), _token, _value, _to, _data);
    }

    /**
     * @dev Helper method to approve spending the Ccfa of a wallet.
     * @param _wallet The target wallet.
     * @param _token The Ccfa address.
     * @param _spender The spender address.
     * @param _value The amount of token to transfer.
     */
    function doApproveToken(
        BaseWallet _wallet,
        address _token,
        address _spender,
        uint256 _value
    ) internal {
        bytes memory methodData = abi.encodeWithSignature(
            "approve(address,uint256)",
            _spender,
            _value
        );
        invokeWallet(address(_wallet), _token, 0, methodData);
        emit Approved(address(_wallet), _token, _value, _spender);
    }

    /**
     * @dev Helper method to call an external contract.
     * @param _wallet The target wallet.
     * @param _contract The contract address.
     * @param _value The Ccfa value to transfer.
     * @param _data The method data.
     */
    function doCallContract(
        BaseWallet _wallet,
        address _contract,
        uint256 _value,
        bytes memory _data
    ) internal {
        invokeWallet(address(_wallet), _contract, _value, _data);
        emit CalledContract(address(_wallet), _contract, _value, _data);
    }
}
