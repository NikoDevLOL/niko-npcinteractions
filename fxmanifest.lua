fx_version 'cerulean'
game 'gta5'

lua54 'yes'
author 'Niko (https://github.com/nikodevlol)'

shared_scripts {
    'config.lua',
    '@es_extended/imports.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

ui_page 'html/index.html'
 
files {
    'html/index.html',
    'html/assets/js/*.js',
    'html/assets/css/*.css',
}