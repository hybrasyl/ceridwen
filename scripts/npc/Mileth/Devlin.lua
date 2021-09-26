-- Devlin
-- Mileth Fae Priestess

--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  SCRIPT
--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

on_insight = {
"When you have an insight you will discover potential power you never know you had before.\n\z
Before you decide to become stronger, smarter, wiser, healthier, or faster, come to a skill or secret teacher.",
"It's always best to learn what attributes you need to learn the skill or secret you want to know."
}

honey_items = {"Raw Wax", "Raw Honey", "Royal Wax"}

on_honey = {
"Hi there, Aisling. I'm Devlin, faerie Priest of Mileth. I followed the ways of the fae, and felt I should set up shop here in Mileth to instruct the devoted.",
"I need some {{honey-neededitem}}. Do you think you could find it?",
"There a woodland not far from here. You have to leave Mileth Village to get there. To leave Mileth, leave this building, and follow the road east of here to a bridge. Cross the bridge and walk north past the \z
crypt and a fountain.",
"Turn to the east again and continue on to the Eastern Woodlands. You will find bees there which make excellent wax and honey.",
"Bee's honey is so delicious and rich. I would love to have some. I don't go to the garden often enough.",
"Only priests are devoted enough to receive most of the gifts I know of. I hope you find someone who can help you. I know Keallach, the butcher of a man in the other half of this shop teaches warriors how to fight and slash.",
"I know that Daithi, out to the west passed the Goddess Statue and Inn shares secrets with Rogues, and across the river north of here is the dark wizard Dar who will corrupt the minds of Wizards.",
"Thank you so much!",
"Thank you. I needed this.",
"Ah, hmm. I don't see any {{honey-neededitem}} in what you have here."
}

woods_lore = {
"When in the Enchanted Woods, do be careful. While the snakes and bees are kind and gentle as you are, clik-clak mantises \z
hide behind the flowers, and spring forth. They'll eat you, surely, if your feet are not fast.",
"If you go to the Enchanted Wood, which you can simply walk out of town to get there, ensure that Sgrios's dark drip does not capture you nor \z
your kin.",
"When you leave Mileth to go there, be careful where you wander. There are several paths into the woods, but few you will survive to return \z
from. There will be several paths to the north of you and one path to the east and west.",
"The paths to the north are all deadly. Each of these paths are more and more trecherous as you move to the east.",
"The path to the west leads to the Enchanted Garden. The path to the west leads to a wasteland of a garden that once was."
}

faerie_love = {
"Hello, Aisling. If you feel the twinkling of love in your heart, perhaps you'll want to know of the faerie glade of lovers.",
"You are considering expressing romantic love. It is not the kind of marriage of the Churches of Mankind. It is an expression of love. It is \z
not an eternal bond, but is certainly a touching of the hearts. If your heart is sincere, then proceed.",
"If your heart is not sincere, then do not soil your good name with this folly. \z
You and your lover need not be of any particular gender, or of opposite gender. However this is a romantic ceremony. If you are not in \z
romantic love, then this is not for you.",
"Finally, you and your lover must have known the 11th insight, which is the insight of One and One together.",
"You, your lover, and a priest must go to the Lover's Glade. All of you must have experienced the 11th insight. Once there, perhaps you'll \z
feed your lover berries or sip on wine. Maybe read poetry to each other, or better yet, speak spontaneously from the heart...",
"Then the Priest will stand in the smaller patch of grass to begin the ceremony. You will be prompted to name your lover, and it will be \z
consummated. Others will see it upon your Legend.",
"Go to the north-eastern corner of the Enchanted Garden. You'll know the Enchanted Garden by the wealth of flowers there."
}

