# Soulbound contract (Soulbound.sol)

View Source: [src/Soulbound.sol](../src/Soulbound.sol)

**↗ Extends: [NeptuneMutualNftBase](NeptuneMutualNftBase.md)**
**↘ Derived Contracts: [NeptuneMutualNft](NeptuneMutualNft.md)**

**Soulbound**

Once a soulbound NFT is sent to a wallet,
 its soul is bound to that wallet for eternity.
 This contract enforces the rules that restrict transfers of soulbould tokens.

## Contract Members
**Constants & Variables**

```js
mapping(uint256 => bool) internal _soulbound;

```

## Functions

- [constructor(address minter, address admin, string baseUri)](#)
- [_beforeTokenTransfer(address operator, address from, address to, uint256[] ids, uint256[] amounts, bytes data)](#_beforetokentransfer)
- [isSoulbound(uint256 id)](#issoulbound)

### 

Constructs this contract with the given input arguments.

```solidity
function (address minter, address admin, string baseUri) internal nonpayable NeptuneMutualNftBase 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| minter | address | Enter an address which will be added to the minter list. | 
| admin | address | Enter an address which will be added to the admin list. | 
| baseUri | string | Specify the base URI for the NFT metadata. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
constructor(address minter, address admin, string memory baseUri) NeptuneMutualNftBase(minter, admin, baseUri) { }
```
</details>

### _beforeTokenTransfer

This hook overrides the empty `_beforeTokenTransfer`
 function of the `ERC1155` contract and ensures that
 the tokens that are soulbound can't leave their wallets.

```solidity
function _beforeTokenTransfer(address operator, address from, address to, uint256[] ids, uint256[] amounts, bytes data) internal nonpayable whenNotPaused 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| operator | address | The identity that was acting on behalf of the `from` address. | 
| from | address | The address from which the token was being transferred out. | 
| to | address | The address where the token was being sent to. | 
| ids | uint256[] | The token identifiers that were being transferred. | 
| amounts | uint256[] | The respective amount of tokens that were being transferred. | 
| data | bytes | Application-specific custom data. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) internal override whenNotPaused {
    // Only enter if this isn't a mint operation
    if (from != address(0)) {
      for (uint256 i = 0; i < ids.length; i++) {
        uint256 id = ids[i];
        require(_soulbound[id] == false, "Error: soulbound");
      }
    }

    super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
  }
```
</details>

### isSoulbound

Signifies if the given token identifier is bound to its owner for life.

```solidity
function isSoulbound(uint256 id) external view
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| id | uint256 |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function isSoulbound(uint256 id) external view override returns (bool) {
    return _soulbound[id];
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
