// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.5;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address public minter;

    constructor() public payable ERC20("Blood Money", "BLOOD") {
        minter = msg.sender;
    }

    event MinterChanged(address indexed from, address to);

    function passMinterRole(address dbank) public returns (bool) {
        require(
            msg.sender == minter,
            "Error : only owner can pass minter role"
        );
        minter = dbank;
    }

    function mint(address account, uint256 amount) public {
        require(
            msg.sender == minter,
            "Error : msg.sender does not have minter role"
        );
        _mint(account, amount);
    }
}
