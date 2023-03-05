# NeptuneMutualNftAccess contract (NeptuneMutualNftAccess.sol)

View Source: [src/NeptuneMutualNftAccess.sol](../src/NeptuneMutualNftAccess.sol)

**↗ Extends: [AccessControl](AccessControl.md), [ReentrancyGuard](ReentrancyGuard.md)**
**↘ Derived Contracts: [WithRoyalty](WithRoyalty.md)**

**NeptuneMutualNftAccess**

The NeptuneMutualNftAccess provides access control features
 and token-recovery mechanism.

## Contract Members
**Constants & Variables**

```js
bytes32 public constant NS_ROLES_ROYALTY_ADMIN;
bytes32 public constant NS_ROLES_MINTER;
bytes32 public constant NS_ROLES_PAUSER;
bytes32 public constant NS_ROLES_RECOVERY_AGENT;

```

## Modifiers

- [_mustHaveAccess](#_musthaveaccess)

### _mustHaveAccess

```js
modifier _mustHaveAccess(bytes32 role) internal
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| role | bytes32 |  | 

## Functions

- [constructor(address minter, address admin)](#)
- [_configureAccessPolicy(address minter, address admin)](#_configureaccesspolicy)
- [recoverEther(address sendTo)](#recoverether)
- [recoverToken(IERC20 malicious, address sendTo)](#recovertoken)

### 

Constructs this contract with the given input arguments.

```solidity
function (address minter, address admin) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| minter | address | Enter an address which will be added to the minter list. | 
| admin | address | Enter an address which will be added to the admin list. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
constructor(address minter, address admin) {
    _configureAccessPolicy(minter, admin);
  }
```
</details>

### _configureAccessPolicy

Sets up initial access policy configuration.

```solidity
function _configureAccessPolicy(address minter, address admin) private nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| minter | address | Enter an address which will be granted the minter role. | 
| admin | address | Enter an address which will be granted the admin role. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _configureAccessPolicy(address minter, address admin) private {
    _setRoleAdmin(NS_ROLES_MINTER, DEFAULT_ADMIN_ROLE);
    _setRoleAdmin(NS_ROLES_PAUSER, DEFAULT_ADMIN_ROLE);
    _setRoleAdmin(NS_ROLES_ROYALTY_ADMIN, DEFAULT_ADMIN_ROLE);
    _setRoleAdmin(NS_ROLES_RECOVERY_AGENT, DEFAULT_ADMIN_ROLE);

    _setupRole(NS_ROLES_MINTER, minter);
    _setupRole(DEFAULT_ADMIN_ROLE, admin);
  }
```
</details>

### recoverEther

Recover all Ether held by the contract.

```solidity
function recoverEther(address sendTo) external nonpayable nonReentrant _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| sendTo | address | The address that receives the recovered ether. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function recoverEther(address sendTo) external nonReentrant _mustHaveAccess(NS_ROLES_RECOVERY_AGENT) {
    // slither-disable-next-line low-level-calls
    (bool success,) = payable(sendTo).call{ value: address(this).balance }(""); // solhint-disable-line avoid-low-level-calls
    require(success, "Recipient may have reverted");
  }
```
</details>

### recoverToken

Recover an ERC-20-like token sent to this contract.

```solidity
function recoverToken(IERC20 malicious, address sendTo) external nonpayable nonReentrant _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| malicious | IERC20 | ERC-20 The address of the token contract. | 
| sendTo | address | The address that receives the recovered tokens. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function recoverToken(IERC20 malicious, address sendTo) external nonReentrant _mustHaveAccess(NS_ROLES_RECOVERY_AGENT) {
    malicious.safeTransfer(sendTo, malicious.balanceOf(address(this)));
  }
```
</details>

## Contracts

* [AccessControl](AccessControl.md)
* [Address](Address.md)
* [Context](Context.md)
* [ERC1155](ERC1155.md)
* [ERC1155Burnable](ERC1155Burnable.md)
* [ERC165](ERC165.md)
* [ERC2981](ERC2981.md)
* [IAccessControl](IAccessControl.md)
* [IERC1155](IERC1155.md)
* [IERC1155MetadataURI](IERC1155MetadataURI.md)
* [IERC1155Receiver](IERC1155Receiver.md)
* [IERC165](IERC165.md)
* [IERC20](IERC20.md)
* [IERC20Permit](IERC20Permit.md)
* [IERC2981](IERC2981.md)
* [INeptuneMutualNft](INeptuneMutualNft.md)
* [IWithRoyalty](IWithRoyalty.md)
* [Math](Math.md)
* [NeptuneMutualNft](NeptuneMutualNft.md)
* [NeptuneMutualNftAccess](NeptuneMutualNftAccess.md)
* [NeptuneMutualNftBase](NeptuneMutualNftBase.md)
* [Pausable](Pausable.md)
* [ReentrancyGuard](ReentrancyGuard.md)
* [SafeERC20](SafeERC20.md)
* [Soulbound](Soulbound.md)
* [Strings](Strings.md)
* [WithRoyalty](WithRoyalty.md)
