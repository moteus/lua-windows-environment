rocks_trees = {
    { name = [[user]],
        root    = home..[[\5.1\luarocks]],
    },
    { name = [[system]],
        root    = [[c:\luarocks\x64\5.1\systree]],
    },
}
variables = {
    MSVCRT = 'VCRUNTIME140',
    LUALIB = 'lua51.lib'
}
external_deps_dirs = {
    [[c:/luarocks/x64/external]]
}
verbose = false   -- set to 'true' to enable verbose output

