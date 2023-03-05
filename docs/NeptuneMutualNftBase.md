# NeptuneMutualNftBase contract (NeptuneMutualNftBase.sol)

View Source: [src/NeptuneMutualNftBase.sol](../src/NeptuneMutualNftBase.sol)

**↗ Extends: [INeptuneMutualNft](INeptuneMutualNft.md), [Pausable](Pausable.md), [WithRoyalty](WithRoyalty.md)**
**↘ Derived Contracts: [Soulbound](Soulbound.md)**

**NeptuneMutualNftBase**

The base contract for the NFT contract.

## Functions

- [constructor(address minter, address admin, string baseUri)](#)
- [setBaseUri(string baseUri)](#setbaseuri)
- [uri(uint256 id)](#uri)
- [pause()](#pause)
- [unpause()](#unpause)

### 

Constructs this contract with the given input arguments.

```solidity
function (address minter, address admin, string baseUri) internal nonpayable NeptuneMutualNftAccess ERC1155 
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
constructor(address minter, address admin, string memory baseUri) NeptuneMutualNftAccess(minter, admin) ERC1155(baseUri) {
    require(bytes(baseUri).length > 0, "Invalid Base URI");
    emit BaseUriSet("", baseUri);
  }
```
</details>

### setBaseUri

Sets the base URI of all tokens.

```solidity
function setBaseUri(string baseUri) external nonpayable nonReentrant _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| baseUri | string | Enter the base URI. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function setBaseUri(string calldata baseUri) external nonReentrant _mustHaveAccess(DEFAULT_ADMIN_ROLE) {
    require(bytes(baseUri).length > 0, "Invalid Base URI");

    emit BaseUriSet(super.uri(0), baseUri);
    super._setURI(baseUri);
  }
```
</details>

### uri

Returns the URI where the given token's metadata can be viewed.

```solidity
function uri(uint256 id) public view
returns(string)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| id | uint256 | Enter a token identifier to get the URI for. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function uri(uint256 id) public view override returns (string memory) {
    string memory baseUri = super.uri(id);
    return string(abi.encodePacked(baseUri, Strings.toString(id), ".json"));
  }
```
</details>

### pause

Pauses this contract.

```solidity
function pause() external nonpayable whenNotPaused nonReentrant _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function pause() external whenNotPaused nonReentrant _mustHaveAccess(NS_ROLES_PAUSER) {
    super._pause();
  }
```
</details>

### unpause

Unpauses or resumes this contract.

```solidity
function unpause() external nonpayable whenPaused nonReentrant _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function unpause() external whenPaused nonReentrant _mustHaveAccess(NS_ROLES_PAUSER) {
    super._unpause();
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
