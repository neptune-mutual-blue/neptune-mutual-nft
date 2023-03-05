// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "../base/Spec.sol";

contract MintBatch is Spec {
  function testMintBatchUnauthorized(bytes calldata data) external {
    uint256[] memory ids = new uint256[](2);
    uint256[] memory amounts = new uint256[](2);

    for (uint256 i = 0; i < amounts.length; i++) {
      ids[i] = i + 1;
      amounts[i] = 1;
    }

    address sender = address(3);
    address receiver = address(2);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    vm.startPrank(address(1));
    vm.expectRevert("Access denied");
    nft.mintBatch(receiver, ids, amounts, data);

    vm.stopPrank();
  }

  function testMintBatch(bytes calldata data) external {
    address sender = address(1);
    address receiver = address(2);

    uint256[] memory ids = new uint256[](2);
    uint256[] memory amounts = new uint256[](2);

    for (uint256 i = 0; i < amounts.length; i++) {
      ids[i] = i + 1;
      amounts[i] = 1;
    }

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness
    nft.grantRole(nft.NS_ROLES_MINTER(), sender);

    nft.mintBatch(receiver, ids, amounts, data);

    vm.stopPrank();
  }

  function testMintBatchInvalidAmount(bytes calldata data) external {
    address sender = address(1);
    address receiver = address(2);

    uint256[] memory ids = new uint256[](2);
    uint256[] memory amounts = new uint256[](2);

    for (uint256 i = 0; i < amounts.length; i++) {
      ids[i] = i + 1;
      amounts[i] = 0;
    }

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness
    nft.grantRole(nft.NS_ROLES_MINTER(), sender);

    vm.expectRevert("Invalid amount");
    nft.mintBatch(receiver, ids, amounts, data);

    vm.stopPrank();
  }

  function testMintBatchDuplicate(bytes calldata data) external {
    address sender = address(1);
    address receiver = address(2);

    uint256[] memory ids = new uint256[](2);
    uint256[] memory amounts = new uint256[](2);

    for (uint256 i = 0; i < amounts.length; i++) {
      ids[i] = i + 1;
      amounts[i] = 1;
    }

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness
    nft.grantRole(nft.NS_ROLES_MINTER(), sender);

    nft.mintBatch(receiver, ids, amounts, data);

    vm.expectRevert("Duplicate id");
    nft.mintBatch(receiver, ids, amounts, data);

    vm.stopPrank();
  }
}
