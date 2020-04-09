pragma solidity >=0.5.0 <0.7.0;

//we use this contract to sell bitcoins in the Dunia Pay wallet (or products in general)

contract Order {
    //event
    event orderId(address ordernumber);

    event containerReg(bool regStatus);

    event statusEvent(string containerStatus);

    ///DECLARATION
    struct package {
        bool isuidgenerated;
        uint256 itemId;
        string itemName;
        string transitStatus;
        uint256 orderStatus; //1=ordered;2=in-transit;3=delivered;4=cancelled;
        address customer;
        uint256 orderTime;
        address carrier1;
        uint256 carrier1_time;
        uint256 container_time;
    }

    uint256 public orderCount;
    uint256 orderValue;
    address Owner;
    mapping(address => package) public packages;
    mapping(address => address) public orders;
    mapping(address => bool) public containers;
    mapping(uint256 => address) public orderCheck;
    mapping(address => address) public containerCheck;
    mapping(address => address) public orderIdContainer;
    mapping(address => uint256) balances;

    ///DECLARATION END

    ///modifier
    constructor() public {
        Owner = msg.sender;
    }

    modifier onlyOwner() {
        require(Owner == msg.sender, " ");
        _;
    }

    ///MODIFIER END
    function withdraw(address payable _to) internal {
        balances[address(this)] -= orderValue;
        _to.transfer(orderValue);
    }

    // contract check method after instantiation
    function contractCheck() public pure returns (string memory) {
        string memory response = "contract works";
        return response;
    }

    function manageContainers(address _containerAddress, address _orderId)
        public
        onlyOwner
        returns (bool)
    {
        if (!containers[_containerAddress]) {
            containers[_containerAddress] = true;
        } else {
            containers[_containerAddress] = false;
        }
        containerCheck[_orderId] = _containerAddress;
        orderIdContainer[_containerAddress] = _orderId;
        emit containerReg(containers[_containerAddress]);
        return containers[_containerAddress];
    }

    ////orderitem function//////
    function orderItem(uint256 _itemId, string memory _itemName, uint256 _price)
        public
        payable
        returns (address)
    {
        orderValue = _price;
        require(msg.value >= orderValue, "invalid value");
        balances[address(this)] = address(this).balance;
        address uniqueId = address(
            bytes20(sha256(abi.encodePacked(msg.sender, now)))
        );
        orderCount++;
        packages[uniqueId].isuidgenerated = true;
        packages[uniqueId].itemId = _itemId;
        packages[uniqueId].itemName = _itemName;
        packages[uniqueId]
            .transitStatus = "Your package is ordered and is under processing";
        packages[uniqueId].orderStatus = 1;
        packages[uniqueId].customer = msg.sender;
        packages[uniqueId].orderTime = now;
        orders[msg.sender] = uniqueId;
        orderCheck[orderCount] = uniqueId;
        emit orderId(uniqueId);
        return uniqueId;
    }

    ///orderitem function end
    function orderIdToContainer(address _containerAddress)
        public
        view
        returns (address)
    {
        return orderIdContainer[_containerAddress];
    }

    /// orderNumber
    function orderNum(address addr) public view returns (address) {
        return orders[addr];
    }

    /// end of orderNumber

    /// containerStatus
    function containerStatus(address packageId)
        public
        view
        returns (string memory)
    {
        return packages[packageId].transitStatus;
    }

    /// end of containerStatus
    /// container activation
    function containerActivation(address containerAddress)
        public
        view
        returns (bool)
    {
        return containers[containerAddress];
    }

    /// end of container activity
    /// orderCheck
    function orderList(uint256 _orderCount)
        public
        view
        onlyOwner
        returns (address)
    {
        return orderCheck[_orderCount];
    }

    /// end of orderCheck
    /// containerCheck
    function containerList(address _orderId)
        public
        view
        onlyOwner
        returns (address)
    {
        return containerCheck[_orderId];
    }

    /// end of containerCheck
    function orderVolume() public view onlyOwner returns (uint256) {
        return orderCount;
    }

    /// cancel order
    /// cancel order ends

    /// iot container report = Order status 
    function containerReport(address _uniqueId, string memory _transitStatus)
        public
        returns (string memory)
    {
        require(packages[_uniqueId].isuidgenerated, "");
        //bytes32 hash = sha256(abi.encodePacked(_transitStatus));
        //address sender = recover(hash, signature);
        require(containers[msg.sender], "");
        require(packages[_uniqueId].orderStatus == 1, "");

        packages[_uniqueId].transitStatus = _transitStatus;
        packages[_uniqueId].container_time = now;
        emit statusEvent(packages[_uniqueId].transitStatus);
        return packages[_uniqueId].transitStatus;
    }

    /// iot container report end = order status 
    function completeTx(address _orderId) public onlyOwner returns (bool) {
        if (packages[_orderId].orderStatus == 3) {
            withdraw(msg.sender);
        }
    }
}
