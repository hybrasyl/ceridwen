-- trap.lua
-- Test script used by Test Trap spell

function OnEntry()
  -- Variables come predefined here for usage:
  -- invoker - world object that activated the reactor
  -- source - the thing activated, in this case the reactor, represented by a HybrasylReactor C# shim
  if not target.IsPlayer and not source.Expired then
    target.Damage(25)
    source.Uses = source.Uses - 1
  else
    target.SystemMessage("You notice a trap nearby.")
  end   
end

