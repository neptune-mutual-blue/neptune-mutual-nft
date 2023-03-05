# WithRoyalty contract (WithRoyalty.sol)

View Source: [src/WithRoyalty.sol](../src/WithRoyalty.sol)

**↗ Extends: [IWithRoyalty](IWithRoyalty.md), [NeptuneMutualNftAccess](NeptuneMutualNftAccess.md), [ERC1155](ERC1155.md), [ERC1155Burnable](ERC1155Burnable.md), [ERC2981](ERC2981.md)**
**↘ Derived Contracts: [NeptuneMutualNftBase](NeptuneMutualNftBase.md)**

**WithRoyalty**

WithRoyalty contract enables `NFT Royalty Admins` to configure
 royalty fee both on global and token level.

## Contract Members
**Constants & Variables**

```js
mapping(bytes4 => bool) internal _supportedInterfaces;

```

## Functions

- [constructor()](#)
- [setDefaultRoyalty(address receiver, uint96 feeNumerator)](#setdefaultroyalty)
- [deleteDefaultRoyalty()](#deletedefaultroyalty)
- [setTokenRoyalty(uint256 tokenId, address receiver, uint96 feeNumerator)](#settokenroyalty)
- [resetTokenRoyalty(uint256 tokenId)](#resettokenroyalty)
- [feeDenominator()](#feedenominator)
- [supportsInterface(bytes4 interfaceId)](#supportsinterface)

### 

Constructs this contract

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
    _supportedInterfaces[type(IAccessControl).interfaceId] = true;
    _supportedInterfaces[type(IERC1155).interfaceId] = true;
    _supportedInterfaces[type(IERC1155MetadataURI).interfaceId] = true;
    _supportedInterfaces[type(IERC2981).interfaceId] = true;
  }
```
</details>

### setDefaultRoyalty

Sets the default royalty defintion.

```solidity
function setDefaultRoyalty(address receiver, uint96 feeNumerator) external nonpayable _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| receiver | address | Enter the address which will receive royalties for all tokens by default. | 
| feeNumerator | uint96 | Enter the default royalty fee percentage                       (denominated as a fraction of the `feeDenominator()`). | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function setDefaultRoyalty(address receiver, uint96 feeNumerator) external _mustHaveAccess(NS_ROLES_ROYALTY_ADMIN) {
    super._setDefaultRoyalty(receiver, feeNumerator);
    emit DefaultRoyaltySet(msg.sender, receiver, feeNumerator);
  }
```
</details>

### deleteDefaultRoyalty

Deletes the default royalty defintion.

```solidity
function deleteDefaultRoyalty() external nonpayable _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function deleteDefaultRoyalty() external _mustHaveAccess(NS_ROLES_ROYALTY_ADMIN) {
    super._deleteDefaultRoyalty();
    emit DefaultRoyaltyDeleted(msg.sender);
  }
```
</details>

### setTokenRoyalty

Sets royalty information for the supplied token identifier.

```solidity
function setTokenRoyalty(uint256 tokenId, address receiver, uint96 feeNumerator) external nonpayable _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| tokenId | uint256 | Enter the tokenId. | 
| receiver | address | Enter the address which will receive royalty for this token's transactions. | 
| feeNumerator | uint96 | Enter this token's royalty fee percentage                       (denominated as a fraction of the `feeDenominator()`). | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function setTokenRoyalty(uint256 tokenId, address receiver, uint96 feeNumerator) external _mustHaveAccess(NS_ROLES_ROYALTY_ADMIN) {
    super._setTokenRoyalty(tokenId, receiver, feeNumerator);
    emit TokenRoyaltySet(msg.sender, tokenId, receiver, feeNumerator);
  }
```
</details>

### resetTokenRoyalty

Resets the supplied token's royalty info that results in default royalty taking affect.

```solidity
function resetTokenRoyalty(uint256 tokenId) external nonpayable _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| tokenId | uint256 | Enter the tokenId you would like to reset to royalty of. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function resetTokenRoyalty(uint256 tokenId) external _mustHaveAccess(NS_ROLES_ROYALTY_ADMIN) {
    super._resetTokenRoyalty(tokenId);
    emit TokenRoyaltyReset(msg.sender, tokenId);
  }
```
</details>

### feeDenominator

Returns the fee donomiator of this contract.

```solidity
function feeDenominator() external pure
returns(uint96)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function feeDenominator() external pure virtual returns (uint96) {
    return super._feeDenominator();
  }
```
</details>

### supportsInterface

Checks whether the supplied `interfaceId` is supported by this contract.

```solidity
function supportsInterface(bytes4 interfaceId) public view
returns(bool)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| interfaceId | bytes4 | Enter an interface identifier to check. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function supportsInterface(bytes4 interfaceId) public view virtual override(AccessControl, ERC1155, ERC2981) returns (bool) {
    return _supportedInterfaces[interfaceId];
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
