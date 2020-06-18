AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "AK47"
    SWEP.Slot = 6
    SWEP.Icon = "vgui/ttt/icon_ak47"
    SWEP.IconLetter = "b"
end

SWEP.Base = "weapon_tttbase"
SWEP.HoldType = "ar2"

SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Delay = 0.1
SWEP.Primary.Recoil = 1.7
SWEP.Primary.Cone = 0.025
SWEP.Primary.Damage = 24
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 30
SWEP.Primary.ClipMax = 60
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Sound = Sound("Weapon_AK47.Single")

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 50
SWEP.ViewModel = Model("models/weapons/cstrike/c_rif_ak47.mdl")
SWEP.WorldModel = Model("models/weapons/w_rif_ak47.mdl")

SWEP.IronSightsPos = Vector(-6.518, -4.646, 2.134)
SWEP.IronSightsAng = Vector(2.737, 0.158, 0)

SWEP.Kind = WEAPON_EQUIP1
SWEP.AutoSpawnable = false
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
SWEP.CanBuy = {ROLE_TRAITOR}
SWEP.InLoadoutFor = {nil}
SWEP.LimitedStock = true
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false

if CLIENT then
    SWEP.EquipMenuData = {
        type = "Weapon",
        desc = "Assault rifle with very high damage.\n\nHas very high recoil."
    }
end
