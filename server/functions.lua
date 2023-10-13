local QBCore = exports['qb-core']:GetCoreObject()

function ObtainDiscordIdentifier(src)
    local discord = QBCore.Functions.GetIdentifier(src, 'discord')
    return string.sub(discord, 9)
end

function Notify(src, text, notifType)
    QBCore.Functions.Notify(src, text, notifType)
end

function ProduceReward(src)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return false end

    if Config.Reward.type == 'bank' then
        Player.Functions.AddMoney('bank', Config.Reward.amount, 'Discord Booster Reward')
        return true
    elseif Config.Reward.type == 'cash' then
        Player.Functions.AddMoney('cash', Config.Reward.amount, 'Discord Booster Reward')
        return true
    elseif Config.Reward.type == 'item' then
        Player.Functions.AddItem(Config.Reward.item, Config.Reward.amount, nil, {})
        return true
    end

    print('b-discordbooster | INVALID REWARD TYPE')
    return false
end