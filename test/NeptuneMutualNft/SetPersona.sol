// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "../base/Spec.sol";

contract SetPersona is Spec {
  function testSetPersonaInvalid(uint8 persona) external {
    vm.assume(persona != 1 && persona != 2);

    address sender = address(3);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    vm.expectRevert("Error: invalid persona");
    nft.setPersona(persona);
  }

  function testSetPersona(uint8 persona) external {
    vm.assume(persona == 1 || persona == 2);

    address sender = address(1);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    nft.setPersona(persona);
  }

  function testSetPersonaTwice(uint8 persona) external {
    vm.assume(persona == 1 || persona == 2);

    address sender = address(1);

    NeptuneMutualNft nft = new NeptuneMutualNft(sender, sender, "https://neptunemutual.com/");

    nft.setPersona(persona);

    vm.expectRevert("Error: already set");
    nft.setPersona(persona);
  }
}
