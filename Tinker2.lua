local Tinker = {}

Tinker.ExtraSoul = Menu.AddOption({ "Hero Specific","Tinker", "Extra", "Items" }, "Soul Ring", "Cast Soul Ring before each ability")
Tinker.ExtraSoulT = Menu.AddOption({ "Hero Specific","Tinker", "Extra", "Items" }, "Soul Ring Threshold", "", 150, 500, 50)
Tinker.ExtraBottle = Menu.AddOption({ "Hero Specific","Tinker", "Extra", "Items" }, "Bottle", "Drink bottle on yourself before each ability")

Tinker.Items = {}
Tinker.Items[1] =  "Off"
-- Available items
Tinker.Items[2] =  "Soul Ring"
Tinker.Items[3] =  "Bottle"
