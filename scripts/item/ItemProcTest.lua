-- Barrel of Sausages
-- Part of 'Urgent Deliveries' quest

label_text =
"  T  :  io   ,   e \n\nFr   : Va  h n,  il t \n\n V a : L  r s"

function OnUse()
    label = label_text
    source.SystemMessage("Oh no! The leaking juices ruined the label!")
    source.SendMessage(label, 9)
end