-- TrapPitfall
-- Dead Ages Medenia Bullshit Trap

function OnEntry()
  local dmg = 45000
  -- local pvpDmg = 12000
  local casterName = caster.Name

  if (caster.IsPlayer and target.IsPlayer) then
    target.SystemMessage("You notice a trap nearby that would normally damage you but pvp is turned off.")
    --target.Damage(pvpDmg)
  elseif (caster.IsPlayer == false and target.IsPlayer) then
    target.SystemMessage("You fall into " .. casterName .. "'s trap!")
    target.Damage(dmg)
  elseif (caster.IsPlayer and target.IsPlayer == false) then
    target.Damage(dmg)
  end
end
