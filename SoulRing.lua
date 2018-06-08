local TinkerSB = {}

TinkerSB.optionEnable = Menu.AddOptionBool({ "Hero Specific", "TinkerSB" }, "Enable", false)
TinkerSB.optionKey = Menu.AddKeyOption({ "Hero Specific", "TinkerSB" }, "Combo Key", Enum.ButtonCode.KEY_1)

-- TinkerSB.Addbottle           = Menu.AddOptionBool({"Hero Specific", "TinkerSB", "Combo skills"}, "Rearm", false)

TinkerSB.Addbottle = Menu.AddOptionBool({ "Hero Specific", "TinkerSB", "Combo items" }, "Bottle", false)
TinkerSB.Addsoulring = Menu.AddOptionBool({ "Hero Specific", "TinkerSB", "Combo items" }, "SoulRing", false)

TinkerSB.optionDebug = Menu.AddOptionBool({ "Hero Specific", "TinkerSB" }, "Debug", false)

local last_cast_time = 0

function TinkerSB.OnUpdate()
    if not Menu.IsEnabled(TinkerSB.optionEnable) then
        return
    end

    local MyHero = Heroes.GetLocal()
    if not MyHero or NPC.GetUnitName(MyHero) ~= "npc_dota_hero_tinker" then
        return
    end
    if not Entity.IsAlive(MyHero) or NPC.IsStunned(MyHero) or NPC.IsSilenced(MyHero) then
        return
    end

    if Menu.IsKeyDownOnce(TinkerSB.optionKey) then
        TinkerSB.Combo(MyHero)
    end
end

function TinkerSB.Combo(MyHero)
    local rearm = NPC.GetAbility(MyHero, "tinker_rearm")
    -- local crystalNova   = NPC.GetAbility(MyHero, "tinker_rearm")
    local bottle = NPC.GetItem(MyHero, "item_bottle")
    local soulring = NPC.GetItem(MyHero, "item_soul_ring")

    if not rearm then
        return
    end

    TinkerSB.manaCount = NPC.GetMana(MyHero)
    TinkerSB.realManaCount = TinkerSB.manaCount
    if not TinkerSB.manaCount then
        return
    end

    rearmBManaCost = Ability.GetManaCost(rearm)
    if not rearmManaCost then
        return
    end

    TinkerSB.manaCount = TinkerSB.manaCount - rearmManaCost
    TinkerSB.ManaNeed = TinkerSB.GetManaNeed(MyHero, bottle,  soulring)

    if TinkerSB.manaCount >= TinkerSB.ManaNeed then
        if bottle and Menu.IsEnabled(TinkerSB.Addbottle) and Ability.IsCastable(bottle, TinkerSB.manaCount) and Ability.IsReady(bottle) then
            if Menu.IsEnabled(TinkerSB.optionDebug) then Log.Write("Use Bottle") end
            Ability.CastNoTarget(bottle, true)
        end


        if soulring and Menu.IsEnabled(TinkerSB.Addsoulring) and Ability.IsCastable(soulring, TinkerSB.manaCount) and Ability.IsReady(soulring) then
            if Menu.IsEnabled(TinkerSB.optionDebug) then Log.Write("Use Soul Ring") end
            Ability.CastNoTarget(soulring, true)
        end
    end

function TinkerSB.GetManaNeed(MyHero, bottle, soulring)
    local mana = 0

    if bottle and Menu.IsEnabled(TinkerSB.Addbottle) then
        mana = mana + Ability.GetManaCost(bottle)
    end


    if soulring and Menu.IsEnabled(TinkerSB.Addsoulring) then
        mana = mana + Ability.GetManaCost(soulring)
    end

    return mana
end

return TinkerSB
