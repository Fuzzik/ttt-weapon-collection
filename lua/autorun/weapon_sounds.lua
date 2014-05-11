// This lets weapon_ttt_revolver call Weapon_DetRev.Single as its primary fire sound.

sound.Add({
   name = "Weapon_DetRev.Single",
   channel = CHAN_USER_BASE+10,
   volume = 1.0,
   sound = "weapons/det_revolver/revolver-fire.wav"
})
