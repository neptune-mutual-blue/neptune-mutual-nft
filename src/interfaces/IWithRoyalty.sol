// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

/**
 *
 * @title IWithRoyalty interface
 *
 */
interface IWithRoyalty {
  event DefaultRoyaltySet(address indexed sender, address indexed receiver, uint96 feeNumerator);
  event DefaultRoyaltyDeleted(address indexed sender);
  event TokenRoyaltySet(address indexed sender, uint256 tokenId, address indexed receiver, uint96 feeNumerator);
  event TokenRoyaltyReset(address indexed sender, uint256 tokenId);
}
