// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @dev Implementation of the MSL-729 Transaction Schema.
 */
interface ISpatialTransaction {
    struct SpatialTransaction {
        uint8 x;              // Geometric Anchor: Width
        uint8 y;              // Geometric Anchor: Height
        uint8 z;              // Geometric Anchor: Depth
        bytes32 stateRoot;    // Current Voxel Hash
        bytes32 previousHash; // Temporal Link
        uint64 timestamp;     // Temporal Anchor
        bytes evidence;       // Cryptographic Proof
    }
}
