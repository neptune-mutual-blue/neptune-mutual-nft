// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "../base/Spec.sol";

contract ResetTokenRoyalty is Spec {
  function testResetTokenRoyaltyUnauthorized() external {
    address sender = address(1);

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    vm.expectRevert("Access denied");
    nft.resetTokenRoyalty(1);

    vm.stopPrank();
  }

  function testResetTokenRoyalty(uint96 feeNumerator) external {
    vm.assume(feeNumerator > 0 && feeNumerator < 10_000);

    address sender = address(1);
    address receiver = address(2);

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    nft.grantRole(nft.NS_ROLES_ROYALTY_ADMIN(), sender);

    nft.setDefaultRoyalty(address(1), 1000);
    nft.setTokenRoyalty(1, receiver, feeNumerator);

    (address royaltyReceiver, uint256 royalty) = nft.royaltyInfo(1, 1_000_000);

    require(royaltyReceiver == receiver, "Incorrect royalty receiver");
    require(royalty == (1_000_000 * feeNumerator) / 10_000, "Incorrect royalty");

    nft.resetTokenRoyalty(1);
    (royaltyReceiver, royalty) = nft.royaltyInfo(1, 1_000_000);

    require(royaltyReceiver == address(1), "Incorrect royalty receiver");
    require(royalty == (1_000_000 * 1000) / 10_000, "Incorrect royalty");

    vm.stopPrank();
  }
}