graymayre = {
"Basic terms of the Tuatha seen in magic and miracles.",
"Only a Priest of Wizard may know the true terms of the Tuatha.",
"The Tuatha brought magic to the world. Their tongue lives on as the language of magic and miracles.",
"'beag' means 'little'\n\z
Most spells have a 'beag' form, which is a lesser effect. The base spell or miracle has no prefix. For example, 'beag srad.'",
"'mor' means 'big'\n\z
Some spells have a 'mor' form; these have a greater effect than the base spell. For example, 'mor srad.'",
"'ard' means 'great'\n\z
A few spells and a few great wizards and priests learn an 'ard' form which is astounding. For example, 'ard srad.'",
"'fein' means 'self'\n\z
Any 'fein' spell or miracle you cast will only affect yourself. For example, 'beag ioc fein.'",
"'comlha' means 'companions'\n\z
Any 'comlha' spell or miracle you cast will only affect your group. For example, 'beag ioc comlha.'",
"'lamh' means 'hand' or 'touching'\n\z
This applies to the range of the spell or miracle. These will only affect those in your immediate reach. For example, 'beag srad lamh.'",
"'meall' means 'cluster'\n\z
Any 'meall' spell or miracle you cast will affect a cluster instead of a single creature. For example, 'creag meall.",
"'gar' means 'near'\n\z
There are a few rare spells affect all those that are near you. For example, 'beag srad gar.'",
"'deum' or 'deur' means 'liquid'\n\z
Combined with a magical effect, you might know this as a potion. For example, 'beothaich deum.'"
}

mentor_someone = {
"When you have had your 15th insight you may mentor someone. You can use my books if you do not know that secret. Go to \z
the bookshelf. You'll find the secrets of Mentoring there. of course, bring the Aisling that wants to be your student too!"
}

--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  ONSPAWN
--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

function OnSpawn()
-- -- -- -- --
    on_insight_lecture = world.NewDialogSequence("On Insight", world.NewJumpDialog("on_insight_end"))

    on_insight_dialog = world.NewDialogSequence("on_insight_end",
        world.NewDialog(on_insight[1]),
        world.NewDialog(on_insight[2]),
        world.NewFunctionDialog("endit()"))

    associate.RegisterSequence(on_insight_dialog)

    associate.AddPursuit(on_insight_lecture)

