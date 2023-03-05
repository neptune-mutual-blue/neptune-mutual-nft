# IERC1155MetadataURI.sol

View Source: [openzeppelin-solidity/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol](../openzeppelin-solidity/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol)

**↗ Extends: [IERC1155](IERC1155.md)**
**↘ Derived Contracts: [ERC1155](ERC1155.md)**

**IERC1155MetadataURI**

Interface of the optional ERC1155MetadataExtension interface, as defined
 in the https://eips.ethereum.org/EIPS/eip-1155#metadata-extensions[EIP].
 _Available since v3.1._

## Functions

- [uri(uint256 id)](#uri)

### uri

Returns the URI for token type `id`.
 If the `\{id\}` substring is present in the URI, it must be replaced by
 clients with the actual token type ID.

```solidity
function uri(uint256 id) external view
returns(string)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| id | uint256 |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function uri(uint256 id) external view returns (string memory);
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
