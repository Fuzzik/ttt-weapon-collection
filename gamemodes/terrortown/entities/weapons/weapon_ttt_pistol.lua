AddCSLuaFile()

if CLIENT then
	SWEP.PrintName = "USP"
	SWEP.Slot = 1
	SWEP.Icon = "vgui/ttt/icon_hl2_pistol"
	SWEP.IconLetter = "a"
end

SWEP.Base = "weapon_tttbase"
SWEP.HoldType = "pistol"

SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.Delay = 0.15
SWEP.Primary.Recoil = 0.8
SWEP.Primary.Cone = 0.025
SWEP.Primary.Damage = 12
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 20
SWEP.Primary.ClipMax = 60
SWEP.Primary.DefaultClip = 20
SWEP.Primary.Sound = Sound("Weapon_Pistol.Single")

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 54
SWEP.ViewModel = Model("models/weapons/c_pistol.mdl")
SWEP.WorldModel = Model("models/weapons/w_pistol.mdl")

SWEP.IronSightsPos = Vector(-5.761, -8.898, 3.119)
SWEP.IronSightsAng = Vector(0.275, -1, 0)

SWEP.Kind = WEAPON_PISTOL

if GetConVar("fuzzik_disable_usp"):GetString() == "0" then -- Disable if convar != 0
	SWEP.AutoSpawnable = true
end

SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
