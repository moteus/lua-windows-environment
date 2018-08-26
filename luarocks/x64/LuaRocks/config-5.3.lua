local LUA_VER  = "5.3"
local LUA_ARCH = "x64"
local BASE_DIR = [[c:\luarocks]]

local LUA_SHORT_VER = LUA_VER:gsub("%.", "")
local ARCH_DIR      = BASE_DIR .. [[\]] .. LUA_ARCH
local LUA_DIR       = ARCH_DIR .. [[\]] .. LUA_VER
local EXT_DIR       = ARCH_DIR .. [[\external]]

rocks_trees = {
    { name = [[user]],
        root    = home..[[\]] .. LUA_VER .. [[\luarocks]],
    },
    { name = [[system]],
        root    = LUA_DIR .. [[\systree]],
    },
}

local LUA_INTERPRETER  = 'lua' .. LUA_SHORT_VER .. '.exe'

variables = {
    MSVCRT           = 'VCRUNTIME140',
    LUALIB           = 'lua' .. LUA_SHORT_VER .. '.lib',
    LUA_INTERPRETER  = LUA_INTERPRETER,
    LUA_DIR          = LUA_DIR,
    LUA_INCDIR       = LUA_DIR .. [[\include\]],
    LUA_LIBDIR       = LUA_DIR .. [[\lib\]],
    LUA_BINDIR       = LUA_DIR .. [[\bin]],
    LUA              = LUA_DIR .. [[\bin\]] .. LUA_INTERPRETER,
    LUA_VER          = LUA_VER,
    LUA_SUFFIX       = LUA_SHORT_VER,
}

external_deps_dirs = {
    (EXT_DIR:gsub("\\", "/"))
}

verbose = false   -- set to 'true' to enable verbose output
