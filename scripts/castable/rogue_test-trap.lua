-- trap.lua
-- Test script used by Test Trap spell

function OnEntry()
  -- Variables come predefined here for usage:
  -- invoker - world object that activated the reactor
  -- source - the thing activated, in this case the reactor, represented by a HybrasylReactor C# shim
  invoker.SystemMessage("A trap!")
  invoker.Damage(25)
end

