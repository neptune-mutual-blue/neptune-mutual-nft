# ReentrancyGuard.sol

View Source: [openzeppelin-solidity/contracts/security/ReentrancyGuard.sol](../openzeppelin-solidity/contracts/security/ReentrancyGuard.sol)

**↘ Derived Contracts: [NeptuneMutualNftAccess](NeptuneMutualNftAccess.md)**

**ReentrancyGuard**

Contract module that helps prevent reentrant calls to a function.
 Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 available, which can be applied to functions to make sure there are no nested
 (reentrant) calls to them.
 Note that because there is a single `nonReentrant` guard, functions marked as
 `nonReentrant` may not call one another. This can be worked around by making
 those functions `private`, and then adding `external` `nonReentrant` entry
 points to them.
 TIP: If you would like to learn more about reentrancy and alternative ways
 to protect against it, check out our blog post
 https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].

## Contract Members
**Constants & Variables**

```js
uint256 private constant _NOT_ENTERED;
uint256 private constant _ENTERED;
uint256 private _status;

```

## Modifiers

- [nonReentrant](#nonreentrant)

### nonReentrant

Prevents a contract from calling itself, directly or indirectly.
 Calling a `nonReentrant` function from another `nonReentrant`
 function is not supported. It is possible to prevent this from happening
 by making the `nonReentrant` function external, and making it call a
 `private` function that does the actual work.

```js
modifier nonReentrant() internal
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

## Functions

- [constructor()](#)
- [_nonReentrantBefore()](#_nonreentrantbefore)
- [_nonReentrantAfter()](#_nonreentrantafter)

### 

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
        _status = _NOT_ENTERED;
    }
```
</details>

### _nonReentrantBefore

```solidity
function _nonReentrantBefore() private nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _nonReentrantBefore() private {
        // On the first call to nonReentrant, _status will be _NOT_ENTERED
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;
    }
```
</details>

### _nonReentrantAfter

```solidity
function _nonReentrantAfter() private nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _nonReentrantAfter() private {
        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
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
