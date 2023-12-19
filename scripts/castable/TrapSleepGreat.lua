-- TrapSleepGreat
-- Dead Ages Sleep Trap

function OnEntry()
  local casterName = caster.Name

  if (caster.IsPlayer and target.IsPlayer) then
    target.SystemMessage("You notice a trap nearby.")
  elseif (caster.IsPlayer == false and target.IsPlayer) then
    target.SystemMessage("You fall into " .. casterName .. "'s trap!")
    target.ApplyStatus("Stun", 15)
    origin.Uses = origin.Uses -1
  elseif (caster.IsPlayer and target.IsPlayer == false) then
    target.ApplyStatus("Stun", 15)
    origin.Uses = origin.Uses -1
  end
end
