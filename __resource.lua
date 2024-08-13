resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'html/index.html'

shared_scripts {'config.lua', '@ox_lib/init.lua'}

files {'html/index.html', 'html/style.css', 'html/script.js'}

client_script {'client/*.lua'}
server_script {'server/*.lua', '@mysql-async/lib/MySQL.lua'}

game 'gta5'
lua54 'yes'
