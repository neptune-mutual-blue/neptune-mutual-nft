// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "openzeppelin-solidity/contracts/access/AccessControl.sol";
import "openzeppelin-solidity/contracts/token/ERC20/utils/SafeERC20.sol";
import "openzeppelin-solidity/contracts/security/ReentrancyGuard.sol";

/**
 *
 * @title NeptuneMutualNftAccess contract
 * @custom:suppress-acl Only views should be publicly accessible.
 *
 * @notice The NeptuneMutualNftAccess provides access control features
 * and token-recovery mechanism.
 *
 */
abstract contract NeptuneMutualNftAccess is AccessControl, ReentrancyGuard {
  using SafeERC20 for IERC20;

  bytes32 public constant NS_ROLES_ROYALTY_ADMIN = "role:royalty:admin";
  bytes32 public constant NS_ROLES_MINTER = "role:minter";
  bytes32 public constant NS_ROLES_PAUSER = "role:pauser";
  bytes32 public constant NS_ROLES_RECOVERY_AGENT = "role:recovery:agent";

  /**
   *
   * @dev Constructs this contract with the given input arguments.
   *
   * @param minter    Enter an address which will be added to the minter list.
   * @param admin     Enter an address which will be added to the admin list.
   *
   */
  constructor(address minter, address admin) {
    _configureAccessPolicy(minter, admin);
  }

  /**
   *
   * @dev Sets up initial access policy configuration.
   * @custom:suppress-acl This function must not be internally or externally accessible.
   *
   * @param minter    Enter an address which will be granted the minter role.
   * @param admin     Enter an address which will be granted the admin role.
   *
   */
  function _configureAccessPolicy(address minter, address admin) private {
    _setRoleAdmin(NS_ROLES_MINTER, DEFAULT_ADMIN_ROLE);
    _setRoleAdmin(NS_ROLES_PAUSER, DEFAULT_ADMIN_ROLE);
    _setRoleAdmin(NS_ROLES_ROYALTY_ADMIN, DEFAULT_ADMIN_ROLE);
    _setRoleAdmin(NS_ROLES_RECOVERY_AGENT, DEFAULT_ADMIN_ROLE);

    _setupRole(NS_ROLES_MINTER, minter);
    _setupRole(DEFAULT_ADMIN_ROLE, admin);
  }

  /**
   * Enforces transaction sender to have access to the mentioned role.
   */
  modifier _mustHaveAccess(bytes32 role) {
    require(super.hasRole(role, msg.sender), "Access denied");
    _;
  }

  /**
   *
   * @dev Recover all Ether held by the contract.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Recovery Agents".
   *
   * @param sendTo      The address that receives the recovered ether.
   *
   */
  function recoverEther(address sendTo) external nonReentrant _mustHaveAccess(NS_ROLES_RECOVERY_AGENT) {
    // slither-disable-next-line low-level-calls
    (bool success,) = payable(sendTo).call{ value: address(this).balance }(""); // solhint-disable-line avoid-low-level-calls
    require(success, "Recipient may have reverted");
  }

  /**
   *
   * @dev Recover an ERC-20-like token sent to this contract.
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Recovery Agents".
   *
   * @param malicious   ERC-20 The address of the token contract.
   * @param sendTo      The address that receives the recovered tokens.
   *
   * @custom:suppress-acl Ensure that this feature can only be accessed by "Recovery Agents".
   *
   */
  function recoverToken(IERC20 malicious, address sendTo) external nonReentrant _mustHaveAccess(NS_ROLES_RECOVERY_AGENT) {
    malicious.safeTransfer(sendTo, malicious.balanceOf(address(this)));
  }
}
