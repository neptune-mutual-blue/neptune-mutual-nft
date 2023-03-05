// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "openzeppelin-solidity/contracts/token/ERC1155/ERC1155.sol";
import "openzeppelin-solidity/contracts/token/common/ERC2981.sol";
import "openzeppelin-solidity/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "openzeppelin-solidity/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol";
import "./NeptuneMutualNftAccess.sol";
import "./interfaces/IWithRoyalty.sol";

/**
 *
 * @title WithRoyalty contract
 * @custom:suppress-acl Only views should be publicly accessible.
 *
 * @notice WithRoyalty contract enables `NFT Royalty Admins` to configure
 * royalty fee both on global and token level.
 *
 * @dev This contract overrides and exposes OpenZeppelin's implementation of `ERC2981` features
 * with additional access control settings. Also implements missing events.
 *
 */
abstract contract WithRoyalty is IWithRoyalty, NeptuneMutualNftAccess, ERC1155, ERC1155Burnable, ERC2981 {
  mapping(bytes4 => bool) _supportedInterfaces;

  /**
   *
   * @dev Constructs this contract
   *
   */
  constructor() {
    _supportedInterfaces[type(IAccessControl).interfaceId] = true;
    _supportedInterfaces[type(IERC1155).interfaceId] = true;
    _supportedInterfaces[type(IERC1155MetadataURI).interfaceId] = true;
    _supportedInterfaces[type(IERC2981).interfaceId] = true;
  }

  /**
   *
   * @dev Sets the default royalty defintion.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Royalty Admins".
   *
   * @param receiver      Enter the address which will receive royalties for all tokens by default.
   * @param feeNumerator  Enter the default royalty fee percentage
   *                      (denominated as a fraction of the `feeDenominator()`).
   *
   */
  function setDefaultRoyalty(address receiver, uint96 feeNumerator) external _mustHaveAccess(NS_ROLES_ROYALTY_ADMIN) {
    super._setDefaultRoyalty(receiver, feeNumerator);
    emit DefaultRoyaltySet(msg.sender, receiver, feeNumerator);
  }

  /**
   *
   * @dev Deletes the default royalty defintion.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Royalty Admins".
   *
   */
  function deleteDefaultRoyalty() external _mustHaveAccess(NS_ROLES_ROYALTY_ADMIN) {
    super._deleteDefaultRoyalty();
    emit DefaultRoyaltyDeleted(msg.sender);
  }

  /**
   *
   * @dev Sets royalty information for the supplied token identifier.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Royalty Admins".
   *
   * @param tokenId       Enter the tokenId.
   * @param receiver      Enter the address which will receive royalty for this token's transactions.
   * @param feeNumerator  Enter this token's royalty fee percentage
   *                      (denominated as a fraction of the `feeDenominator()`).
   *
   */
  function setTokenRoyalty(uint256 tokenId, address receiver, uint96 feeNumerator) external _mustHaveAccess(NS_ROLES_ROYALTY_ADMIN) {
    super._setTokenRoyalty(tokenId, receiver, feeNumerator);
    emit TokenRoyaltySet(msg.sender, tokenId, receiver, feeNumerator);
  }

  /**
   * @dev Resets the supplied token's royalty info that results in default royalty taking affect.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Royalty Admins".
   *
   * @param tokenId Enter the tokenId you would like to reset to royalty of.
   *
   */
  function resetTokenRoyalty(uint256 tokenId) external _mustHaveAccess(NS_ROLES_ROYALTY_ADMIN) {
    super._resetTokenRoyalty(tokenId);
    emit TokenRoyaltyReset(msg.sender, tokenId);
  }

  /**
   *
   * @dev Returns the fee donomiator of this contract.
   * @custom:suppress-acl This function is publicly accessible.
   *
   */
  function feeDenominator() external pure virtual returns (uint96) {
    return super._feeDenominator();
  }

  /**
   *
   * @dev Checks whether the supplied `interfaceId` is supported by this contract.
   * @custom:suppress-acl This function is publicly accessible.
   *
   * @param interfaceId Enter an interface identifier to check.
   *
   */
  function supportsInterface(bytes4 interfaceId) public view virtual override(AccessControl, ERC1155, ERC2981) returns (bool) {
    return _supportedInterfaces[interfaceId];
  }
}
