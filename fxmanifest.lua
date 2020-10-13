fx_version 'adamant'

game 'gta5'

description "DokaDoka's Outlaw Alerts"

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
	'server/sounds.lua'
}

client_scripts {
	'client/main.lua',
	'config.lua'
}
