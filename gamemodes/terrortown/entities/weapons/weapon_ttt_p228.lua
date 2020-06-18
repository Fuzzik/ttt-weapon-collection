AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "P228"
    SWEP.Slot = 1
    SWEP.Icon = "vgui/ttt/icon_glock"
    SWEP.IconLetter = "y"
end

SWEP.Base = "weapon_tttbase"
SWEP.HoldType = "pistol"

SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.Delay = 0.25
SWEP.Primary.Recoil = 0.9
SWEP.Primary.Cone = 0.028
SWEP.Primary.Damage = 15
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 20
SWEP.Primary.ClipMax = 60
SWEP.Primary.DefaultClip = 20
SWEP.Primary.Sound = Sound("Weapon_P228.Single")

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 54
SWEP.ViewModel = Model("models/weapons/cstrike/c_pist_p228.mdl")
SWEP.WorldModel = Model("models/weapons/w_pist_p228.mdl")

SWEP.IronSightsPos = Vector(-5.961, -9.214, 2.839)

SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false
