# Pausable.sol

View Source: [openzeppelin-solidity/contracts/security/Pausable.sol](../openzeppelin-solidity/contracts/security/Pausable.sol)

**↗ Extends: [Context](Context.md)**
**↘ Derived Contracts: [NeptuneMutualNftBase](NeptuneMutualNftBase.md)**

**Pausable**

Contract module which allows children to implement an emergency stop
 mechanism that can be triggered by an authorized account.
 This module is used through inheritance. It will make available the
 modifiers `whenNotPaused` and `whenPaused`, which can be applied to
 the functions of your contract. Note that they will not be pausable by
 simply including this module, only once the modifiers are put in place.

## Contract Members
**Constants & Variables**

```js
bool private _paused;

```

**Events**

```js
event Paused(address  account);
event Unpaused(address  account);
```

## Modifiers

- [whenNotPaused](#whennotpaused)
- [whenPaused](#whenpaused)

### whenNotPaused

Modifier to make a function callable only when the contract is not paused.
 Requirements:
 - The contract must not be paused.

```js
modifier whenNotPaused() internal
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

### whenPaused

Modifier to make a function callable only when the contract is paused.
 Requirements:
 - The contract must be paused.

```js
modifier whenPaused() internal
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

## Functions

- [constructor()](#)
- [paused()](#paused)
- [_requireNotPaused()](#_requirenotpaused)
- [_requirePaused()](#_requirepaused)
- [_pause()](#_pause)
- [_unpause()](#_unpause)

### 

Initializes the contract in unpaused state.

```solidity
function () internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
constructor() {
        _paused = false;
    }
```
</details>

### paused

Returns true if the contract is paused, and false otherwise.

```solidity
function paused() public view
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function paused() public view virtual returns (bool) {
        return _paused;
    }
```
</details>

### _requireNotPaused

Throws if the contract is paused.

```solidity
function _requireNotPaused() internal view
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _requireNotPaused() internal view virtual {
        require(!paused(), "Pausable: paused");
    }
```
</details>

### _requirePaused

Throws if the contract is not paused.

```solidity
function _requirePaused() internal view
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _requirePaused() internal view virtual {
        require(paused(), "Pausable: not paused");
    }
```
</details>

### _pause

Triggers stopped state.
 Requirements:
 - The contract must not be paused.

```solidity
function _pause() internal nonpayable whenNotPaused 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _pause() internal virtual whenNotPaused {
        _paused = true;
        emit Paused(_msgSender());
    }
```
</details>

### _unpause

Returns to normal state.
 Requirements:
 - The contract must be paused.

```solidity
function _unpause() internal nonpayable whenPaused 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _unpause() internal virtual whenPaused {
        _paused = false;
        emit Unpaused(_msgSender());
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
