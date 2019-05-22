include( "autorun/server/create_convars.lua" )

AddCSLuaFile()

if CLIENT then
   SWEP.PrintName = "Frag grenade"
   SWEP.Slot = 3
   SWEP.Icon = "vgui/ttt/icon_nades"
   SWEP.IconLetter = "O"
end

SWEP.Base = "weapon_tttbasegrenade"
SWEP.HoldType = "grenade"

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 54
SWEP.ViewModel = Model( "models/weapons/cstrike/c_eq_fraggrenade.mdl" )
SWEP.WorldModel = Model( "models/weapons/w_eq_fraggrenade.mdl" )

SWEP.Kind = WEAPON_NADE
SWEP.AutoSpawnable = false

if ( fuzzik_disable_frag == "0" ) then -- Disable if convar != 0
	SWEP.CanBuy = { ROLE_TRAITOR }
end

SWEP.InLoadoutFor = { nil }
SWEP.LimitedStock = true
SWEP.AllowDrop = true
SWEP.NoSights = true

function SWEP:GetGrenadeName()
   return "ttt_frag_proj"
end

if CLIENT then
   SWEP.EquipMenuData = {
      type = "Grenade",
      desc = "A highly explosive grenade."
   }
end
