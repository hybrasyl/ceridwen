-- Vaughn
-- Mileth Training Guy

-- needs reactor in cow pin in case player uses the lure approach.

--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  SCRIPT, NOT CODE
--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

training = {
    "I see that you are new here. My name is Vaughn, trainer of all new aislings. Would you like me to train you?",
    "Great! You are currently in the township of Mileth. This building is on the south-west side of town.",
    "On the northern side of town there is a pen where the cattle of Mileth are kept. We have had problems with wolves sneaking into the pen and killing cows.",
    "The goal of your training is to prevent a wolf from eating the cows. You have a couple of ways to attempt this, you could...",
    "I see you have a passion for combat.\nYou have the potential of becoming a Warrior or a Monk.",
    "I see you have an affection for nature.\nYou have the potential of becoming a Wizard or a Priest.",
    "You will need some protection in case the wolves attack you. At the very least you need to have a pair of Boots and a Wooden Shield.",
    "There is an armory and a weapon shop immediately to the north of here. If I recall correctly, Boots cost 1000 gold and a Wooden Shield will cost 100 gold. Come back to see me when you have these things.",
    "Ah, I see... Go to the Mileth Tavern where Aingeal keeps the bar. In the south-east corner of the tavern I hid a bag of coins under a loose floorboard.\nGo there now.",
    "I have already told you where I had some money hidden. Did someone already take it from the Mileth Tavern?",
    "You seem to have the necessary armor to protect yourself from wolves.",
    "Now you need to get a lure. A Centipede Gland has the same odor as cow meat. Go to the Mileth Crypt and find yourself a Centipede Gland.",
    "If you must, kill a centipede. Sometimes they will drop their glands, but be careful. These are hostile and dangerous creatures for young Aislings.",
    "To get to the Mileth Crypt, follow the path along the river. When you pass the Church, you will come to a bridge. Cross the bridge and make a left. You will see the entrance to the Mileth Crypt there.",
    "When you have the gland, come and see me.",
    "You still need to get a lure. Go find a Centipede's Gland from the crypt.",
    "Aha! Now you are ready to face the wolves.\nGo to the cow pen on the north side of town.",
    "If you wish to defend the cattle, then use your weapon to fight off the wolves. If you wish to lure the wolves away, place the Centipede's Gland on the far side of the pen from the cows. When you have done this, return to me.",
    "How are the cows doing?\z
    \nHave the wolves gotten another one?",
    "Well done, young Aisling!",
    "Your training here is now complete, and the cows are safe for a while.\z
    \nFor your effort, please take this.",
    "Now that you've had a little taste of adventure, perhaps you would be interested in learning a class? Head to the Temple of Chooosing to the North East, and maybe ask a fellow Aisling to be your guide.",
    "If you would like to know more about new Temuair, then you should speak to other mundanes and your fellow Aislings to see what they might have to teach you.",
}

urgent = {
    "Haha. Well, sorry Aisling, my little gift was never meant for you, but by the GODS will it \z
    just stink all the more now that it's been out an extra moon. This is perfect!",
    "Go ahead and deliver it will you? His name is on the label just there... Oh right, haha, it's bled out! \z
    It'll just take even longer to really ripen up! This is beyond perfect!!",
    "Ah, it's just a joke on some guy. He was terrible to me, and so...",
    "It's a practical joke. It's funny? It's not as though anyone would eat that now that it's rotten...",
    "You could put it that way, I suppose. Anyway, I don't want anything to do with that barrel or him any more, \z
    and I don't mind if the tragic loss of that label means the barrel a long journey over land to get to him.",
    "You can still see part of his name there... 'io' and if you sort of squint one eye... Och. \z
    By Deoch's Flames does that stink really burn the eyes. Phew!!",
    "I know, right? I had it sent overland instead of through Abel Port to make sure it was extra funky. \z
    Do you think the folks along the way smelled this beauty too? Hahaha...",
    "Well. Heh. It's like that is it? Just keep heading east until you meet a dog-faced, foul tempered fool or someone \z
    who might have caught a whiff of that barrel before the stink juice ruined the label."
}

