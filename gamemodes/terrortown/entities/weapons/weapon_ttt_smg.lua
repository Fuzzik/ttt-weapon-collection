AddCSLuaFile()

if CLIENT then
   SWEP.PrintName = "MP7"
   SWEP.Slot = 2
   SWEP.Icon = "vgui/ttt/icon_smg"
   SWEP.IconLetter = "d"
end

SWEP.Base = "weapon_tttbase"
SWEP.HoldType = "smg"

SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.Delay = 0.07
SWEP.Primary.Recoil = 0.5
SWEP.Primary.Cone = 0.026
SWEP.Primary.Damage = 15
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 30
SWEP.Primary.ClipMax = 60
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Sound = Sound( "Weapon_SMG1.Single" )

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 56
SWEP.ViewModel = Model( "models/weapons/c_smg1.mdl" )
SWEP.WorldModel = Model( "models/weapons/w_smg1.mdl" )

SWEP.IronSightsPos = Vector( -6.39, -3.32, 1.05 )

SWEP.Kind = WEAPON_HEAVY

if GetConVar( "fuzzik_disable_mp7" ):GetString() == "0" then -- Disable if convar != 0
	SWEP.AutoSpawnable = true
end

SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.InLoadoutFor = { nil }
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
