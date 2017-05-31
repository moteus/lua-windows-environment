package="alien"
version="scm-0"
source = {
  url = "git+https://github.com/moteus/alien.git",
  branch = "master"
}
description = {
  summary = "Lua->C FFI",
  detailed = [[
    Alien lets a Lua application call load dynamic libraries and call C functions
    in a portable way, using libffi.
  ]],
  license = "MIT/X11",
  homepage = "http://mascarenhas.github.com/alien"
}
dependencies = {
  "lua >= 5.1"
}
external_dependencies = {
  FFI = { library = "ffi" }
}
build = {
  type = "command",
  build_command = "./bootstrap && ./configure LUA=$(LUA) CPPFLAGS='-I$(LUA_INCDIR) -I$(FFI_INCDIR)' LDFLAGS=-L$(FFI_LIBDIR) --prefix=$(PREFIX) --libdir=$(LIBDIR) --datadir=$(LUADIR) && make clean && make",
  install_command = "make install",
  copy_directories = {},

  platforms = { windows = {
    type = "builtin",
    copy_directories = {},
    modules = {
      alien_c = {
        sources = {"src/alien.c"},
        defines = {"FFI_BUILDING", "WINDOWS"},
        libraries = {"ffi"},
        incdirs = {"$(FFI_INCDIR)"},
        libdirs = {"$(FFI_LIBDIR)"}
      },
      alien = 'src/alien.lua',
    }
  }}
}