--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  ON SPAWN
--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

function OnSpawn()

-- -- -- -- --

    training_lecture = world.NewDialogSequence("Vaughan Training",
        world.NewFunctionDialog("training_check()"))

    training_start_options = world.NewDialogOptions()
        training_start_options.AddOption("Sure", world.NewJumpDialog("training_personality_test"))
        training_start_options.AddOption("No, thank you", "endit()")
    training_start_dialog = world.NewDialogSequence("training_start",
        world.NewOptionsDialog(training[1], training_start_options))

    training_personality_test_options = world.NewDialogOptions()
        training_personality_test_options.AddOption("Kill the wolf", world.NewJumpDialog("training_kill_the_wolf"))
        training_personality_test_options.AddOption("Lead the wolf away", world.NewJumpDialog("training_lure_the_wolf"))
    training_personality_test_dialog = world.NewDialogSequence("training_personality_test",
        world.NewDialog(training[2]),
        world.NewDialog(training[3]),
        world.NewOptionsDialog(training[4], training_personality_test_options))

    training_kill_the_wolf_dialog = world.NewDialogSequence("training_kill_the_wolf",
        world.NewDialog(training[5]),
        world.NewFunctionDialog("first_checkpoint()"))

    training_lure_the_wolf_dialog = world.NewDialogSequence("training_lure_the_wolf",
        world.NewDialog(training[6]),
        world.NewFunctionDialog("first_checkpoint()"))

    training_you_need_protection_options = world.NewDialogOptions()
        training_you_need_protection_options.AddOption("I will.", "check_shoes()")
        training_you_need_protection_options.AddOption("I need money", "accept_help()")
    training_you_need_protection_dialog = world.NewDialogSequence("training_you_need_protection",
        world.NewDialog(training[7]),
        world.NewOptionsDialog(training[8], training_you_need_protection_options))

    training_need_money_options = world.NewDialogOptions()
        training_need_money_options.AddOption("Thank you.", "endit()")
    training_need_money_dialog = world.NewDialogSequence("training_need_money",
        world.NewOptionsDialog(training[9], training_need_money_options))

    training_has_begged_options = world.NewDialogOptions()
        training_has_begged_options.AddOption("Thank you.", "endit()")
    training_has_begged_dialog = world.NewDialogSequence("training_has_begged",
        world.NewOptionsDialog(training[10], training_has_begged_options))

    training_get_a_lure_options = world.NewDialogOptions()
        training_get_a_lure_options.AddOption("I will.", "second_checkpoint()")
    training_get_a_lure_dialog = world.NewDialogSequence("training_get_a_lure",
        world.NewDialog(training[11]),
        world.NewDialog(training[12]),
        world.NewDialog(training[13]),
        world.NewDialog(training[14]),
        world.NewOptionsDialog(training[15], training_get_a_lure_options))
    
    training_get_a_lure_again_dialog = world.NewDialogSequence("training_get_a_lure_again",
        world.NewDialog(training[16]),
        world.NewDialog(training[14]),
        world.NewOptionsDialog(training[15], training_get_a_lure_options))

    training_go_get_the_wolves_options = world.NewDialogOptions()
        training_go_get_the_wolves_options.AddOption("I will.", "third_checkpoint()")
    training_go_get_the_wolves_dialog = world.NewDialogSequence("training_go_get_the_wolves",
        world.NewDialog(training[17]),
        world.NewOptionsDialog(training[18], training_go_get_the_wolves_options))

    training_how_are_the_cows_options = world.NewDialogOptions()
        training_how_are_the_cows_options.AddOption("I will check on them now.", "endit()")
    training_how_are_the_cows_dialog = world.NewDialogSequence("training_how_are_the_cows",
        world.NewOptionsDialog(training[19], training_how_are_the_cows_options))

    training_well_done_dialog = world.NewDialogSequence("training_well_done",
        world.NewDialog(training[20]),
        world.NewDialog(training[21]),
        world.NewDialog(training[22]),
        world.NewDialog(training[23]),
        world.NewFunctionDialog("training_completed()"))

    training_is_over_dialog = world.NewDialogSequence("training_is_over",
        world.NewDialog(training[22]),
        world.NewDialog(training[23]),
        world.NewFunctionDialog("endit()"))

        training_start_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_start_dialog)
        training_personality_test_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_personality_test_dialog)
        training_kill_the_wolf_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_kill_the_wolf_dialog)
        training_lure_the_wolf_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_lure_the_wolf_dialog)
        training_you_need_protection_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_you_need_protection_dialog)
        training_need_money_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_need_money_dialog)
        training_has_begged_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_has_begged_dialog)
        training_get_a_lure_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_get_a_lure_dialog)
        training_get_a_lure_again_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_get_a_lure_again_dialog)
        training_go_get_the_wolves_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_go_get_the_wolves_dialog)
        training_how_are_the_cows_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_how_are_the_cows_dialog)
        training_well_done_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_well_done_dialog)
        training_is_over_dialog.SetNpcDisplaySprite(33)
    associate.RegisterSequence(training_is_over_dialog)

    training_lecture.AddMenuCheckExpression("return invoker.Level<=5")
    associate.AddPursuit(training_lecture)


