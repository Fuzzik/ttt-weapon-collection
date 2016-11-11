AddCSLuaFile()

if CLIENT then
   SWEP.PrintName = "Pump Shotgun"
   SWEP.Slot = 2
   SWEP.Icon = "vgui/ttt/icon_pump"
   SWEP.IconLetter = "k"
end

SWEP.Base = "weapon_tttbase"
SWEP.HoldType = "shotgun"

SWEP.Primary.Ammo = "Buckshot"
SWEP.Primary.Delay = 1.2
SWEP.Primary.Recoil = 7
SWEP.Primary.Cone = 0.08
SWEP.Primary.Damage = 14
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 8
SWEP.Primary.ClipMax = 24
SWEP.Primary.DefaultClip = 8
SWEP.Primary.Sound = Sound( "Weapon_M3.Single" )
SWEP.Primary.NumShots = 8

SWEP.UseHands = true
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 58
SWEP.ViewModel = Model( "models/weapons/cstrike/c_shot_m3super90.mdl" )
SWEP.WorldModel = Model( "models/weapons/w_shot_m3super90.mdl" )

SWEP.IronSightsPos = Vector( -7.67, -12.86, 3.371 )
SWEP.IronSightsAng = Vector( 0.637, 0.01, -1.458 )

SWEP.Kind = WEAPON_HEAVY
SWEP.AutoSpawnable = true
SWEP.AmmoEnt = "item_box_buckshot_ttt"
SWEP.InLoadoutFor = { nil }
SWEP.AllowDrop = true
SWEP.IsSilent = false
SWEP.NoSights = false

SWEP.reloadtimer = 0

function SWEP:SetupDataTables()
   self:DTVar( "Bool", 0, "reloading" )

   return self.BaseClass.SetupDataTables( self )
end

function SWEP:Reload()
   if self.dt.reloading then return end

   if not IsFirstTimePredicted() then return end

   if self:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 then

      if self:StartReload() then
         return
      end
   end
end

function SWEP:StartReload()
   if self.dt.reloading then
      return false
   end

   self:SetIronsights( false )

   if not IsFirstTimePredicted() then return false end

   self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

   local ply = self.Owner

   if not ply or ply:GetAmmoCount( self.Primary.Ammo ) <= 0 then 
      return false
   end

   local wep = self

   if wep:Clip1() >= self.Primary.ClipSize then 
      return false 
   end

   wep:SendWeaponAnim( ACT_SHOTGUN_RELOAD_START )

   self.reloadtimer =  CurTime() + wep:SequenceDuration()

   self.dt.reloading = true

   return true
end

function SWEP:PerformReload()
   local ply = self.Owner

   self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

   if not ply or ply:GetAmmoCount( self.Primary.Ammo ) <= 0 then return end

   if self:Clip1() >= self.Primary.ClipSize then return end

   self.Owner:RemoveAmmo( 1, self.Primary.Ammo, false )
   self:SetClip1( self:Clip1() + 1 )

   self:SendWeaponAnim( ACT_VM_RELOAD )

   self.reloadtimer = CurTime() + self:SequenceDuration()
end

function SWEP:FinishReload()
   self.dt.reloading = false
   self:SendWeaponAnim( ACT_SHOTGUN_RELOAD_FINISH )

   self.reloadtimer = CurTime() + self:SequenceDuration()
end

function SWEP:CanPrimaryAttack()
   if self:Clip1() <= 0 then
      self:EmitSound( "Weapon_Shotgun.Empty" )
      self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
      return false
   end
   return true
end

function SWEP:Think()
   if self.dt.reloading and IsFirstTimePredicted() then
      if self.Owner:KeyDown( IN_ATTACK ) then
         self:FinishReload()
         return
      end

      if self.reloadtimer <= CurTime() then

         if self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0 then
            self:FinishReload()
         elseif self:Clip1() < self.Primary.ClipSize then
            self:PerformReload()
         else
            self:FinishReload()
         end
         return            
      end
   end
end

function SWEP:Deploy()
   self.dt.reloading = false
   self.reloadtimer = 0
   return self.BaseClass.Deploy( self )
end

function SWEP:GetHeadshotMultiplier( victim, dmginfo )
   local att = dmginfo:GetAttacker()
   if not IsValid( att ) then return 3 end

   local dist = victim:GetPos():Distance( att:GetPos() )
   local d = math.max( 0, dist - 140 )

   return 1 + math.max( 0, ( 2.1 - 0.002 * ( d ^ 1.25 ) ) )
end

function SWEP:SecondaryAttack()
   if self.NoSights or ( not self.IronSightsPos ) or self.dt.reloading then return end

   self:SetIronsights( not self:GetIronsights() )

   self:SetNextSecondaryFire( CurTime() + 0.3 )
end
