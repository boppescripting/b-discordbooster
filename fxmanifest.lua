--[[ FX INFORMATION ]]--
fx_version                  'cerulean'
use_experimental_fxv2_oal   'yes'
lua54                       'yes'
games                       { 'gta5' }

--[[ RESOURCE INFORMATION ]]--
name            'b-discordbooster'
author          'B Scripts'
version         '1.0.0'
description     'A beyond simple free script for server owners to give a reward to their discord boosters!'

--[[ MANIFEST ]]--
dependency      { 'oxmysql' }
escrow_ignore   { 'config.lua' }
server_scripts  { '@oxmysql/lib/MySQL.lua', 'config.lua', 'server/functions.lua', 'server/main.lua' }
