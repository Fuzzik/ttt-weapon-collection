AddCSLuaFile()

if CLIENT then
    SWEP.PrintName = "FN P90"
    SWEP.Slot = 6
    SWEP.Icon = "vgui/ttt/icon_p90"
    SWEP.IconLetter = "m"
end

SWEP.Base = "weapon_tttbase"
SWEP.HoldType = "smg"

SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Delay = 0.065
SWEP.Primary.Recoil = 0.8
SWEP.Primary.Cone = 0.032
SWEP.Primary.Damage = 14
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 50
SWEP.Primary.ClipMax = 100
SWEP.Primary.DefaultClip = 50
SWEP.Primary.Sound = Sound("Weapon_P90.Single")
SWEP.Secondary.Sound = Sound("Default.Zoom")

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 60
SWEP.ViewModel = Model("models/weapons/cstrike/c_smg_p90.mdl")
SWEP.WorldModel = Model("models/weapons/w_smg_p90.mdl")

SWEP.IronSightsPos = Vector(5, -15, -2)
SWEP.IronSightsAng = Vector(2.6, 1.37, 3.5)

SWEP.Kind = WEAPON_EQUIP1
SWEP.AutoSpawnable = false
SWEP.AmmoEnt = "item_ammo_smg1_ttt"
SWEP.CanBuy = {ROLE_DETECTIVE}
SWEP.InLoadoutFor = {nil}
SWEP.LimitedStock = true
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false

function SWEP:SetZoom(state)
    if IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() then
        if state then
            self:GetOwner():SetFOV(20, 0.3)
        else
            self:GetOwner():SetFOV(0, 0.2)
        end
    end
end

function SWEP:PrimaryAttack(worldsnd)
    self.BaseClass.PrimaryAttack(self.Weapon, worldsnd)
    self:SetNextSecondaryFire(CurTime() + 0.1)
end

-- Add some zoom to ironsights for this gun
function SWEP:SecondaryAttack()
    if not self.IronSightsPos then return end
    if self:GetNextSecondaryFire() > CurTime() then return end
    
    local bIronsights = not self:GetIronsights()
    
    self:SetIronsights(bIronsights)
    
    self:SetZoom(bIronsights)
    
    if (CLIENT) then
        self:EmitSound(self.Secondary.Sound)
    end
    
    self:SetNextSecondaryFire(CurTime() + 0.3)
end

function SWEP:PreDrop()
    self:SetZoom(false)
    self:SetIronsights(false)
    return self.BaseClass.PreDrop(self)
end

function SWEP:Reload()
    if (self:Clip1() == self.Primary.ClipSize or self:GetOwner():GetAmmoCount(self.Primary.Ammo) <= 0) then return end
    self:DefaultReload(ACT_VM_RELOAD)
    self:SetIronsights(false)
    self:SetZoom(false)
end

function SWEP:Holster()
    self:SetIronsights(false)
    self:SetZoom(false)
    return true
end

if CLIENT then
    local scope = surface.GetTextureID("sprites/scope")
    function SWEP:DrawHUD()
        if self:GetIronsights() then
            surface.SetDrawColor(0, 0, 0, 255)
            
            local scrW = ScrW()
            local scrH = ScrH()
            
            local x = scrW / 2.0
            local y = scrH / 2.0
            local scope_size = scrH
            
            -- Crosshair
            local gap = 80
            local length = scope_size
            surface.DrawLine(x - length, y, x - gap, y)
            surface.DrawLine(x + length, y, x + gap, y)
            surface.DrawLine(x, y - length, x, y - gap)
            surface.DrawLine(x, y + length, x, y + gap)
            
            gap = 0
            length = 50
            surface.DrawLine(x - length, y, x - gap, y)
            surface.DrawLine(x + length, y, x + gap, y)
            surface.DrawLine(x, y - length, x, y - gap)
            surface.DrawLine(x, y + length, x, y + gap)
            
            -- Cover edges
            local sh = scope_size / 2
            local w = (x - sh) + 2
            surface.DrawRect(0, 0, w, scope_size)
            surface.DrawRect(x + sh - 2, 0, w, scope_size)
            
            -- Cover gaps on top and bottom of screen
            surface.DrawLine(0, 0, scrW, 0)
            surface.DrawLine(0, scrH - 1, scrW, scrH - 1)
            
            surface.SetDrawColor(255, 0, 0, 255)
            surface.DrawLine(x, y, x + 1, y + 1)
            
            -- Scope
            surface.SetTexture(scope)
            surface.SetDrawColor(255, 255, 255, 255)
            
            surface.DrawTexturedRectRotated(x, y, scope_size, scope_size, 0)
        else
            return self.BaseClass.DrawHUD(self)
        end
    end
    
    function SWEP:AdjustMouseSensitivity()
        return (self:GetIronsights() and 0.2) or nil
    end
end

if CLIENT then
    SWEP.EquipMenuData = {
        type = "Weapon",
        desc = "Extremely fast firing SMG.\n\nComes with a mounted scope."
    }
end
