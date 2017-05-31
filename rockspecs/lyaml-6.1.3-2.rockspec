local MODULE_VERSION = '6.1.3'
local ROCKSPEC_VERSION = '2'
local USE_STATIC_LIBYAML = true

package = 'lyaml'
version = MODULE_VERSION .. '-' .. ROCKSPEC_VERSION

description = {
  summary = 'libYAML binding for Lua',
  detailed = 'Read and write YAML format files with Lua.',
  homepage = 'http://github.com/gvvaughan/lyaml',
  license = 'MIT/X11',
}

source = {
  url = "https://github.com/gvvaughan/lyaml/archive/v" .. MODULE_VERSION .. ".zip",
  dir = "lyaml-" .. MODULE_VERSION,
}

dependencies = {
  'lua >= 5.1, < 5.4',
}

external_dependencies = {
  YAML = {
    library = 'yaml',
  },
  platforms = {
    windows = {
      YAML = {
        library = "libyaml"
      }
    }
  },
}

build = {
  type = 'builtin',
  modules  = {
    ['yaml'] = {
      sources = {
        'ext/yaml/yaml.c',
        'ext/yaml/emitter.c',
        'ext/yaml/parser.c',
        'ext/yaml/scanner.c',
      },
      incdirs   = { "$(YAML_INCDIR)" },
      libdirs   = { "$(YAML_LIBDIR)" },
      defines   = {
        "VERSION=\"" .. MODULE_VERSION .. "\"",
      }
    },
    ['lyaml']            = 'lib/lyaml/init.lua',
    ['lyaml.explicit']   = 'lib/lyaml/explicit.lua',
    ['lyaml.functional'] = 'lib/lyaml/functional.lua',
    ['lyaml.implicit']   = 'lib/lyaml/implicit.lua',
  },
  platforms = {
    windows = { modules = { yaml = {libraries = { "libyaml" } } } },
    unix    = { modules = { yaml = {libraries = { "yaml"    } } } },
  }
}

local function append(t, v) t[#t + 1] = v end
if USE_STATIC_LIBYAML then
  -- required if link against static libyaml (only on Windows/MSVC)
  append(build.modules.yaml.defines, "YAML_DECLARE_STATIC")
end
