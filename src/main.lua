-- Enabled flags

local config = {}
for id, _ in pairs(DECKS) do
    config[id] = true
end

-- Deck Inits

local card_selectors = {
    all = function()
        return G.playing_cards
    end,

    non_family_ranks = function()
        local result = {}
        local keep = { ["13"] = true, ["12"] = true, ["11"] = true, ["2"] = true }

        for _, card in ipairs(G.playing_cards) do
            if not keep[tostring(card.base.id)] then
                table.insert(result, card)
            end
        end

        return result
    end
}

local old_apply_to_run = Back.apply_to_run
function Back.apply_to_run(back)
    old_apply_to_run(back)

    local cfg = back.effect.config

    if cfg.money_per_hand then G.GAME.modifiers.money_per_hand = cfg.money_per_hand end
    if cfg.money_per_discard then G.GAME.modifiers.money_per_discard = cfg.money_per_discard end
    if cfg.interest_amount then G.GAME.interest_amount = cfg.interest_amount end

    -- Add Jokers
    if cfg.jokers then
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, jokerData in ipairs(cfg.jokers) do
                    local j = create_card("Joker", G.jokers, nil, nil, nil, nil, jokerData.id, nil)
                    if jokerData.eternal then j:set_eternal(true) end
                    if jokerData.pinned then j.pinned = true end
                    j:add_to_deck()
                    G.jokers:emplace(j)
                end
                return true
            end
        }))
    end

    -- Player card manipulation
    if cfg.player_cards_manipulations then
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, pmanip in ipairs(cfg.player_cards_manipulations) do
                    local selector = pmanip.selector or "all"
                    local m_type = pmanip.manipulation_type
                    local m_value = pmanip.manipulation_value
                    local m_values = pmanip.manipulation_values

                    if not m_type or (not m_value and not m_values) then
                        print("❌ invalid config:", m_type)
                    else
                        local get_cards = card_selectors[selector]
                        if not get_cards then
                            print("❌ unknown selector:", selector)
                        else
                            local target_cards = get_cards()

                            for i, card in ipairs(target_cards) do
                                local value = m_values and m_values[math.random(1, #m_values)] or m_value

                                if not value then
                                    print("❌ unknown manipulation val", i)
                                elseif m_type == "ability" then
                                    card:set_ability(value)
                                elseif m_type == "seal" then
                                    card:set_seal(value, true, true)
                                elseif m_type == "edition" then
                                    card:set_edition(value, true, true)
                                elseif m_type == "remove" then
                                    card:remove()
                                else
                                    print("❌ unknown manipulation_type:", m_type)
                                end
                            end
                        end
                    end
                end
                return true
            end
        }))
    end
end

-- Init Code

function SMODS.INIT.ShukaaasDeckCollection()
    local mod = SMODS.findModByID("ShukaaasDeckCollection")
    local sprite_card = SMODS.Sprite:new("centers", mod.path, "Shukaaa_Enhancers.png", 71, 95, "asset_atli")
    sprite_card:register()

    for id, data in pairs(DECKS) do
        if config[id] then
            local loc = { name = data.name, text = data.description }
            local newDeck = SMODS.Deck:new(data.name, id, data.config, data.sprite, loc)
            newDeck:register()
        end
    end
end