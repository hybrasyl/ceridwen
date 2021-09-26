--VaughanTrainingLure
-- Used in "Vaughan's Training" Quest.

function OnDrop()
    if item.Name == "Centipede Gland" then
        invoker.SystemMessage("This looks like a good spot to place the lure.")
        invoker.SetCookie("vaughan_training_lure", "1")
    end
end