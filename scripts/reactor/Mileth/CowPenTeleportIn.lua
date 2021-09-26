-- CowPenTeleportIn
-- Used in "Vaughan's Training" Quest.

function OnEntry()
    if invoker.GetCookie("vaughan_training_position") == "3" and invoker.Class == 0 then
        invoker.Teleport("Mileth Village", 33, 17)
        invoker.SystemMessage("You are just able to get through a broken section of the fence.")
    else
        invoker.SystemMessage("It looks like this section of fence has been repaired recently.")
    end
end