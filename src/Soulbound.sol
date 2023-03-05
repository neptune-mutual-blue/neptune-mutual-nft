// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "./NeptuneMutualNftBase.sol";

/**
 *
 * @title Soulbound contract
 * @custom:suppress-acl Only views should be publicly accessible.
 *
 * @notice Once a soulbound NFT is sent to a wallet,
 * its soul is bound to that wallet for eternity.
 *
 * This contract enforces the rules that restrict transfers of soulbould tokens.
 *
 * @dev This contract primarily overrides the `_beforeTokenTransfer` hook of
 * `ERC1155` contract to ensure that users can't transfer a soulbound NFT token
 * out of their wallet.
 *
 */
abstract contract Soulbound is NeptuneMutualNftBase {
  mapping(uint256 => bool) internal _soulbound;

  /**
   *
   * @dev Constructs this contract with the given input arguments.
   *
   * @param minter    Enter an address which will be added to the minter list.
   * @param admin     Enter an address which will be added to the admin list.
   * @param baseUri   Specify the base URI for the NFT metadata.
   *
   */
  constructor(address minter, address admin, string memory baseUri) NeptuneMutualNftBase(minter, admin, baseUri) { } // solhint-disable-line

  /**
   *
   * @dev This hook overrides the empty `_beforeTokenTransfer`
   * function of the `ERC1155` contract and ensures that
   * the tokens that are soulbound can't leave their wallets.
   *
   * @param operator  The identity that was acting on behalf of the `from` address.
   * @param from      The address from which the token was being transferred out.
   * @param to        The address where the token was being sent to.
   * @param ids       The token identifiers that were being transferred.
   * @param amounts   The respective amount of tokens that were being transferred.
   * @param data      Application-specific custom data.
   *
   */
  function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) internal override whenNotPaused {
    // Only enter if this isn't a mint operation
    if (from != address(0)) {
      for (uint256 i = 0; i < ids.length; i++) {
        uint256 id = ids[i];
        require(_soulbound[id] == false, "Error: soulbound");
      }
    }

    super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
  }

  /**
   *
   * @dev Signifies if the given token identifier is bound to its owner for life.
   *
   */
  function isSoulbound(uint256 id) external view override returns (bool) {
    return _soulbound[id];
  }
}
