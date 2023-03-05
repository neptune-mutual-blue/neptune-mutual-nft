# NeptuneMutualNft contract (NeptuneMutualNft.sol)

View Source: [src/NeptuneMutualNft.sol](../src/NeptuneMutualNft.sol)

**↗ Extends: [Soulbound](Soulbound.md)**

**NeptuneMutualNft**

The NeptuneMutualNft contract, in addition to implementing other OpenZeppelin contracts,
 mainly extends OpenZeppelin's implementation of the ERC1155 and ERC2981 standards
 with additional functionalities such as soulbound tokens, pausability, token recovery,
 access control, and more.

## Contract Members
**Constants & Variables**

```js
mapping(uint256 => bool) public _minted;

```

## Functions

- [constructor(address minter, address admin, string baseUri)](#)
- [mint(address account, uint256 id, bool soulbound, bytes data)](#mint)
- [mintBatch(address to, uint256[] ids, uint256[] amounts, bytes data)](#mintbatch)
- [mintMany(address[] accounts, uint256[] ids, bool soulbound, bytes data)](#mintmany)
- [supportsInterface(bytes4 interfaceId)](#supportsinterface)

### 

Constructs this contract with the given input arguments.

```solidity
function (address minter, address admin, string baseUri) public nonpayable Soulbound 
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
constructor(address minter, address admin, string memory baseUri) Soulbound(minter, admin, baseUri) { }
```
</details>

### mint

Mints a new NTF based on the input parameters.

```solidity
function mint(address account, uint256 id, bool soulbound, bytes data) external nonpayable nonReentrant _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| account | address | Provide the account address which will receive this NFT. | 
| id | uint256 | Enter the token identifier to mint. | 
| soulbound | bool | Specify if this token is soulbound to its owner. | 
| data | bytes | App-specific data, if any. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function mint(address account, uint256 id, bool soulbound, bytes calldata data) external nonReentrant _mustHaveAccess(NS_ROLES_MINTER) {
    require(_minted[id] == false, "Duplicate id");

    _soulbound[id] = soulbound;
    _minted[id] = true;

    if (soulbound) {
      emit SoulBound(id);
    }

    super._mint(account, id, 1, data);
  }
```
</details>

### mintBatch

Mints multiple NTFs based on the input parameters.

```solidity
function mintBatch(address to, uint256[] ids, uint256[] amounts, bytes data) external nonpayable nonReentrant _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| to | address | Provide the account address that will receive these NFTs. | 
| ids | uint256[] | Enter token identifiers to mint. | 
| amounts | uint256[] | Specify respective amounts of NFTs to mint. | 
| data | bytes | App-specific data, if any. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function mintBatch(address to, uint256[] calldata ids, uint256[] calldata amounts, bytes calldata data) external nonReentrant _mustHaveAccess(NS_ROLES_MINTER) {
    for (uint256 i = 0; i < ids.length; i++) {
      require(amounts[i] == 1, "Invalid amount");

      require(_minted[ids[i]] == false, "Duplicate id");
      _minted[ids[i]] = true;
    }

    super._mintBatch(to, ids, amounts, data);
  }
```
</details>

### mintMany

Mints many NTFs based on the input parameters.

```solidity
function mintMany(address[] accounts, uint256[] ids, bool soulbound, bytes data) external nonpayable nonReentrant _mustHaveAccess 
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| accounts | address[] | Provide the account address that will receive these NFTs. | 
| ids | uint256[] | Enter token identifiers to mint. | 
| soulbound | bool | Specify if this token is soulbound to its owner. | 
| data | bytes | App-specific data, if any. | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function mintMany(address[] calldata accounts, uint256[] calldata ids, bool soulbound, bytes calldata data) external nonReentrant _mustHaveAccess(NS_ROLES_MINTER) {
    for (uint256 i = 0; i < ids.length; i++) {
      _soulbound[ids[i]] = soulbound;

      if (soulbound) {
        emit SoulBound(ids[i]);
      }

      require(_minted[ids[i]] == false, "Duplicate id");

      _minted[ids[i]] = true;
      super._mint(accounts[i], ids[i], 1, data);
    }
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
function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
    return super.supportsInterface(interfaceId);
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
