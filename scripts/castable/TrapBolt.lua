-- TrapBolt
-- Dead Ages Bolt Trap

function OnEntry()
  local dmg = 1800
  local casterName = caster.Name

  if (caster.IsPlayer and target.IsPlayer) then
    target.SystemMessage("You notice a trap nearby.")
  elseif (caster.IsPlayer == false and target.IsPlayer) then
    target.SystemMessage("You fall into " .. casterName .. "'s trap!")
    target.Damage(dmg)
  elseif (caster.IsPlayer and target.IsPlayer == false) then
    target.Damage(dmg)
  end
end