-- -- -- -- --

    urgent_deliveries_lecture = world.NewDialogSequence("Urgent Deliveries",
        world.NewFunctionDialog("WhatsThatSmell()"),
        world.NewJumpDialog("deliveries_intro_menu"))

    urgent_deliveries_options = world.NewDialogOptions()
        urgent_deliveries_options.AddOption("Why!?", world.NewJumpDialog("deliveries_why_menu"))
        urgent_deliveries_options.AddOption("Who is it for?", world.NewJumpDialog("deliveries_who_menu"))
    urgent_deliveries_dialog = world.NewDialogSequence("deliveries_intro_menu",
        world.NewDialog(urgent[1]),
        world.NewOptionsDialog(urgent[2], urgent_deliveries_options))

    urgent_deliveries_whymenu_options = world.NewDialogOptions()
        urgent_deliveries_whymenu_options.AddOption("But WHY??!", world.NewJumpDialog("deliveries_practicaljokes"))
        urgent_deliveries_whymenu_options.AddOption("So, you're terrible to him...", world.NewJumpDialog("deliveries_nowyouregettingit"))
    urgent_deliveries_whymenu_dialog = world.NewDialogSequence("deliveries_why_menu",
        world.NewOptionsDialog(urgent[3], urgent_deliveries_whymenu_options))

    urgent_deliveries_practicaljokes_dialog = world.NewDialogSequence("deliveries_practicaljokes",
        world.NewDialog(urgent[4]),
        world.NewJumpDialog("deliveries_intro_menu"))

    urgent_deliveries_nowyouregettingit_dialog = world.NewDialogSequence("deliveries_nowyouregettingit",
        world.NewDialog(urgent[5]),
        world.NewJumpDialog("deliveries_intro_menu"))

    urgent_deliveries_whomenu_options = world.NewDialogOptions()
        urgent_deliveries_whomenu_options.AddOption("It smells so horrible!", world.NewJumpDialog("deliveries_overland"))
        urgent_deliveries_whomenu_options.AddOption("Just tell me the name.", world.NewJumpDialog("deliveries_justtellme"))
    urgent_deliveries_whomenu_dialog = world.NewDialogSequence("deliveries_who_menu",
        world.NewOptionsDialog(urgent[6], urgent_deliveries_whomenu_options))

    urgent_deliveries_overland_dialog = world.NewDialogSequence("deliveries_overland",
        world.NewDialog(urgent[7]),
        world.NewJumpDialog("deliveries_intro_menu"))

    urgent_deliveries_justtellme_dialog = world.NewDialogSequence("deliveries_justtellme",
        world.NewFunctionDialog("KillJoy()"),
        world.NewDialog(urgent[8]))

    associate.RegisterSequence(urgent_deliveries_dialog)
    associate.RegisterSequence(urgent_deliveries_whymenu_dialog)
    associate.RegisterSequence(urgent_deliveries_practicaljokes_dialog)
    associate.RegisterSequence(urgent_deliveries_nowyouregettingit_dialog)
    associate.RegisterSequence(urgent_deliveries_whomenu_dialog)
    associate.RegisterSequence(urgent_deliveries_overland_dialog)
    associate.RegisterSequence(urgent_deliveries_justtellme_dialog)

    urgent_deliveries_lecture.AddMenuCheckExpression("return invoker.GetCookie('urgent_deliveries_position')=='1'")
    associate.AddPursuit(urgent_deliveries_lecture)

