-- CowPenTeleportOut
-- Used in "Vaughan's Training" Quest.

function OnEntry()
    invoker.Teleport("Mileth Village", 33, 21)
    invoker.SystemMessage("You barely manage to exit through the broken section of the fence.")
end