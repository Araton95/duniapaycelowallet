pragma solidity ^0.6.4;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol";


contract TestERC721 is ERC721Full, ERC721Mintable {
    constructor() public ERC721Full("DuniaPay Kitties", "DXD") {}
}
