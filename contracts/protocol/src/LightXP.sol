// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.16;

import { ILightXP } from "@lightdotso/protocol/interfaces/ILightXP.sol";
import { LightXPStorageV1 } from "@lightdotso/protocol/storages/LightXPStorage.sol";
import { OwnableUpgradeable } from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import { Initializable } from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import { UUPSUpgradeable } from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import { PausableUpgradeable } from "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import { ERC20Upgradeable } from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import { ERC20PermitUpgradeable } from "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-ERC20PermitUpgradeable.sol";

/// @title `XP` contract for the Light protocol.
/// @title Responsible for managing repuation of a corresponding space.
/// @author Shun Kakinoki
contract LightXP is
  Initializable,
  OwnableUpgradeable,
  UUPSUpgradeable,
  PausableUpgradeable,
  ERC20Upgradeable,
  ERC20PermitUpgradeable,
  LightXPStorageV1,
  ILightXP
{
  /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
  /*                       UPGRADEABLE                          */
  /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

  /// @custom:oz-upgrades-unsafe-allow constructor
  constructor() {
    _disableInitializers();
  }

  function initialize(string calldata _name, string calldata _symbol)
    external
    override
    reinitializer(2)
  {
    __Ownable_init();
    __UUPSUpgradeable_init();
    __Pausable_init();

    __ERC20_init(_name, _symbol);
    __ERC20Permit_init(_name);
  }

  function _authorizeUpgrade(address) internal override onlyOwner {}
}
