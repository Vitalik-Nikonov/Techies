local AutoBottle = {}


AutoBottle.optionEnable = Menu.AddOptionBool({ "Utility", "AutoUse" }, "Auto Bottle")
    function AutoBottle.OnUpdate()
	    local MyHero = Heroes.GetLocal()
    if not MyHero or not Entity.IsAlive(MyHero) or NPC.IsStunned(MyHero) or NPC.IsSilenced(MyHero) then
        return
    end
	if not Menu.IsEnabled(AutoBottle.optionEnable) then 
		return 
	end
	local myHero = Heroes.GetLocal()
	local Use = NPC.GetItem(myHero, "item_bottle", true)
	if Menu.IsEnabled(AutoBottle.optionEnable) then
        if NPC.GetMaxMana(MyHero) and AutoBottle and Ability.IsReady(AutoBottle) then
            Ability.CastNoTarget(AutoBottle)
            return
        end
    end	
end

return AutoBottle
