-- Functions
function CollectedThisMonth(discord)
    local row = MySQL.query.await('SELECT * FROM b_discordbooster WHERE discord=?', { discord })
    if not row[1] then return false end
    local currentMonth = os.date('*t').month
    if row[1].last_month_collected == currentMonth then return true end
    return false
end

function UpdateLastCollectedMonth(discord)
    local currentMonth = os.date('*t').month
    MySQL.query('INSERT INTO b_discordbooster (discord, last_month_collected) VALUES (?, ?) ON DUPLICATE KEY UPDATE last_month_collected=?', { discord, currentMonth, currentMonth })
end

-- Commands
RegisterCommand('checkboost', function(source)
    local src = source
    local discord = ObtainDiscordIdentifier(src)
    local url = string.format('https://discord.com/api/v9/guilds/%s/members/%s', Config.DiscordGuildID, tostring(discord))
    print(discord)

    PerformHttpRequest(url, function (errorCode, rdata, resultHeaders)
        local res = json.decode(rdata)
        if errorCode == 200 then
            if res.premium_since then
                if not CollectedThisMonth(discord) then
                    if ProduceReward(src) then
                        Notify(src, 'Thank you for supporting us!', 'success')
                        return UpdateLastCollectedMonth(discord)
                    else
                        return Notify(src, 'Please advise a server admin to check the console.', 'error')
                    end
                else
                    return Notify(src, 'You\'ve already collected your reward this month.', 'error')
                end
            end
        else
            print(errorCode)
        end
    end, "GET", "", {["Content-type"] = "application/json", ["Authorization"] = string.format('Bot %s', Config.DiscordBotToken)})
end, false)