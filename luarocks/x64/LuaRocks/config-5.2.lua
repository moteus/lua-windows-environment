rocks_trees = {
    { name = [[user]],
        root    = home..[[\5.2\luarocks]],
    },
    { name = [[system]],
        root    = [[c:\luarocks\x64\5.2\systree]],
    },
}
variables = {
    MSVCRT = 'VCRUNTIME140',
    LUALIB = 'lua52.lib'
}
external_deps_dirs = {
    [[c:/luarocks/x64/external]]
}
verbose = false   -- set to 'true' to enable verbose output

