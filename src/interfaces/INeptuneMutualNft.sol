// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

/**
 *
 * @title INeptuneMutualNft interface
 *
 */
interface INeptuneMutualNft {
  event BaseUriSet(string previous, string current);
  event SoulBound(uint256 id);
  event PersonaSet(address indexed account, uint8 indexed persona);

  function isSoulbound(uint256 id) external view returns (bool);

  function setBaseUri(string calldata baseUri) external;

  function mint(address account, uint256 id, bool soulbound, bytes calldata data) external;

  function setPersona(uint8 persona) external;

  function personas(address account) external view returns (uint8);

  function minted(uint256 id) external view returns (bool);

  function mintBatch(address to, uint256[] calldata ids, uint256[] calldata amounts, bytes calldata data) external;
  function mintMany(address[] calldata accounts, uint256[] calldata ids, bool soulbound, bytes calldata data) external;
}
