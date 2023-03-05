// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "../base/Spec.sol";

contract Unpause is Spec {
  function testUnpauseUnauthorized() external {
    address sender = address(3);

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    nft.grantRole(nft.NS_ROLES_PAUSER(), sender);

    nft.pause();
    vm.stopPrank();

    // ---------------------------------

    vm.assume(msg.sender != sender);

    vm.expectRevert("Access denied");
    nft.unpause();
  }

  function testUnpause() external {
    address sender = address(1);
    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness
    nft.grantRole(nft.NS_ROLES_PAUSER(), sender);

    require(nft.paused() == false, "Invalid pause state");

    nft.pause();
    require(nft.paused() == true, "Invalid pause state");

    nft.unpause();
    require(nft.paused() == false, "Invalid pause state");

    vm.stopPrank();
  }

  function testUnpauseIncorrectInvocation() external {
    address sender = address(1);

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    nft.grantRole(nft.NS_ROLES_PAUSER(), sender);

    nft.pause();
    require(nft.paused() == true, "Invalid pause state");

    nft.unpause();
    require(nft.paused() == false, "Invalid pause state");

    vm.expectRevert("Pausable: not paused");
    nft.unpause();

    vm.stopPrank();
  }
}
