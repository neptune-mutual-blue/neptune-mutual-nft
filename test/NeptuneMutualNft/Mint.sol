// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "../base/Spec.sol";

contract Mint is Spec {
  function testMintUnauthorized(bytes calldata data) external {
    address sender = address(3);
    address receiver = address(2);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    vm.startPrank(address(1));
    vm.expectRevert("Access denied");
    nft.mint(receiver, 1, false, data);

    vm.stopPrank();
  }

  function testMint(uint256 tokenId, bool soulbound, bytes calldata data) external {
    address sender = address(1);
    address receiver = address(2);

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness
    nft.grantRole(nft.NS_ROLES_MINTER(), sender);

    nft.mint(receiver, tokenId, soulbound, data);

    vm.stopPrank();
  }

  function testMintDuplicate(uint256 tokenId, bool soulbound, bytes calldata data) external {
    address receiver = address(2);

    address sender = address(1);
    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness
    nft.grantRole(nft.NS_ROLES_MINTER(), sender);

    nft.mint(receiver, tokenId, soulbound, data);

    vm.expectRevert("Duplicate id");
    nft.mint(receiver, tokenId, soulbound, data);

    vm.stopPrank();
  }
}
