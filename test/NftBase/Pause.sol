// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "../base/Spec.sol";

contract Pause is Spec {
  function testPauseUnauthorized() external {
    address sender = address(3);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    vm.startPrank(address(1));
    vm.expectRevert("Access denied");
    nft.pause();

    vm.stopPrank();
  }

  function testPause() external {
    address sender = address(1);

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness
    require(nft.paused() == false, "Invalid pause state");

    nft.grantRole(nft.NS_ROLES_PAUSER(), sender);

    nft.pause();

    require(nft.paused() == true, "Invalid pause state");

    vm.stopPrank();
  }

  function testPauseIncorrectInvocation() external {
    address sender = address(1);

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    nft.grantRole(nft.NS_ROLES_PAUSER(), sender);
    nft.pause();

    require(nft.paused() == true, "Invalid pause state");

    vm.expectRevert("Pausable: paused");
    nft.pause();

    vm.stopPrank();
  }
}
