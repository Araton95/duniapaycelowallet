pragma solidity ^0.6.4;


/**
 * @dev ENS Resolver interface.
 */
interface ENSResolver {
    event AddrChanged(bytes32 indexed _node, address _addr);
    event NameChanged(bytes32 indexed _node, string _name);

    function addr(bytes32 _node) external view returns (address);

    function setAddr(bytes32 _node, address _addr) external;

    function name(bytes32 _node) external view returns (string memory);

    function setName(bytes32 _node, string calldata _name) external;
}
