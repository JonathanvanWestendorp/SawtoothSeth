pragma solidity ^0.6.0;

/// @title SimpleBank
/// @author Jonathan van Westendorp

contract SimpleBank {

    mapping (address => uint) private balances;

    address public owner;
    
    event LogDepositMade(address accountAddress, uint amount);

    constructor() public {
        owner = msg.sender;
    }

    /// @notice Deposit ether into bank
    function deposit() public payable returns (uint) {
        require((balances[msg.sender] + msg.value) >= balances[msg.sender]);

        balances[msg.sender] += msg.value;

        emit LogDepositMade(msg.sender, msg.value);

        return balances[msg.sender];
    }

    /// @notice Withdraw ether from bank
    /// @dev This does not return any excess ether sent to it
    /// @param withdrawAmount amount you want to withdraw
    function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
        require(withdrawAmount <= balances[msg.sender]);

        balances[msg.sender] -= withdrawAmount;

        msg.sender.transfer(withdrawAmount);

        return balances[msg.sender];
    }

    /// @notice Get balance
    function balance() view public returns (uint) {
        return balances[msg.sender];
    }
}

