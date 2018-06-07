local AutoBottle = {}

local MenuPath = { "Utility", "AutoUse", "Bottle" }

AutoBottle.EnableForYou = Menu.AddOptionBool(MenuPath, "Enable for Tinker", false)
--AutoBottle.optionDebug = Menu.AddOptionBool(MenuPath, "Debug", false)

AutoBottle.LastUpdateTime = 0
AutoBottle.UpdateTime = 0.25

function AutoBottle.OnUpdate()
    function Bottle()
    local abilityBottle = NPC.GetItem(Tinker.Hero, "item_bottle", true)
    if	abilityBottle 
		and Tinker.LastCastAbility ~= abilityBottle
	then 
		Ability.CastNoTarget(abilityBottle)
		Tinker.LastCastAbility = abilityBottle
		Tinker.NextTime = Tinker.CurrentTime + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING)
	return end
end
return AutoBottle
