# IERC20Permit.sol

View Source: [openzeppelin-solidity/contracts/token/ERC20/extensions/draft-IERC20Permit.sol](../openzeppelin-solidity/contracts/token/ERC20/extensions/draft-IERC20Permit.sol)

**IERC20Permit**

Interface of the ERC20 Permit extension allowing approvals to be made via signatures, as defined in
 https://eips.ethereum.org/EIPS/eip-2612[EIP-2612].
 Adds the {permit} method, which can be used to change an account's ERC20 allowance (see {IERC20-allowance}) by
 presenting a message signed by the account. By not relying on {IERC20-approve}, the token holder account doesn't
 need to send a transaction, and thus is not required to hold Ether at all.

## Functions

- [permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)](#permit)
- [nonces(address owner)](#nonces)
- [DOMAIN_SEPARATOR()](#domain_separator)

### permit

Sets `value` as the allowance of `spender` over ``owner``'s tokens,
 given ``owner``'s signed approval.
 IMPORTANT: The same issues {IERC20-approve} has related to transaction
 ordering also apply here.
 Emits an {Approval} event.
 Requirements:
 - `spender` cannot be the zero address.
 - `deadline` must be a timestamp in the future.
 - `v`, `r` and `s` must be a valid `secp256k1` signature from `owner`
 over the EIP712-formatted function arguments.
 - the signature must use ``owner``'s current nonce (see {nonces}).
 For more information on the signature format, see the
 https://eips.ethereum.org/EIPS/eip-2612#specification[relevant EIP
 section].

```solidity
function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) external nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| owner | address |  | 
| spender | address |  | 
| value | uint256 |  | 
| deadline | uint256 |  | 
| v | uint8 |  | 
| r | bytes32 |  | 
| s | bytes32 |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
```
</details>

### nonces

Returns the current nonce for `owner`. This value must be
 included whenever a signature is generated for {permit}.
 Every successful call to {permit} increases ``owner``'s nonce by one. This
 prevents a signature from being used multiple times.

```solidity
function nonces(address owner) external view
returns(uint256)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| owner | address |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function nonces(address owner) external view returns (uint256);
```
</details>

### DOMAIN_SEPARATOR

Returns the domain separator used in the encoding of the signature for {permit}, as defined by {EIP712}.

```solidity
function DOMAIN_SEPARATOR() external view
returns(bytes32)
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function DOMAIN_SEPARATOR() external view returns (bytes32);
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
