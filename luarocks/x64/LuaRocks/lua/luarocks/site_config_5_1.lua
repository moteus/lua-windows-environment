local LUA_DIR = [[c:\luarocks\x64\5.1]]
local LR_DIR = [[c:\luarocks\x64\LuaRocks]]

local site_config = {}
site_config.LUA_INCDIR=LUA_DIR .. [[\include\]]
site_config.LUA_LIBDIR=LUA_DIR .. [[\lib\]]
site_config.LUA_BINDIR=LUA_DIR .. [[\bin]]
site_config.LUA_INTERPRETER=[[lua51.exe]]
site_config.LUAROCKS_UNAME_S=[[WindowsNT]]
site_config.LUAROCKS_UNAME_M=[[x86_64]]
site_config.LUAROCKS_ROCKS_TREE=LUA_DIR .. [[\systree]]
site_config.LUAROCKS_PREFIX=LR_DIR
site_config.LUAROCKS_DOWNLOADER=[[wget]]
site_config.LUAROCKS_MD5CHECKER=[[md5sum]]
return site_config
