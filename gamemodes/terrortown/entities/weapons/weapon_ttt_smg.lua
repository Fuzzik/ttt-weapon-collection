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
SWEP.Primary.Sound = Sound("Weapon_SMG1.Single")

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 56
SWEP.ViewModel = Model("models/weapons/c_smg1.mdl")
SWEP.WorldModel = Model("models/weapons/w_smg1.mdl")

SWEP.IronSightsPos = Vector(-6.39, -3.32, 1.05)

SWEP.Kind = WEAPON_HEAVY
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
    self:EmitSound("Weapon_SMG1.Reload") -- My added line
    self:SetIronsights(false)
end
