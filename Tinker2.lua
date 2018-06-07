local Tinker = {}

Tinker.ExtraSoul = Menu.AddOption({ "Hero Specific","Tinker", "Extra", "Items" }, "Soul Ring", "Cast Soul Ring before each ability")
Tinker.ExtraSoulT = Menu.AddOption({ "Hero Specific","Tinker", "Extra", "Items" }, "Soul Ring Threshold", "", 150, 500, 50)
Tinker.ExtraBottle = Menu.AddOption({ "Hero Specific","Tinker", "Extra", "Items" }, "Bottle", "Drink bottle on yourself before each ability")

Tinker.Items = {}
Tinker.Items[1] =  "Off"
-- Available items
Tinker.Items[2] =  "Soul Ring"
Tinker.Items[3] =  "Bottle"

-- Tinker.ExtraSoul
-- Tinker.ExtraBottle
		if Menu.IsEnabled(Tinker.ExtraSoul) then
			local sr = NPC.GetItem(Tinker.Hero, "item_soul_ring", true)
			if	sr ~= nil 
				and Ability.IsCastable(sr, Tinker.ManaPoint)
				and Entity.GetHealth(Tinker.Hero) > Menu.GetValue(Tinker.ExtraSoulT)
			then
				Ability.CastNoTarget(sr)
			end
		end
		
		if Menu.IsEnabled(Tinker.ExtraBottle) then
			local bott = NPC.GetItem(Tinker.Hero, "item_bottle", true)
			if	bott ~= nil 
				and Ability.IsCastable(bott, Tinker.ManaPoint)
				and (Entity.GetHealth(Tinker.Hero) < Entity.GetMaxHealth(Tinker.Hero) or Tinker.ManaPoint < NPC.GetMaxMana(Tinker.Hero))
				and not NPC.HasModifier(Tinker.Hero, "modifier_bottle_regeneration")
			then
				Ability.CastNoTarget(bott)
			end
		end
	end
	
	
	return true
end
