// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "../base/Spec.sol";

contract MintMany is Spec {
  function testMintManyUnauthorized(bool soulbound, bytes calldata data) external {
    address sender = address(3);
    address[] memory accounts = new address[](100);
    uint256[] memory ids = new uint256[](100);

    for (uint256 i = 0; i < accounts.length; i++) {
      ids[i] = i + 1;
      accounts[i] = address(uint160(i + 10));
    }

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    vm.startPrank(address(1));
    vm.expectRevert("Access denied");
    nft.mintMany(accounts, ids, soulbound, data);

    vm.stopPrank();
  }

  function testMintMany(bytes calldata data) external {
    address sender = address(1);

    address[] memory accounts = new address[](100);
    uint256[] memory ids = new uint256[](100);

    for (uint256 i = 0; i < accounts.length; i++) {
      ids[i] = i + 1;
      accounts[i] = address(uint160(i + 10));
    }

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness
    nft.grantRole(nft.NS_ROLES_MINTER(), sender);

    nft.mintMany(accounts, ids, false, data);

    vm.stopPrank();
  }

  function testMintManySoulbound(bytes calldata data) external {
    address sender = address(1);

    address[] memory accounts = new address[](100);
    uint256[] memory ids = new uint256[](100);

    for (uint256 i = 0; i < accounts.length; i++) {
      ids[i] = i + 1;
      accounts[i] = address(uint160(i + 10));
    }

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness
    nft.grantRole(nft.NS_ROLES_MINTER(), sender);

    nft.mintMany(accounts, ids, true, data);

    vm.stopPrank();
  }

  function testMintManyDuplicate(bool soulbound, bytes calldata data) external {
    address sender = address(1);

    address[] memory accounts = new address[](100);
    uint256[] memory ids = new uint256[](100);

    for (uint256 i = 0; i < accounts.length; i++) {
      ids[i] = i + 1;
      accounts[i] = address(uint160(i + 10));
    }

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness
    nft.grantRole(nft.NS_ROLES_MINTER(), sender);

    nft.mintMany(accounts, ids, soulbound, data);

    vm.expectRevert("Duplicate id");
    nft.mintMany(accounts, ids, soulbound, data);

    vm.stopPrank();
  }
}
