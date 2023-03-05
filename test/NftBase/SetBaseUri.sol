// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "../base/Spec.sol";

contract SetBaseUri is Spec {
  function testSetBaseUriUnauthorized() external {
    address sender = address(3);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    vm.startPrank(address(1));
    vm.expectRevert("Access denied");
    nft.setBaseUri("https://nft.neptunemutual.net");

    vm.stopPrank();
  }

  function testSetBaseUriInvalidValue() external {
    address sender = address(1);

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    vm.expectRevert("Invalid Base URI");
    nft.setBaseUri("");
    vm.stopPrank();
  }

  function testSetBaseUri() external {
    address sender = address(1);

    vm.startPrank(sender);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    // Verify correctness

    string memory uri = nft.uri(1);

    require(keccak256(abi.encodePacked(uri)) == keccak256(abi.encodePacked("https://neptunemutual.com/1.json")), "Incorrect URI");

    // Change the base URI

    nft.setBaseUri("https://nft.neptunemutual.net/");

    uri = nft.uri(1);

    require(keccak256(abi.encodePacked(uri)) == keccak256(abi.encodePacked("https://nft.neptunemutual.net/1.json")), "Incorrect URI");

    vm.stopPrank();
  }
}
