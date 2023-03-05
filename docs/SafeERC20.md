# SafeERC20 (SafeERC20.sol)

View Source: [openzeppelin-solidity/contracts/token/ERC20/utils/SafeERC20.sol](../openzeppelin-solidity/contracts/token/ERC20/utils/SafeERC20.sol)

**SafeERC20**

Wrappers around ERC20 operations that throw on failure (when the token
 contract returns false). Tokens that return no value (and instead revert or
 throw on failure) are also supported, non-reverting calls are assumed to be
 successful.
 To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 which allows you to call the safe operations as `token.safeTransfer(...)`, etc.

## Functions

- [safeTransfer(IERC20 token, address to, uint256 value)](#safetransfer)
- [safeTransferFrom(IERC20 token, address from, address to, uint256 value)](#safetransferfrom)
- [safeApprove(IERC20 token, address spender, uint256 value)](#safeapprove)
- [safeIncreaseAllowance(IERC20 token, address spender, uint256 value)](#safeincreaseallowance)
- [safeDecreaseAllowance(IERC20 token, address spender, uint256 value)](#safedecreaseallowance)
- [safePermit(IERC20Permit token, address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)](#safepermit)
- [_callOptionalReturn(IERC20 token, bytes data)](#_calloptionalreturn)

### safeTransfer

```solidity
function safeTransfer(IERC20 token, address to, uint256 value) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | IERC20 |  | 
| to | address |  | 
| value | uint256 |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function safeTransfer(
        IERC20 token,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }
```
</details>

### safeTransferFrom

```solidity
function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | IERC20 |  | 
| from | address |  | 
| to | address |  | 
| value | uint256 |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function safeTransferFrom(
        IERC20 token,
        address from,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }
```
</details>

### safeApprove

Deprecated. This function has issues similar to the ones found in
 {IERC20-approve}, and its usage is discouraged.
 Whenever possible, use {safeIncreaseAllowance} and
 {safeDecreaseAllowance} instead.

```solidity
function safeApprove(IERC20 token, address spender, uint256 value) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | IERC20 |  | 
| spender | address |  | 
| value | uint256 |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function safeApprove(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require(
            (value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }
```
</details>

### safeIncreaseAllowance

```solidity
function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | IERC20 |  | 
| spender | address |  | 
| value | uint256 |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function safeIncreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender) + value;
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }
```
</details>

### safeDecreaseAllowance

```solidity
function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | IERC20 |  | 
| spender | address |  | 
| value | uint256 |  | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function safeDecreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        unchecked {
            uint256 oldAllowance = token.allowance(address(this), spender);
            require(oldAllowance >= value, "SafeERC20: decreased allowance below zero");
            uint256 newAllowance = oldAllowance - value;
            _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
        }
    }
```
</details>

### safePermit

```solidity
function safePermit(IERC20Permit token, address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) internal nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | IERC20Permit |  | 
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
function safePermit(
        IERC20Permit token,
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal {
        uint256 nonceBefore = token.nonces(owner);
        token.permit(owner, spender, value, deadline, v, r, s);
        uint256 nonceAfter = token.nonces(owner);
        require(nonceAfter == nonceBefore + 1, "SafeERC20: permit did not succeed");
    }
```
</details>

### _callOptionalReturn

Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
 on the return value: the return value is optional (but if data is returned, it must not be false).

```solidity
function _callOptionalReturn(IERC20 token, bytes data) private nonpayable
```

**Arguments**

| Name        | Type           | Description  |
| ------------- |------------- | -----|
| token | IERC20 | The token targeted by the call. | 
| data | bytes | The call data (encoded using abi.encode or one of its variants). | 

<details>
	<summary><strong>Source Code</strong></summary>

```javascript
function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address-functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) {
            // Return data is optional
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
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
