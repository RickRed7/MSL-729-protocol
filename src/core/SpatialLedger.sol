// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Monolith.sol";
import "../interfaces/ISpatialTransaction.sol";

/**
 * @title SpatialLedger
 * @dev Records the spatiotemporal map of events.
 */
contract SpatialLedger is Monolith, ISpatialTransaction {
    uint64 public ledgerEventCount = 729; // Starts at Ω resolution
    bytes32 public lastBlockHash;

    /**
     * @dev Commits a change in the state of one voxel to the ledger.
     */
    function commitSpatialTransaction(SpatialTransaction calldata txData) external {
        require(txData.previousHash == lastBlockHash, "Chain Integrity Failure");
        
        // Update the Monolith state root
        updateVoxel(txData.x, txData.y, txData.z, txData.stateRoot);
        
        // Advance temporal log
        lastBlockHash = keccak256(abi.encode(txData));
        ledgerEventCount++;
    }
}
