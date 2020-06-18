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
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.InLoadoutFor = {nil}
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false

-- Redefine weapon_tttbase's SWEP:Reload() here with one extra line to explicitly emit a
-- reload sound. HL2 weapon models need this because the instruction to emit this sound is not
-- baked into the models unlike with CS:S weapon models. Keep in mind that updates to
-- weapon_tttbase's SWEP:Reload() might break this code and should be pulled from
-- Facepunch/garrysmod if made.
function SWEP:Reload()
    if (self:Clip1() == self.Primary.ClipSize or self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0) then return end
    self:DefaultReload(self.ReloadAnim)
    self:EmitSound("Weapon_Pistol.Reload") -- My added line
    self:SetIronsights(false)
end
