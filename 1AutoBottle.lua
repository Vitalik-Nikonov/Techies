local Bottle = {}

Bottle.Enable = Menu.AddOptionBool({ "Utility", "AutoUse" }, "Bottle", false)

local hero = Heroes.GetLocal()
    if not hero or not Entity.IsAlive(hero) then
        return
    end

    local Bottle = NPC.GetItem(hero, "item_bottle")
    if not Bottle then
        return
    end
    
     if Menu.IsEnabled(Bottle.Enable) then
        if NPC.GetMaxMana(MyHero) - NPC.GetMana(MyHero) > 180 and ArcaneBoots and Ability.IsReady(Bottle) then
            Ability.CastNoTarget(Bottle)
            return
        end
    end

    if NPC.IsRunning(hero) and Ability.IsReady(Bottle) and Ability.IsCastable(phaseBoots, mana) then
        Ability.CastNoTarget(Bottle)
    end
end

    if not Entity.IsAlive(myHero) then
        return false
    end

    return false
end

return Bottle
