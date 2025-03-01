-- startup.lua
-- This script is run by the reactors in Mileth Inn when an Aisling first logs in.

-- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  Script
-- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

startup = {
  "You awaken with a start, your voice caught in your throat.\nSurely you could not have seen what you could swear to the gods you had seen.",
  "This was like no sleep as you had experienced before, there were images both wonderful and terrible, could this have been a dream?",
  "You recall the embrace of an inferno, the visage of damnation himself, a glorious battle with glittering armors, fields of the dead, heroes, magic, enchanting light...",
  "As quickly as you recall the dream, it dances away again. The world spins as you stand, and you find yourself in a strange room.",
  "You should probably seek answers. Right after you put on your clothes, of course. ((Double click your shirt or blouse))"
}

-- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  "OnSpawn"
-- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

function OnSpawn()
  -- -- -- -- --

  start1 = world.NewDialogSequence("startup_dialog1",
    world.NewDialog(startup[1]),
    world.NewDialog(startup[2]),
    world.NewDialog(startup[3]),
    world.NewFunctionDialog("wakeup_effect()"))

  start2 = world.NewDialogSequence("startup_dialog2",
    world.NewDialog(startup[4]),
    world.NewDialog(startup[5]),
    world.NewFunctionDialog("wakeup_giveitems()"))

  start1.SetNpcDisplaySprite(3)
  origin.RegisterSequence(start1)
  start2.SetNpcDisplaySprite(3)
  origin.RegisterSequence(start2)

  -- -- -- -- --
end

-- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  OnEntry
-- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

function OnEntry()
  if target.HasCookie("startup-quest-complete") then
    target.SystemMessage("...Shouldn't you be going downstairs?")
  else
    target.SetCookie("Nation", "Mileth")
    target.AddLegendMark(LegendIcon.Community, LegendColor.White, "Mileth Citizen", "PP1")
    target.StartSequence("startup_dialog1")
  end
end

-- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  Other Functions
-- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

function wakeup_effect()
  target.DisplayEffect(21)
  target.SystemMessage("A light sworls around you...")
  target.StartSequence("startup_dialog2")
end

function wakeup_giveitems()
  target.EndDialog()
  target.GiveExperience(5000)
  --[[
  target.GiveItem("Dirk")
  target.GiveItem("Small Sapphire Ring")
  target.GiveItem("Small Spinel Ring")
  target.GiveItem("Boots")
  target.GiveItem("Tutorial Book")
 ]]
  target.AddGold(7500)
  --[[
  if (target.Gender == Gender.Male) then
      target.GiveItem("Shirt")
  else
      target.GiveItem("Blouse")
  end
 ]]
  target.AddSkill("Assail")
  target.SetCookie("startup-quest-complete", 1)
end
