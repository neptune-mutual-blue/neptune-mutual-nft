# Context.sol

View Source: [openzeppelin-solidity/contracts/utils/Context.sol](../openzeppelin-solidity/contracts/utils/Context.sol)

**↘ Derived Contracts: [AccessControl](AccessControl.md), [ERC1155](ERC1155.md), [Pausable](Pausable.md)**

**Context**

Provides information about the current execution context, including the
 sender of the transaction and its data. While these are generally available
 via msg.sender and msg.data, they should not be accessed in such a direct
 manner, since when dealing with meta-transactions the account sending and
 paying for execution may not be the actual sender (as far as an application
 is concerned).
 This contract is only required for intermediate, library-like contracts.

## Functions

- [_msgSender()](#_msgsender)
- [_msgData()](#_msgdata)

### _msgSender

```solidity
function _msgSender() internal view
returns(address)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
```
</details>

### _msgData

```solidity
function _msgData() internal view
returns(bytes)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
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
