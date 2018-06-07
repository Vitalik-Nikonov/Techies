local Utility = require("Utility")
local AutoStash = require("AutoStash")

local AutoUseItems = {}

AutoUseItems.optionSoulRing = Menu.AddOptionBool({ "Utility", "Item Specific"}, "Soul Ring", "Auto use soul ring before casting spells or items", false)

    local myHero = Heroes.GetLocal()
    if not myHero then return end
    
-- auto use soul ring before casting spells or items
function AutoUseItems.OnPrepareUnitOrders(orders)
    if not Menu.IsEnabled(AutoUseItems.optionSoulRing) then return true end
    if not orders or not orders.ability then return true end

    if not Entity.IsAbility(orders.ability) then return true end
    if Ability.GetManaCost(orders.ability) <= 0 then return true end

    local myHero = Heroes.GetLocal()
    if not myHero or NPC.IsStunned(myHero) then return true end

    local soul_ring = NPC.GetItem(myHero, "item_soul_ring", true)
    if not soul_ring or not Ability.IsCastable(soul_ring, 0) then return true end

    local HpThreshold = 200
    if Entity.GetHealth(myHero) <= HpThreshold then return true end

    -- If in base, stash items before using soul ring.
    -- It has to team with stash2inventory() action in AutoStash.lua
    if NPC.HasModifier(myHero, "modifier_fountain_aura_buff") then
        AutoStash.inventory2stash(myHero)
    end

    Ability.CastNoTarget(soul_ring)
    return true
end

return AutoUseItems
