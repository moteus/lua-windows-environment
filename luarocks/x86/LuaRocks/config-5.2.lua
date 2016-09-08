rocks_trees = {
    { name = [[user]],
        root    = home..[[\5.2\luarocks]],
    },
    { name = [[system]],
        root    = [[c:\luarocks\x86\5.2\systree]],
    },
}
variables = {
    MSVCRT = 'MSVCR100',
    LUALIB = 'lua52.lib'
}
external_deps_dirs = {
    [[c:/luarocks/x86/external]]
}
verbose = false   -- set to 'true' to enable verbose output

