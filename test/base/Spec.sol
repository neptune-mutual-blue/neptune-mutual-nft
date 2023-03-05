// Neptune Mutual Protocol (https://neptunemutual.com)
// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "../../src/NeptuneMutualNft.sol";

contract Spec is Test {
  function isContract(address toCheck) internal view returns (bool) {
    uint32 size;

    assembly {
      size := extcodesize(toCheck)
    }

    return (size > 0);
  }
}
