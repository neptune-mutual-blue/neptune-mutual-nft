Checklist

- [ ] Install [foundry](https://book.getfoundry.sh/getting-started/installation)
- [ ] Install [lcov](https://formulae.brew.sh/formula/lcov) on Mac OS or [genhtml](https://manpages.ubuntu.com/manpages/xenial/man1/genhtml.1.html) on Linux


```
git submodule update --init --recursive
forge install
```

## Commands

**Build**

```
forge build
```

**Test**

```
forge test
```

or

```
forge test -vvvvv
```

**Coverage**

```
forge coverage
```

or

```
forge coverage --report lcov && genhtml lcov.info --branch-coverage --output-dir coverage

open ./coverage/index.html
```

**Deploy**


```
chmod +x ./deploy.sh
./deploy.sh
```

---

[comment]: #solidoc Start
# NeptuneMutualNft contract (NeptuneMutualNft.sol)

View Source: [src/NeptuneMutualNft.sol](/src/NeptuneMutualNft.sol)

**↗ Extends: [Soulbound](docs/Soulbound.md)**

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

* [AccessControl](docs/AccessControl.md)
* [Address](docs/Address.md)
* [Context](docs/Context.md)
* [ERC1155](docs/ERC1155.md)
* [ERC1155Burnable](docs/ERC1155Burnable.md)
* [ERC165](docs/ERC165.md)
* [ERC2981](docs/ERC2981.md)
* [IAccessControl](docs/IAccessControl.md)
* [IERC1155](docs/IERC1155.md)
* [IERC1155MetadataURI](docs/IERC1155MetadataURI.md)
* [IERC1155Receiver](docs/IERC1155Receiver.md)
* [IERC165](docs/IERC165.md)
* [IERC20](docs/IERC20.md)
* [IERC20Permit](docs/IERC20Permit.md)
* [IERC2981](docs/IERC2981.md)
* [INeptuneMutualNft](docs/INeptuneMutualNft.md)
* [IWithRoyalty](docs/IWithRoyalty.md)
* [Math](docs/Math.md)
* [NeptuneMutualNft](docs/NeptuneMutualNft.md)
* [NeptuneMutualNftAccess](docs/NeptuneMutualNftAccess.md)
* [NeptuneMutualNftBase](docs/NeptuneMutualNftBase.md)
* [Pausable](docs/Pausable.md)
* [ReentrancyGuard](docs/ReentrancyGuard.md)
* [SafeERC20](docs/SafeERC20.md)
* [Soulbound](docs/Soulbound.md)
* [Strings](docs/Strings.md)
* [WithRoyalty](docs/WithRoyalty.md)

[comment]: #solidoc End
