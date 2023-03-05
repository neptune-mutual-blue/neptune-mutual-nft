// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "./base/Spec.sol";

contract State is Spec {
  /**
   * @dev must correctly set the state
   */
  function testState() external {
    address sender = address(1);

    vm.startPrank(sender);

    bytes4 fakeInterface = "foo";
    string memory uri = "https://neptunemutual.com/";
    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, uri);

    require(keccak256(abi.encodePacked(nft.uri(2))) == keccak256(abi.encodePacked("https://neptunemutual.com/2.json")), "Invalid URI");

    require(nft.feeDenominator() == 10_000, "Invalid fee denominator");

    require(nft.supportsInterface(type(IAccessControl).interfaceId), "IAccessControl not supported");
    require(nft.supportsInterface(type(IERC1155).interfaceId), "IERC1155 not supported");
    require(nft.supportsInterface(type(IERC1155MetadataURI).interfaceId), "IERC1155MetadataURI not supported");
    require(nft.supportsInterface(type(IERC2981).interfaceId), "IERC2981 not supported");
    require(nft.supportsInterface(fakeInterface) == false, "Fake interface should not be supported");

    vm.stopPrank();
  }
}
