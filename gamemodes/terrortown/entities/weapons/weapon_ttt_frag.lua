AddCSLuaFile()

if CLIENT then
   SWEP.PrintName = "Frag Grenade"
   SWEP.Slot = 3
   SWEP.Icon = "vgui/ttt/icon_nades"
end

-- Always derive from weapon_tttbase
SWEP.Base = "weapon_tttbasegrenade"

-- Standard GMod values
SWEP.HoldType = "grenade"
SWEP.Weight	= 5

-- Model settings
SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 54
SWEP.ViewModel = "models/weapons/cstrike/c_eq_fraggrenade.mdl"
SWEP.WorldModel	= "models/weapons/w_eq_fraggrenade.mdl"

--- TTT config values

-- Kind specifies the category this weapon is in. Players can only carry one of
-- each. Can be: WEAPON_... MELEE, PISTOL, HEAVY, NADE, CARRY, EQUIP1, EQUIP2 or ROLE.
-- Matching SWEP.Slot values: 0      1       2     3      4      6       7        8
SWEP.Kind = WEAPON_NADE
   
-- If AutoSpawnable is true and SWEP.Kind is not WEAPON_EQUIP1/2, then this gun can
-- be spawned as a random weapon.
SWEP.AutoSpawnable = false

-- CanBuy is a table of ROLE_* entries like ROLE_TRAITOR and ROLE_DETECTIVE. If
-- a role is in this table, those players can buy this.
SWEP.CanBuy = { ROLE_TRAITOR }

-- InLoadoutFor is a table of ROLE_* entries that specifies which roles should
-- receive this weapon as soon as the round starts. In this case, none.
SWEP.InLoadoutFor = { nil }

-- If LimitedStock is true, you can only buy one per round.
SWEP.LimitedStock = true

-- If AllowDrop is false, players can't manually drop the gun with Q
SWEP.AllowDrop = true

-- If NoSights is true, the weapon won't have ironsights
SWEP.NoSights = true

SWEP.EquipMenuData = {
   type = "Frag Grenade",
   desc = "A highly explosive grenade."
};

function SWEP:GetGrenadeName()
   return "ttt_frag_proj"
end
