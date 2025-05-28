--- STEAMODDED HEADER
--- MOD_NAME: Shukaaa's Balanced Deck Collection
--- MOD_ID: ShukaaasDeckCollection
--- MOD_AUTHOR: [Shukaaa]
--- MOD_DESCRIPTION: A collection of 100% self coded Decks || Credits: <Absolute Deck> inspired by Steamo
----------------------------------------------
------------MOD CODE -------------------------

-- Decks

local DECKS = {
    -- Default Decks

    stoneDeck = {
        name = "Stone Deck",
        description = {
            "Start run with only",
            "{T:m_stone,C:blue}Stone{} cards"
        },
        sprite = { x = 5, y = 0 },
        config = {
            player_cards_manipulations = {
                {
                    selector = "all",
                    manipulation_type = "ability",
                    manipulation_value = G.P_CENTERS.m_stone
                }
            }
        }
    },

    blankDeck = {
        name = "Blank Deck",
        description = {
            "Start with {T:v_blank,C:attention}Blank{}",
            "and {T:j_stencil,C:attention}Joker Stencil{}"
        },
        sprite = { x = 1, y = 0 },
        config = {
            vouchers = { "v_blank" },
            jokers = {
                { id = "j_stencil" }
            }
        }
    },

    sealFactoryDeck = {
        name = "Seal Factory Deck",
        description = {
            "Each card receives a random {C:attention}Seal{}",
            "Start with {T:j_certificate,C:attention}Certificate{} which is {C:attention}Eternal{}",
            "You do not earn {C:money}interest{}, remaining {C:red}Discards{} & remaining {C:blue}Hands{} money"
        },
        sprite = { x = 0, y = 5 },
        config = {
            money_per_hand = 0,
            money_per_discard = 0,
            interest_amount = 0,
            jokers = {
                { id = "j_certificate", eternal = true }
            },
            player_cards_manipulations = {
                {
                    selector = "all",
                    manipulation_type = "seal",
                    manipulation_values = { "Red", "Blue", "Gold", "Purple" }
                }
            }
        }
    },

    shinyDeck = {
        name = "Shiny Deck",
        description = {
            "Each card gets a random",
            "{T:e_foil,C:blue}Foil{}, {T:e_polychrome,C:red}Polychrome{} or {T:e_holo,C:red}Holographic{} edition",
            "{C:blue}-3{} hands",
            "{C:red}-2{} discards"
        },
        sprite = { x = 1, y = 5 },
        config = {
            hands = -3,
            discards = -2,
            player_cards_manipulations = {
                {
                    selector = "all",
                    manipulation_type = "edition",
                    manipulation_values = { {foil = true}, {polychrome = true}, {holo = true} }
                }
            }
        }
    },

    fiveStarDeck = {
        name = "5 Star Restaurant",
        description = {
            "Start with 5 {C:attention}Food{} Jokers:",
            "{T:j_turtle_bean}Turtle Bean{}, {T:j_ramen}Ramen{}, {T:j_diet_cola}Diet Cola{},",
            "{T:j_popcorn}Popcorn{}, and {T:j_egg}Egg{}",
            "{C:blue}-1{} hand size"
        },
        sprite = { x = 2, y = 5 },
        config = {
            hands = -1,
            jokers = {
                { id = "j_turtle_bean" },
                { id = "j_egg" },
                { id = "j_diet_cola" },
                { id = "j_popcorn" },
                { id = "j_ramen" }
            }
        }
    },

    absoluteDeck = {
        name = "Absolute Deck",
        description = {
            "Start with a Deck",
            "full of {T:e_polychrome,C:red}Poly{}-{T:m_glass,C:red}Glass{} cards",
            "{C:blue}-3{} hands",
            "{C:red}-3{} discards"
        },
        sprite = { x = 3, y = 5 },
        config = {
            hands = -3,
            discards = -3,
            player_cards_manipulations = {
                {
                    selector = "all",
                    manipulation_type = "edition",
                    manipulation_value = {polychrome = true}
                },
                {
                    selector = "all",
                    manipulation_type = "ability",
                    manipulation_value = G.P_CENTERS.m_glass
                }
            }
        }
    },

    jokersReignDeck = {
        name = "Joker's Reign Deck",
        description = {
            "{C:attention}+2{} joker slots",
            "{C:red}-2{} consumable slots"
        },
        sprite = { x = 4, y = 5 },
        config = {
            joker_slot = 2,
            consumable_slot = -2
        }
    },

    familyTripDeck = {
        name = "Family Trip",
        description = {
            "Start with {T:j_hit_the_road,C:attention}Hit the Road{} and {T:j_family,C:attention}The Family{} ({C:attention}Eternal{} & {C:attention}Pinned{})",
            "Your deck contains only: ",
            "{C:attention}Kings{}, {C:attention}Queens{}, {C:attention}Jacks{} and {C:attention}Twos{}",
        },
        sprite = { x = 5, y = 5 },
        config = {
            jokers = {
                { id = "j_hit_the_road", eternal = true, pinned = true },
                { id = "j_family", eternal = true, pinned = true }
            },
            player_cards_manipulations = {
                {
                    selector = "non_family_ranks",
                    manipulation_type = "remove",
                    manipulation_value = true
                }
            }
        }
    },

    -- Starter Packs

    steelStarterPack = {
        name = "Steel Starter Pack",
        description = {
            "Start with {T:j_steel_joker,C:attention}Steel Joker{} and",
            "2 {T:c_chariot,C:purple}Chariot{} cards"
        },
        sprite = { x = 6, y = 1 },
        config = {
            jokers = {
                { id = "j_steel_joker" }
            },
            consumables = {
                "c_chariot", "c_chariot"
            }
        }
    },

    goldStarterPack = {
        name = "Gold Starter Pack",
        description = {
            "Start with {T:j_ticket,C:attention}Golden Ticket{} and",
            "2 {T:c_devil,C:purple}Devil{} cards"
        },
        sprite = { x = 6, y = 0 },
        config = {
            jokers = {
                { id = "j_ticket" }
            },
            consumables = {
                "c_devil", "c_devil"
            }
        }
    },

    luckyCardStarterPack = {
        name = "Lucky Card Starter Pack",
        description = {
            "Start with {T:j_lucky_cat,C:attention}Lucky Cat{} and",
            "2 {T:c_magician,C:purple}Magician{} cards"
        },
        sprite = { x = 4, y = 1 },
        config = {
            jokers = {
                { id = "j_lucky_cat" }
            },
            consumables = {
                "c_magician", "c_magician"
            }
        }
    },

    glassCardStarterPack = {
        name = "Glass Card Starter Pack",
        description = {
            "Start with {T:j_glass,C:attention}Glass Joker{} and",
            "2 {T:c_justice,C:purple}Justice{} cards"
        },
        sprite = { x = 5, y = 1 },
        config = {
            jokers = {
                { id = "j_glass" }
            },
            consumables = {
                "c_justice", "c_justice"
            }
        }
    }
}

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

----------------------------------------------
------------MOD CODE END----------------------
