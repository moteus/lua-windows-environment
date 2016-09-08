rocks_trees = {
    { name = [[user]],
        root    = home..[[\5.3\luarocks]],
    },
    { name = [[system]],
        root    = [[c:\luarocks\x64\5.3\systree]],
    },
}
variables = {
    MSVCRT = 'VCRUNTIME140',
    LUALIB = 'lua53.lib'
}
external_deps_dirs = {
    [[c:/luarocks/x64/external]]
}
verbose = false   -- set to 'true' to enable verbose output

