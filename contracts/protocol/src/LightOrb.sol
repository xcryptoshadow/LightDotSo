// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import { UUPSUpgradeable } from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import { ERC721Upgradeable } from "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import { AccessControlUpgradeable } from "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import { LightOrbStorage } from "./storages/LightOrbStorage.sol";

/// @title NFT contract for the Light protocol.
/// @title Responsible for managing the rendering of the NFTs.
/// @author Shun Kakinoki
contract LightOrb is
  Initializable,
  OwnableUpgradeable,
  UUPSUpgradeable,
  ERC721Upgradeable,
  AccessControlUpgradeable,
  LightOrbStorage
{
  /// @custom:oz-upgrades-unsafe-allow constructor
  constructor() {
    _disableInitializers();
  }

  function initialize(string calldata name_, string calldata symbol_)
    external
    reinitializer(2)
  {
    __Ownable_init();
    __UUPSUpgradeable_init();
    __ERC721_init(name_, symbol_);
  }

  function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(ERC721Upgradeable, AccessControlUpgradeable)
    returns (bool)
  {
    return
      interfaceId == 0x01ffc9a7 || // ERC165 Interface ID for ERC165
      interfaceId == 0x80ac58cd || // ERC165 Interface ID for ERC721
      interfaceId == 0x5b5e139f; // ERC165 Interface ID for ERC721Metadata
  }

  function _authorizeUpgrade(address) internal override onlyOwner {}
}