-- TrapGreatBlind
-- Dead Ages Blind Trap

function OnEntry()
  local casterName = caster.Name

  if (caster.IsPlayer and target.IsPlayer) then
    target.SystemMessage("You notice a trap nearby.")
  elseif (caster.IsPlayer == false and target.IsPlayer) then
    target.SystemMessage("You fall into " .. casterName .. "'s trap!")
    target.ApplyStatus("Blind", 90)
  elseif (caster.IsPlayer and target.IsPlayer == false) then
    target.ApplyStatus("Blind", 90)
  end
end
