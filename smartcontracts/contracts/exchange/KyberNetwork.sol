pragma solidity ^0.6.4;

import "./ERC20.sol";


interface KyberNetwork {
    function getExpectedRate(ERC20 src, ERC20 dest, uint256 srcQty)
        external
        view
        returns (uint256 expectedRate, uint256 slippageRate);

    function trade(
        ERC20 src,
        uint256 srcAmount,
        ERC20 dest,
        address payable destAddress,
        uint256 maxDestAmount,
        uint256 minConversionRate,
        address walletId
    ) external payable returns (uint256);
}
