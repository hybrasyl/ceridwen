-- VaughanTrainingGold
-- Used in "Vaughan's Training" Quest.

function OnEntry()
    if invoker.HasCookie("vaughan_has_begged") and invoker.HasCookie("vaughan_took_gold") then
    elseif invoker.HasCookie("vaughan_has_begged") then
        invoker.SetCookie("vaughan_took_gold", 1)
        invoker.AddGold(2000)
        invoker.SystemMessage("You find a small coin pouch under a loose floorboard.")
    end
end