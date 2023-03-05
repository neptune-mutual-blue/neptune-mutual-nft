# IERC165.sol

View Source: [openzeppelin-solidity/contracts/utils/introspection/IERC165.sol](../openzeppelin-solidity/contracts/utils/introspection/IERC165.sol)

**↘ Derived Contracts: [ERC165](ERC165.md), [IERC1155](IERC1155.md), [IERC1155Receiver](IERC1155Receiver.md), [IERC2981](IERC2981.md)**

**IERC165**

Interface of the ERC165 standard, as defined in the
 https://eips.ethereum.org/EIPS/eip-165[EIP].
 Implementers can declare support of contract interfaces, which can then be
 queried by others ({ERC165Checker}).
 For an implementation, see {ERC165}.

## Functions

- [supportsInterface(bytes4 interfaceId)](#supportsinterface)

### supportsInterface

Returns true if this contract implements the interface defined by
 `interfaceId`. See the corresponding
 https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
 to learn more about how these ids are created.
 This function call must use less than 30 000 gas.

```solidity
function supportsInterface(bytes4 interfaceId) external view
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| interfaceId | bytes4 |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function supportsInterface(bytes4 interfaceId) external view returns (bool);
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
