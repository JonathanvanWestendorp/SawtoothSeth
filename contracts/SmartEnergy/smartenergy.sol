pragma solidity >=0.6.6;

import "./ownable.sol";

contract SmartEnergy is Ownable {
    
    event newUser(string _userName);
    
    struct User {
        string userName;
        address userAddress;
        int energyInput;
        uint energyBalance;
        bool exists;
    }

    mapping (address => User) addressToUser;
    mapping (string => User) userNameToUser;
    
    User[] public users;

    function register(string calldata _userName, address _userAdress) external onlyOwner {
        require((userNameToUser[_userName].exists == false) && (addressToUser[_userAdress].exists == false));
        User memory registeredUser = User(_userName, _userAdress, 100, 1000, true);
        users.push(registeredUser);
        addressToUser[_userAdress] = registeredUser;
        userNameToUser[_userName] = registeredUser;
        emit newUser(_userName);
    }

    function getUserInfo(string calldata _userName) external view returns (
        string memory,
        address,
        int,
        uint
    ) {
        require(userNameToUser[_userName].exists == true);
        User memory requestedUser = userNameToUser[_userName];
        return(requestedUser.userName, requestedUser.userAddress, requestedUser.energyInput, requestedUser.energyBalance);
    }
    
    function getUserBalance(string calldata _userName) external view returns (
        int,
        uint
    ) {
        require(userNameToUser[_userName].exists == true);
        User memory requestedUser = userNameToUser[_userName];
        return(requestedUser.energyInput, requestedUser.energyBalance);
    }
}