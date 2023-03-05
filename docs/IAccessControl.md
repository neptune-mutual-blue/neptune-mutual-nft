# IAccessControl.sol

View Source: [openzeppelin-solidity/contracts/access/IAccessControl.sol](../openzeppelin-solidity/contracts/access/IAccessControl.sol)

**↘ Derived Contracts: [AccessControl](AccessControl.md)**

**IAccessControl**

External interface of AccessControl declared to support ERC165 detection.

**Events**

```js
event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);
event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);
event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);
```

## Functions

- [hasRole(bytes32 role, address account)](#hasrole)
- [getRoleAdmin(bytes32 role)](#getroleadmin)
- [grantRole(bytes32 role, address account)](#grantrole)
- [revokeRole(bytes32 role, address account)](#revokerole)
- [renounceRole(bytes32 role, address account)](#renouncerole)

### hasRole

Returns `true` if `account` has been granted `role`.

```solidity
function hasRole(bytes32 role, address account) external view
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| role | bytes32 |  | 
| account | address |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function hasRole(bytes32 role, address account) external view returns (bool);
```
</details>

### getRoleAdmin

Returns the admin role that controls `role`. See {grantRole} and
 {revokeRole}.
 To change a role's admin, use {AccessControl-_setRoleAdmin}.

```solidity
function getRoleAdmin(bytes32 role) external view
returns(bytes32)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| role | bytes32 |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function getRoleAdmin(bytes32 role) external view returns (bytes32);
```
</details>

### grantRole

Grants `role` to `account`.
 If `account` had not been already granted `role`, emits a {RoleGranted}
 event.
 Requirements:
 - the caller must have ``role``'s admin role.

```solidity
function grantRole(bytes32 role, address account) external nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| role | bytes32 |  | 
| account | address |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function grantRole(bytes32 role, address account) external;
```
</details>

### revokeRole

Revokes `role` from `account`.
 If `account` had been granted `role`, emits a {RoleRevoked} event.
 Requirements:
 - the caller must have ``role``'s admin role.

```solidity
function revokeRole(bytes32 role, address account) external nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| role | bytes32 |  | 
| account | address |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function revokeRole(bytes32 role, address account) external;
```
</details>

### renounceRole

Revokes `role` from the calling account.
 Roles are often managed via {grantRole} and {revokeRole}: this function's
 purpose is to provide a mechanism for accounts to lose their privileges
 if they are compromised (such as when a trusted device is misplaced).
 If the calling account had been granted `role`, emits a {RoleRevoked}
 event.
 Requirements:
 - the caller must be `account`.

```solidity
function renounceRole(bytes32 role, address account) external nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| role | bytes32 |  | 
| account | address |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function renounceRole(bytes32 role, address account) external;
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
