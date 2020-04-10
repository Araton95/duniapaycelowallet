pragma solidity ^0.6.4;


/**
 * ERC20 contract interface.
 */
interface ERC20 {
    function totalSupply() external view returns (uint256);

    function decimals() external view returns (uint256);

    function balanceOf(address tokenOwner)
        external
        view
        returns (uint256 balance);

    function allowance(address tokenOwner, address spender)
        external
        view
        returns (uint256 remaining);

    function transfer(address to, uint256 tokens)
        external
        returns (bool success);

    function approve(address spender, uint256 tokens)
        external
        returns (bool success);

    function transferFrom(address from, address to, uint256 tokens)
        external
        returns (bool success);
}
