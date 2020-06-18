AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "Silent Fox"
    SWEP.Slot = 6
    SWEP.Icon = "vgui/ttt/icon_tmp"
    SWEP.IconLetter = "d"
end

SWEP.Base = "weapon_tttbase"
SWEP.HoldType = "ar2"

SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.Delay = 0.07
SWEP.Primary.Recoil = 1.2
SWEP.Primary.Cone = 0.025
SWEP.Primary.Damage = 16
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 30
SWEP.Primary.ClipMax = 60
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Sound = Sound("Weapon_TMP.Single")

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 64
SWEP.ViewModel = Model("models/weapons/cstrike/c_smg_tmp.mdl")
SWEP.WorldModel = Model("models/weapons/w_smg_tmp.mdl")

SWEP.IronSightsPos = Vector (-6.896, -2.822, 2.134)
SWEP.IronSightsAng = Vector (2.253, 0.209, 0.07)

SWEP.Kind = WEAPON_EQUIP1
SWEP.AutoSpawnable = false
SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.CanBuy = {ROLE_TRAITOR}
SWEP.InLoadoutFor = {nil}
SWEP.LimitedStock = true
SWEP.AllowDrop = true
SWEP.IsSilent = true
SWEP.NoSights = false

if CLIENT then
    SWEP.EquipMenuData = {
        type = "Weapon",
        desc = "Low-noise SMG that uses normal 9mm ammo.\n\nVictims will not scream when killed."
    }
end
