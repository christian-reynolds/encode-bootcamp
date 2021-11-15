// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoCoin is ERC20, Ownable {
    
    struct Payment {
        uint256 amount;
        address to;
    }
    
    mapping(address => uint256) private _balances;
    mapping(address => Payment[]) private _payments;
    
    event TotalSupplyIncreased(uint256);
    
    constructor() ERC20("Volcano", "VOL") {
        _mint(msg.sender, 10000);
    }
    
    function _mint() public onlyOwner {
        _mint(msg.sender, 1000);
        emit TotalSupplyIncreased(1000);
    }
    
    function getBalance(address addr) public view returns (uint256) {
        return _balances[addr];
    }
    
    function getPayments(address addr) public view returns (Payment[] memory) {
        return _payments[addr];
    }
    
}