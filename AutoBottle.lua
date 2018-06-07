local AutoBottle = {}

local MenuPath = { "Utility", "AutoUse", "Bottle" }

AutoBottle.EnableForYou = Menu.AddOptionBool(MenuPath, "Enable for you", false)
--AutoBottle.optionDebug = Menu.AddOptionBool(MenuPath, "Debug", false)

AutoBottle.LastUpdateTime = 0
AutoBottle.UpdateTime = 0.25

function AutoBottle.OnUpdate()
    if ((os.clock() - AutoBottle.LastUpdateTime) < AutoBottle.UpdateTime) then
        return
    end
    AutoBottle.LastUpdateTime = os.clock()

    local MyHero = Heroes.GetLocal()
    if not MyHero or not Entity.IsAlive(MyHero) or NPC.IsStunned(MyHero) or NPC.IsSilenced(MyHero) then
        return
    end

    local Bottle = NPC.GetItem(MyHero, "item_Bottle", true)
    if not Bottle then
        return
    end

    if Menu.IsEnabled(AutoBottle.EnableForYou) then
        if NPC.GetMaxMana(MyHero) - NPC.GetMana(MyHero) > 170 and Bottle and Ability.IsReady(Bottle) then
            Ability.CastNoTarget(Bottle)
            return
        end
    end
    if RealManaNeed >= NeedManaRegen and Bottle and Ability.IsReady(Bottle) then
            Ability.CastNoTarget(Bottle)
            return
    end
return AutoBottle
