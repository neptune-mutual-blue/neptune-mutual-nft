// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "../base/Spec.sol";

contract Transfer is Spec {
  function testSoulboundTransfer(uint256 tokenId, bytes calldata data) external {
    vm.assume(tokenId > 1);

    address sender = address(1);
    address recipient = address(3);

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    nft.mint(sender, 1, false, data);
    nft.mint(sender, tokenId, true, data);

    require(nft.isSoulbound(tokenId) == true, "Token not soulbound");

    // Since this is a regular NFT and not soulbound, it shouldn't revert
    nft.safeTransferFrom(sender, recipient, 1, 1, data);

    vm.expectRevert("Error: soulbound");
    nft.safeTransferFrom(sender, recipient, tokenId, 1, data);

    vm.stopPrank();
  }
}
