// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "openzeppelin-solidity/contracts/security/Pausable.sol";
import "./WithRoyalty.sol";
import "./interfaces/INeptuneMutualNft.sol";

/**
 *
 * @title NeptuneMutualNftBase contract
 * @custom:suppress-acl Only views should be publicly accessible.
 *
 * @notice The base contract for the NFT contract.
 *
 * @dev This contract primarily implements pausable and token URI functionality.
 *
 */
abstract contract NeptuneMutualNftBase is INeptuneMutualNft, Pausable, WithRoyalty {
  /**
   *
   * @dev Constructs this contract with the given input arguments.
   *
   * @param minter    Enter an address which will be added to the minter list.
   * @param admin     Enter an address which will be added to the admin list.
   * @param baseUri   Specify the base URI for the NFT metadata.
   *
   */
  constructor(address minter, address admin, string memory baseUri) NeptuneMutualNftAccess(minter, admin) ERC1155(baseUri) {
    require(bytes(baseUri).length > 0, "Invalid Base URI");
    emit BaseUriSet("", baseUri);
  }

  /**
   *
   * @dev Sets the base URI of all tokens.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "NFT Admins".
   *
   * @param baseUri Enter the base URI.
   *
   */
  function setBaseUri(string calldata baseUri) external nonReentrant _mustHaveAccess(DEFAULT_ADMIN_ROLE) {
    require(bytes(baseUri).length > 0, "Invalid Base URI");

    emit BaseUriSet(super.uri(0), baseUri);
    super._setURI(baseUri);
  }

  /**
   *
   * @dev Returns the URI where the given token's metadata can be viewed.
   * @custom:suppress-acl This function is publicly accessible.
   *
   * @param id Enter a token identifier to get the URI for.
   *
   */
  function uri(uint256 id) public view override returns (string memory) {
    string memory baseUri = super.uri(id);
    return string(abi.encodePacked(baseUri, Strings.toString(id), ".json"));
  }

  /**
   *
   * @dev Pauses this contract.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Pausers".
   *
   */
  function pause() external whenNotPaused nonReentrant _mustHaveAccess(NS_ROLES_PAUSER) {
    super._pause();
  }

  /**
   *
   * @dev Unpauses or resumes this contract.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Pausers".
   *
   */
  function unpause() external whenPaused nonReentrant _mustHaveAccess(NS_ROLES_PAUSER) {
    super._unpause();
  }
}
