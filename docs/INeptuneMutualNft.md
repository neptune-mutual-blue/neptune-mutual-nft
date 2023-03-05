# INeptuneMutualNft interface (INeptuneMutualNft.sol)

View Source: [src/interfaces/INeptuneMutualNft.sol](../src/interfaces/INeptuneMutualNft.sol)

**↘ Derived Contracts: [NeptuneMutualNftBase](NeptuneMutualNftBase.md)**

**INeptuneMutualNft**

**Events**

```js
event BaseUriSet(string  previous, string  current);
event SoulBound(uint256  id);
```

## Functions

- [isSoulbound(uint256 id)](#issoulbound)
- [setBaseUri(string baseUri)](#setbaseuri)
- [mint(address account, uint256 id, bool soulbound, bytes data)](#mint)
- [mintBatch(address to, uint256[] ids, uint256[] amounts, bytes data)](#mintbatch)
- [mintMany(address[] accounts, uint256[] ids, bool soulbound, bytes data)](#mintmany)

### isSoulbound

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
function isSoulbound(uint256 id) external view returns (bool);
```
</details>

### setBaseUri

```solidity
function setBaseUri(string baseUri) external nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| baseUri | string |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function setBaseUri(string calldata baseUri) external;
```
</details>

### mint

```solidity
function mint(address account, uint256 id, bool soulbound, bytes data) external nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| account | address |  | 
| id | uint256 |  | 
| soulbound | bool |  | 
| data | bytes |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function mint(address account, uint256 id, bool soulbound, bytes calldata data) external;
```
</details>

### mintBatch

```solidity
function mintBatch(address to, uint256[] ids, uint256[] amounts, bytes data) external nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| to | address |  | 
| ids | uint256[] |  | 
| amounts | uint256[] |  | 
| data | bytes |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function mintBatch(address to, uint256[] calldata ids, uint256[] calldata amounts, bytes calldata data) external;
```
</details>

### mintMany

```solidity
function mintMany(address[] accounts, uint256[] ids, bool soulbound, bytes data) external nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| accounts | address[] |  | 
| ids | uint256[] |  | 
| soulbound | bool |  | 
| data | bytes |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function mintMany(address[] calldata accounts, uint256[] calldata ids, bool soulbound, bytes calldata data) external;
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
