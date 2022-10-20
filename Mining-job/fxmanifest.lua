fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'ArielZ'
description 'OverTrue RolePlay Mining-Job.'
version '1.0.0'

dependency 'Rocks'


shared_scripts { 
	'main/config.lua',
	--'@es_extended/imports.lua',
}


client_scripts {
	'main/cl_mining.lua',
}

server_scripts {
	'main/sv_mining.lua',
}