-- -- -- -- --

    on_honey_lecture = world.NewDialogSequence("On Honey",
        world.NewFunctionDialog("honey()") )

    on_honey_babble_dialog = world.NewDialogSequence("on_honey_babble",
        world.NewDialog(on_honey[1]),
        world.NewJumpDialog("on_honey_menu"))

    on_honey_menu_options = world.NewDialogOptions()
        on_honey_menu_options.AddOption("I don't know where any bees are.", world.NewJumpDialog("on_honey_i_dont_know_where"))
        on_honey_menu_options.AddOption("What is so special about these bees?", world.NewJumpDialog("on_honey_what_is_so_special"))
        on_honey_menu_options.AddOption("Will you teach me something?", world.NewJumpDialog("on_honey_will_you_teach_me"))
        on_honey_menu_options.AddOption("I'll do that.", world.NewJumpDialog("on_honey_i_will_do_that"))
        on_honey_menu_options.AddOption("I have it here.", world.NewJumpDialog("on_honey_turn_in"))
    on_honey_menu_dialog = world.NewDialogSequence("on_honey_menu",
        world.NewOptionsDialog(on_honey[2], on_honey_menu_options))

    on_honey_i_dont_know_where_dialog = world.NewDialogSequence("on_honey_i_dont_know_where",
        world.NewDialog(on_honey[3]),
        world.NewDialog(on_honey[4]),
        world.NewJumpDialog("on_honey_menu"))

    on_honey_what_is_so_special_dialog = world.NewDialogSequence("on_honey_what_is_so_special",
        world.NewDialog(on_honey[5]),
        world.NewJumpDialog("on_honey_menu"))

    on_honey_will_you_teach_me_dialog = world.NewDialogSequence("on_honey_will_you_teach_me",
        world.NewDialog(on_honey[6]),
        world.NewDialog(on_honey[7]),
        world.NewJumpDialog("on_honey_menu"))

    on_honey_i_will_do_that_dialog = world.NewDialogSequence("on_honey_i_will_do_that",
        world.NewDialog(on_honey[8]),
        world.NewFunctionDialog("honey_promise()") )

    on_honey_turn_in_dialog = world.NewDialogSequence("on_honey_turn_in",
        world.NewFunctionDialog("honey_turn_in()") )

    on_honey_success_dialog = world.NewDialogSequence("on_honey_success",
        world.NewDialog(on_honey[9]))

    on_honey_failure_dialog = world.NewDialogSequence("on_honey_failure",
        world.NewDialog(on_honey[10]))

    associate.RegisterSequence(on_honey_menu_dialog)
    associate.RegisterSequence(on_honey_babble_dialog)
    associate.RegisterSequence(on_honey_i_dont_know_where_dialog)
    associate.RegisterSequence(on_honey_what_is_so_special_dialog)
    associate.RegisterSequence(on_honey_will_you_teach_me_dialog)
    associate.RegisterSequence(on_honey_i_will_do_that_dialog)
    associate.RegisterSequence(on_honey_turn_in_dialog)
    associate.RegisterSequence(on_honey_success_dialog)
    associate.RegisterSequence(on_honey_failure_dialog)

    associate.AddPursuit(on_honey_lecture)

    needed_item = associate.GetEphemeral("honey-neededitem")
    if (needed_item == nil) then
       needed_item = honey_items[math.random(#honey_items)]
       associate.SetEphemeral("honey-neededitem", needed_item)
       associate.SetEphemeral("honey-changetime", utility.GetUnixTime())
    end

-- -- -- -- --

    woods_lecture = world.NewDialogSequence("Woods Lecture",
        world.NewJumpDialog("woods"))

    woods_dialog = world.NewDialogSequence("woods",
        world.NewDialog(woods_lore[1]),
        world.NewDialog(woods_lore[2]),
        world.NewDialog(woods_lore[3]),
        world.NewDialog(woods_lore[4]),
        world.NewDialog(woods_lore[5]),
        world.NewFunctionDialog("woods_func()") )

    associate.RegisterSequence(woods_dialog)

    associate.AddPursuit(woods_lecture)

-- -- -- -- --

faerie_love_lecture = world.NewDialogSequence("On Faerie Love", world.NewJumpDialog("faerie_love_menu"))

    faerie_love_menu_options = world.NewDialogOptions()
        faerie_love_menu_options.AddOption("What is faerie love?", world.NewJumpDialog("faerie_love_what"))
        faerie_love_menu_options.AddOption("How may I express my love?", world.NewJumpDialog("faerie_love_how"))
        faerie_love_menu_options.AddOption("Where may I find Lover's Glade?", world.NewJumpDialog("faerie_love_where"))
    faerie_love_menu_dialog = world.NewDialogSequence("faerie_love_menu",
        world.NewOptionsDialog(faerie_love[1], faerie_love_menu_options))

    faerie_love_what_dialog = world.NewDialogSequence("faerie_love_what",
        world.NewDialog(faerie_love[2]),
        world.NewDialog(faerie_love[3]),
        world.NewDialog(faerie_love[4]),
        world.NewJumpDialog("faerie_love_menu", "invoker.CompletionAward('faerie_love_what', 500, 'She smiles.')"))

    faerie_love_how_dialog = world.NewDialogSequence("faerie_love_how",
        world.NewDialog(faerie_love[5]),
        world.NewDialog(faerie_love[6]),
        world.NewJumpDialog("faerie_love_menu", "invoker.CompletionAward('faerie_love_how', 500, 'She smiles.')"))

    faerie_love_where_dialog = world.NewDialogSequence("faerie_love_where",
        world.NewDialog(faerie_love[7]),
        world.NewJumpDialog("faerie_love_menu", "invoker.CompletionAward('faerie_love_where', 500, 'She closes her eyes and conjures an image of the fae.')"))

    associate.RegisterSequence(faerie_love_menu_dialog)
    associate.RegisterSequence(faerie_love_what_dialog)
    associate.RegisterSequence(faerie_love_how_dialog)
    associate.RegisterSequence(faerie_love_where_dialog) 

    associate.AddPursuit(faerie_love_lecture)

-- -- -- -- --

    graymayre_lecture = world.NewDialogSequence("Graymayre",
        world.NewJumpDialog("graymayre_menu") )

    graymayre_menu_options = world.NewDialogOptions()
        graymayre_menu_options.AddOption("History", world.NewJumpDialog("graymayre_history"))
        graymayre_menu_options.AddOption("Beag", world.NewJumpDialog("graymayre_beag"))
        graymayre_menu_options.AddOption("Mor", world.NewJumpDialog("graymayre_mor"))
        graymayre_menu_options.AddOption("Ard", world.NewJumpDialog("graymayre_ard"))
        graymayre_menu_options.AddOption("Fein", world.NewJumpDialog("graymayre_fein"))
        graymayre_menu_options.AddOption("Comlha", world.NewJumpDialog("graymayre_comlha"))
        graymayre_menu_options.AddOption("Lamh", world.NewJumpDialog("graymayre_lamh"))
        graymayre_menu_options.AddOption("Meall", world.NewJumpDialog("graymayre_meall"))
        graymayre_menu_options.AddOption("Gar", world.NewJumpDialog("graymayre_gar"))
        graymayre_menu_options.AddOption("Deum", world.NewJumpDialog("graymayre_deum"))
    graymayre_menu_dialog = world.NewDialogSequence("graymayre_menu",
        world.NewOptionsDialog(graymayre[1], graymayre_menu_options))

    graymayre_history_dialog = world.NewDialogSequence("graymayre_history",
        world.NewDialog(graymayre[3]),
        world.NewJumpDialog("graymayre_menu", "invoker.CompletionAward('graymayre_history', 250)"))

    graymayre_beag_dialog = world.NewDialogSequence("graymayre_beag",
        world.NewDialog(graymayre[4]),
        world.NewJumpDialog("graymayre_menu", "invoker.CompletionAward('graymayre_beag', 250)"))

    graymayre_mor_dialog = world.NewDialogSequence("graymayre_mor",
        world.NewDialog(graymayre[5]),
        world.NewJumpDialog("graymayre_menu", "invoker.CompletionAward('graymayre_mor', 250)"))

    graymayre_ard_dialog = world.NewDialogSequence("graymayre_ard",
        world.NewDialog(graymayre[6]),
        world.NewJumpDialog("graymayre_menu", "invoker.CompletionAward('graymayre_ard', 250)"))

    graymayre_fein_dialog = world.NewDialogSequence("graymayre_fein",
        world.NewDialog(graymayre[7]),
        world.NewJumpDialog("graymayre_menu", "invoker.CompletionAward('graymayre_fein', 250)"))

    graymayre_comlha_dialog = world.NewDialogSequence("graymayre_comlha",
        world.NewDialog(graymayre[8]),
        world.NewJumpDialog("graymayre_menu", "invoker.CompletionAward('graymayre_comlha', 250)"))

    graymayre_lamh_dialog = world.NewDialogSequence("graymayre_lamh",
        world.NewDialog(graymayre[9]),
        world.NewJumpDialog("graymayre_menu", "invoker.CompletionAward('graymayre_lamh', 250)"))

    graymayre_meall_dialog = world.NewDialogSequence("graymayre_meall",
        world.NewDialog(graymayre[10]),
        world.NewJumpDialog("graymayre_menu", "invoker.CompletionAward('graymayre_meall', 250)"))

    graymayre_gar_dialog = world.NewDialogSequence("graymayre_gar",
        world.NewDialog(graymayre[11]),
        world.NewJumpDialog("graymayre_menu", "invoker.CompletionAward('graymayre_gar', 250)"))

    graymayre_deum_dialog = world.NewDialogSequence("graymayre_deum",
        world.NewDialog(graymayre[12]),
        world.NewJumpDialog("graymayre_menu", "invoker.CompletionAward('graymayre_deum', 250)"))

    associate.RegisterSequence(graymayre_menu_dialog)
    associate.RegisterSequence(graymayre_history_dialog)
    associate.RegisterSequence(graymayre_beag_dialog)
    associate.RegisterSequence(graymayre_mor_dialog)
    associate.RegisterSequence(graymayre_ard_dialog)
    associate.RegisterSequence(graymayre_fein_dialog)
    associate.RegisterSequence(graymayre_comlha_dialog)
    associate.RegisterSequence(graymayre_lamh_dialog)
    associate.RegisterSequence(graymayre_meall_dialog)
    associate.RegisterSequence(graymayre_gar_dialog)
    associate.RegisterSequence(graymayre_deum_dialog)

    associate.AddPursuit(graymayre_lecture)

-- -- -- -- --

    mentor_someone_lecture = world.NewDialogSequence("Mentor Someone", world.NewJumpDialog("mentor_someone_end"))

    mentor_someone_dialog = world.NewEndSequence(mentor_someone[1], nil, "mentor_someone_end")

    associate.RegisterSequence(mentor_someone_dialog)

    associate.AddPursuit(mentor_someone_lecture)
    
-- -- -- -- --

end

--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  OnHear
--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

function OnHear()
    lc = string.lower(text)
    if (string.match(lc, "what is your name?") != nil) or (string.match(lc, "what's your name?")) then
        associate.Say("My name is Devlin, Priestess of Mileth")
    elseif (string.match(lc, "hello mundane") != nil) or (string.match(lc, "hello, mundane")) then
        associate.Say("Hello, Aisling. How are you this sun?")
    end
end

--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  ON HONEY
--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

function honey()
    current_time = utility.GetUnixTime()
    if (invoker.GetCookie("honey_last_completed") == nil) then
        last_completed_time = invoker.GetCookie('honey_last_completed')
        invoker.StartSequence("on_honey_babble")
    elseif (utility.HoursBetweenUnixTimes(last_completed_time, current_time) <= 12) then
            invoker.SystemMessage("...Sorry! I have all I could possibly use right now. Perhaps later?")
            invoker.EndDialog()
    else
        last_completed_time = invoker.GetCookie('honey_last_completed')
        invoker.StartSequence("on_honey_babble")
    end
end

function honey_promise()
    invoker.SystemMessage("She smiles.")
    invoker.EndDialog()
end

function honey_turn_in()

    last_updated = associate.GetEphemeral('honey-changetime')
    needed_item = associate.GetEphemeral('honey-neededitem')
 
    if (last_updated == nil) then
        associate.SetEphemeral('honey-neededitem', new_needed_item)
        associate.SetEphemeral('honey-changetime', utility.GetUnixTime())
        needed_item = new_needed_item
    else
        if (utility.HoursBetweenUnixTimes(last_updated, utility.GetUnixTime()) >= 4) then
            associate.SetEphemeral('honey-neededitem', needed_item)
            needed_item = new_needed_item
        end
    end

    needed_item = associate.GetEphemeral('honey-neededitem')

    if (invoker.HasItem(needed_item, 1)) then
        invoker.TakeItem(needed_item, 1)
        if invoker.Level < 41 then
            exp = ((((invoker.Level)^3)*250) - (((invoker.Level-1)^3)*250))*.04
        else
            exp = 50000
        end
        invoker.GiveExperience(exp)
        invoker.SetCookie('honey_last_completed', utility.GetUnixTime())
        invoker.SystemMessage("Ah... this will do. Thank you, Aisling.")
        invoker.StartSequence("on_honey_success")
    else
        invoker.SystemMessage("You have none.")
        invoker.StartSequence("on_honey_failure")
    end
end


--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --
--  WOODS LECTURE, FAERIE LOVE LECTURE
--  -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~- -~*~-  --

function woods_func()
    if invoker.HasCookie("woods_cookie") then
        invoker.EndDialog()
    else
        invoker.SetCookie("woods_cookie", 1)
        invoker.GiveExperience(2000)
        invoker.EndDialog()
    end
end

function endit()
    invoker.EndDialog()
end