fx_version 'cerulean'
game 'gta5'

author 'Matt'
description 'Spawn and greenzone system for FiveM'
version '1.0.0'

lua54 'yes'

client_scripts {
    "config.lua",
    'client.lua',
}

server_scripts {
    'server.lua',
}

shared_script '@ox_lib/init.lua'