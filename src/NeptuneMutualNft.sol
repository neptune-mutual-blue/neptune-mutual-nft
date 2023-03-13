// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "./Soulbound.sol";

/**
 *
 * @title NeptuneMutualNft contract
 * @custom:suppress-acl Only views should be publicly accessible.
 *
 * @dev The NeptuneMutualNft contract, in addition to implementing other OpenZeppelin contracts,
 * mainly extends OpenZeppelin's implementation of the ERC1155 and ERC2981 standards
 * with additional functionalities such as soulbound tokens, pausability, token recovery,
 * access control, and more.
 *
 */
contract NeptuneMutualNft is Soulbound {
  mapping(uint256 => bool) public minted;
  mapping(address => uint8) public personas;

  /**
   *
   * @dev Constructs this contract with the given input arguments.
   *
   * @param minter    Enter an address which will be added to the minter list.
   * @param admin     Enter an address which will be added to the admin list.
   * @param baseUri   Specify the base URI for the NFT metadata.
   *
   */

  constructor(address minter, address admin, string memory baseUri) Soulbound(minter, admin, baseUri) { } // solhint-disable-line

  /**
   *
   * @dev Enables you to set persona once
   * @custom:suppress-acl This function is publicly accessilbe.
   *
   * @param persona Specify what your persona is.
   *
   * 1 - Guardian
   * 2 - Beast
   *
   */
  function setPersona(uint8 persona) external nonReentrant {
    require(persona >= 1 && persona <= 2, "Error: invalid persona");
    require(personas[msg.sender] == 0, "Error: already set");

    personas[msg.sender] = persona;

    emit PersonaSet(msg.sender, persona);
  }

  /**
   *
   * @dev Mints a new NTF based on the input parameters.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Minters".
   *
   * @param account     Provide the account address which will receive this NFT.
   * @param id          Enter the token identifier to mint.
   * @param soulbound   Specify if this token is soulbound to its owner.
   * @param data        App-specific data, if any.
   *
   */

  function mint(address account, uint256 id, bool soulbound, bytes calldata data) external nonReentrant _mustHaveAccess(NS_ROLES_MINTER) {
    require(!minted[id], "Duplicate id");

    _soulbound[id] = soulbound;
    minted[id] = true;

    if (soulbound) {
      emit SoulBound(id);
    }

    super._mint(account, id, 1, data);
  }

  /**
   *
   * @dev Mints multiple NTFs based on the input parameters.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Minters".
   *
   * @param to          Provide the account address that will receive these NFTs.
   * @param ids         Enter token identifiers to mint.
   * @param amounts     Specify respective amounts of NFTs to mint.
   * @param data        App-specific data, if any.
   *
   */
  function mintBatch(address to, uint256[] calldata ids, uint256[] calldata amounts, bytes calldata data) external nonReentrant _mustHaveAccess(NS_ROLES_MINTER) {
    for (uint256 i = 0; i < ids.length; i++) {
      require(amounts[i] == 1, "Invalid amount");

      require(!minted[ids[i]], "Duplicate id");
      minted[ids[i]] = true;
    }

    super._mintBatch(to, ids, amounts, data);
  }

  /**
   *
   * @dev Mints many NTFs based on the input parameters.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Minters".
   *
   * @param accounts    Provide the account address that will receive these NFTs.
   * @param ids         Enter token identifiers to mint.
   * @param soulbound   Specify if this token is soulbound to its owner.
   * @param data        App-specific data, if any.
   *
   */
  function mintMany(address[] calldata accounts, uint256[] calldata ids, bool soulbound, bytes calldata data) external nonReentrant _mustHaveAccess(NS_ROLES_MINTER) {
    for (uint256 i = 0; i < ids.length; i++) {
      _soulbound[ids[i]] = soulbound;

      if (soulbound) {
        emit SoulBound(ids[i]);
      }

      require(!minted[ids[i]], "Duplicate id");

      minted[ids[i]] = true;
      super._mint(accounts[i], ids[i], 1, data);
    }
  }

  /**
   *
   * @dev Checks whether the supplied `interfaceId` is supported by this contract.
   * @custom:suppress-acl This function is publicly accessible.
   *
   * @param interfaceId Enter an interface identifier to check.
   *
   */
  function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
    return super.supportsInterface(interfaceId);
  }
}
