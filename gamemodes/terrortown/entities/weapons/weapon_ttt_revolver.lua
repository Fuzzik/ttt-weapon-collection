AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "S&W 500"
    SWEP.Slot = 6
    SWEP.Icon = "vgui/ttt/icon_revolver"
    SWEP.IconLetter = "f"
end

SWEP.Base = "weapon_tttbase"
SWEP.HoldType = "pistol"

SWEP.Primary.Ammo = "none"
SWEP.Primary.Delay = 2
SWEP.Primary.Recoil = 0.8
SWEP.Primary.Cone = 0.0325
SWEP.Primary.Damage = 500
SWEP.Primary.Automatic = false
SWEP.Primary.ClipSize = 1
SWEP.Primary.ClipMax = 1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Sound = Sound("Weapon_DetRev.Single")

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 54
SWEP.ViewModel = Model("models/weapons/c_357.mdl")
SWEP.WorldModel = Model("models/weapons/w_357.mdl")

SWEP.IronSightsPos = Vector (-4.64, -3.96, 0.68)
SWEP.IronSightsAng = Vector (0.214, -0.1767, 0)

SWEP.Kind = WEAPON_EQUIP1
SWEP.AutoSpawnable = false
SWEP.AmmoEnt = "none"
SWEP.CanBuy = {ROLE_DETECTIVE}
SWEP.InLoadoutFor = {nil}
SWEP.LimitedStock = true
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false

function SWEP:Precache()
    util.PrecacheSound("weapons/det_revolver/revolver-fire.wav")
end

sound.Add ({
    name = "Weapon_DetRev.Single",
    channel = CHAN_USER_BASE + 10,
    volume = 1.0,
    sound = "weapons/det_revolver/revolver-fire.wav"
})

-- Redefine weapon_tttbase's SWEP:Reload() here with one extra line to explicitly emit a
-- reload sound. HL2 weapon models need this because the instruction to emit this sound is not
-- baked into the models unlike with CS:S weapon models. Keep in mind that updates to
-- weapon_tttbase's SWEP:Reload() might break this code and should be pulled from
-- Facepunch/garrysmod if made.
function SWEP:Reload()
    if (self:Clip1() == self.Primary.ClipSize or self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0) then return end
    self:DefaultReload(self.ReloadAnim)
    self:EmitSound("Weapon_357.Reload") -- My added line
    self:SetIronsights(false)
end

if CLIENT then
    SWEP.EquipMenuData = {
        type = "Weapon",
        desc = "Eliminate any terrorist in one shot."
    }
end
