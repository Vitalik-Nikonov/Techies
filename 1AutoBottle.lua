local AutoBottle = {}


AutoBottle.optionEnable = Menu.AddOptionBool({ "Utility", "AutoUse" }, "Auto Bottle")
    function AutoBottle.OnUpdate()
	if not Menu.IsEnabled(AutoBottle.optionEnable) then return end
	local myHero = Heroes.GetLocal()
	local Use = NPC.GetItem(myHero, "item_bottle", true)
	if Menu.IsEnabled(AutoBottle.optionEnable) then
        if NPC.GetMaxMana(MyHero) - NPC.GetMana(MyHero) > 180 and AutoBottle and Ability.IsReady(AutoBottle) then
            Ability.CastTarget(AutoBottle)
            return
        end
    end	
end

return AutoBottle