end


--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  QUEST COOKIE FUNCTIONS
--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

-- -- -- -- --

function training_check()
    training_position = invoker.GetCookie("vaughan_training_position")

    if invoker.GetCookie("vaughan_training_position") == nil then
        invoker.StartSequence("training_start")
    else
        if training_position == "1" then
            if invoker.HasItem("Boots", 1) and invoker.HasItem("Wooden Shield", 1) then
                invoker.StartSequence("training_get_a_lure")
            elseif invoker.HasEquipment("Boots") and invoker.HasEquipment("Wooden Shield") then
                invoker.StartSequence("training_get_a_lure")
            else 
                invoker.StartSequence("training_you_need_protection")
            end
        elseif training_position == "2" then
            if invoker.HasItem("Centipede Gland", 1) then
                invoker.StartSequence("training_go_get_the_wolves")
            else
                invoker.StartSequence("training_get_a_lure_again")
            end
        elseif training_position == "3" then
            if invoker.HasKilled("Wolf") or invoker.GetCookie("vaughan_training_lure") == "1" then
                invoker.StartSequence("training_well_done")
            else
                invoker.StartSequence("training_how_are_the_cows")
            end
        else
            invoker.StartSequence("training_is_over")
        end
    end
end

function endit()
    invoker.EndDialog()
end

function first_checkpoint()
    invoker.SetCookie("vaughan_training_position", 1)
    invoker.StartSequence("training_you_need_protection")
end

function check_shoes()
    invoker.SystemMessage("He looks down at his feet idlly checking if he needs new boots too.")
    endit()
end

function accept_help()
    if invoker.HasCookie("vaughan_has_begged") then
        invoker.StartSequence("training_has_begged")
        invoker.SystemMessage("He shakes his head muttering something about someone named 'Teague'")
    else
        invoker.SetCookie("vaughan_has_begged", 1)
        invoker.SystemMessage("He smiles kindly and waves you out the door.")
        invoker.StartSequence("training_need_money")
    end
end

function second_checkpoint()
    invoker.SetCookie("vaughan_training_position", 2)
    endit()
end

function third_checkpoint()
    invoker.SetCookie("vaughan_training_position", 3)
    endit()
end

function training_completed()
    invoker.SetCookie("vaughan_training_position", 4)
    exp = ((((invoker.Level)^3)*250) - (((invoker.Level-1)^3)*250))*.04
    invoker.GiveExperience(exp)
    invoker.GiveItem('Epee', 1)
    endit()
end

-- -- -- -- --

--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  OnHear
--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

function OnHear()
    lc = string.lower(text)
    if (string.match(lc, "what is your name?") != nil) or (string.match(lc, "what's your name?")) then
        associate.Say("My name is Vaughan, Citizen of Mileth")
    elseif (string.match(lc, "hello mundane") != nil) or (string.match(lc, "hello, mundane")) then
        associate.Say("Hello, Aisling. How are you this sun?")
    end
end

--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  Urgent Deliveries FUNCTIONS
--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

function WhatsThatSmell()
    invoker.SystemMessage("He sniffs the air and bursts out laughing.")
end

function KillJoy()
    invoker.SystemMessage("His mood suddenly sours.")
    invoker.SetCookie("urgent_deliveries_position", "2")
end