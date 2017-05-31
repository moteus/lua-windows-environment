package = "lua-cjson"
version = "2.1.0-1"

source = {
    url = "http://www.kyne.com.au/~mark/software/download/lua-cjson-2.1.0.zip",
}

description = {
    summary = "A fast JSON encoding/parsing module",
    detailed = [[
        The Lua CJSON module provides JSON support for Lua. It features:
        - Fast, standards compliant encoding/parsing routines
        - Full support for JSON with UTF-8, including decoding surrogate pairs
        - Optional run-time support for common exceptions to the JSON specification
          (infinity, NaN,..)
        - No dependencies on other libraries
    ]],
    homepage = "http://www.kyne.com.au/~mark/software/lua-cjson.php",
    license = "MIT"
}

dependencies = {
    "lua >= 5.1"
}

build = {
    type = "builtin",
    modules = {
        cjson = {
            sources = { "lua_cjson.c", "strbuf.c", "fpconv.c" },
            defines = {
-- LuaRocks does not support platform specific configuration for Solaris.
-- Uncomment the line below on Solaris platforms if required.
--                "USE_INTERNAL_ISINF"
            }
        }
    },
    install = {
        lua = {
            ["cjson.util"] = "lua/cjson/util.lua"
        },
        bin = {
            json2lua = "lua/json2lua.lua",
            lua2json = "lua/lua2json.lua"
        }
    },
    -- Override default build options (per platform)
    platforms = {
        win32 = { modules = { cjson = { defines = {
            "DISABLE_INVALID_NUMBERS"
        } } } }
    },
    copy_directories = { "tests" },
    patches = {
        ["pr1.diff"] = [[--- a/fpconv.c
+++ b/fpconv.c
@@ -35,6 +35,10 @@
 
 #include "fpconv.h"
 
+#ifdef _MSC_VER
+#define snprintf _snprintf
+#endif
+
 /* Lua CJSON assumes the locale is the same for all threads within a
  * process and doesn't change after initialisation.
  *
@@ -124,7 +128,7 @@ double fpconv_strtod(const char *nptr, char **endptr)
     /* Duplicate number into buffer */
     if (buflen >= FPCONV_G_FMT_BUFSIZE) {
         /* Handle unusually large numbers */
-        buf = malloc(buflen + 1);
+        buf = (char *)malloc(buflen + 1);
         if (!buf) {
             fprintf(stderr, "Out of memory");
             abort();
@@ -196,10 +200,12 @@ int fpconv_g_fmt(char *str, double num, int precision)
     return len;
 }
 
+#ifndef USE_INTERNAL_FPCONV
 void fpconv_init()
 {
     fpconv_update_locale();
 }
+#endif
 
 /* vi:ai et sw=4 ts=4:
  */
diff --git a/fpconv.h b/fpconv.h
index 0124908..b3e2c3c 100644
--- a/fpconv.h
+++ b/fpconv.h
@@ -6,6 +6,10 @@
  * -1.7976931348623e+308 */
 # define FPCONV_G_FMT_BUFSIZE   32
 
+#ifdef _MSC_VER
+#define inline 
+#endif
+
 #ifdef USE_INTERNAL_FPCONV
 static inline void fpconv_init()
 {
diff --git a/lua_cjson.c b/lua_cjson.c
index c14a1c5..5ede8df 100644
--- a/lua_cjson.c
+++ b/lua_cjson.c
@@ -40,7 +40,13 @@
 #include <string.h>
 #include <math.h>
 #include <limits.h>
+
+#ifdef __cplusplus
+#include <lua.hpp>
+#else
 #include <lua.h>
+#endif
+
 #include <lauxlib.h>
 
 #include "strbuf.h"
@@ -59,6 +65,14 @@
 #define isinf(x) (!isnan(x) && isnan((x) - (x)))
 #endif
 
+#ifdef _MSC_VER
+#define snprintf _snprintf
+#define strncasecmp _strnicmp
+#include <float.h>
+#define isnan(x) _isnan(x)
+#define isinf(x) (!isnan(x) && isnan((x) - (x)))
+#endif
+
 #define DEFAULT_SPARSE_CONVERT 0
 #define DEFAULT_SPARSE_RATIO 2
 #define DEFAULT_SPARSE_SAFE 10
@@ -193,7 +207,7 @@ static json_config_t *json_fetch_config(lua_State *l)
 {
     json_config_t *cfg;
 
-    cfg = lua_touserdata(l, lua_upvalueindex(1));
+    cfg = (json_config_t *)lua_touserdata(l, lua_upvalueindex(1));
     if (!cfg)
         luaL_error(l, "BUG: Unable to fetch CJSON configuration");
 
@@ -360,7 +374,7 @@ static int json_destroy_config(lua_State *l)
 {
     json_config_t *cfg;
 
-    cfg = lua_touserdata(l, 1);
+    cfg = (json_config_t *)lua_touserdata(l, 1);
     if (cfg)
         strbuf_free(&cfg->encode_buf);
     cfg = NULL;
@@ -373,7 +387,7 @@ static void json_create_config(lua_State *l)
     json_config_t *cfg;
     int i;
 
-    cfg = lua_newuserdata(l, sizeof(*cfg));
+    cfg = (json_config_t *)lua_newuserdata(l, sizeof(*cfg));
 
     /* Create GC method to clean up strbuf */
     lua_newtable(l);
@@ -1407,7 +1421,13 @@ static int lua_cjson_safe_new(lua_State *l)
     return 1;
 }
 
-int luaopen_cjson(lua_State *l)
+#ifdef _MSC_VER
+#define EXPORT_API __declspec(dllexport) 
+#else
+#define EXPORT_API 
+#endif
+
+int EXPORT_API luaopen_cjson(lua_State *l)
 {
     lua_cjson_new(l);
 
@@ -1421,7 +1441,7 @@ int luaopen_cjson(lua_State *l)
     return 1;
 }
 
-int luaopen_cjson_safe(lua_State *l)
+int EXPORT_API luaopen_cjson_safe(lua_State *l)
 {
     lua_cjson_safe_new(l);
 
diff --git a/strbuf.c b/strbuf.c
index f0f7f4b..147f27a 100644
--- a/strbuf.c
+++ b/strbuf.c
@@ -58,7 +58,7 @@ void strbuf_init(strbuf_t *s, int len)
     s->reallocs = 0;
     s->debug = 0;
 
-    s->buf = malloc(size);
+    s->buf = (char *)malloc(size);
     if (!s->buf)
         die("Out of memory");
 
@@ -69,7 +69,7 @@ strbuf_t *strbuf_new(int len)
 {
     strbuf_t *s;
 
-    s = malloc(sizeof(strbuf_t));
+    s = (strbuf_t *)malloc(sizeof(strbuf_t));
     if (!s)
         die("Out of memory");
 
@@ -173,7 +173,7 @@ void strbuf_resize(strbuf_t *s, int len)
     }
 
     s->size = newsize;
-    s->buf = realloc(s->buf, s->size);
+    s->buf = (char *)realloc(s->buf, s->size);
     if (!s->buf)
         die("Out of memory");
     s->reallocs++;
@@ -221,12 +221,12 @@ void strbuf_append_fmt(strbuf_t *s, int len, const char *fmt, ...)
 void strbuf_append_fmt_retry(strbuf_t *s, const char *fmt, ...)
 {
     va_list arg;
-    int fmt_len, try;
+    int fmt_len, attempt;
     int empty_len;
 
     /* If the first attempt to append fails, resize the buffer appropriately
      * and try again */
-    for (try = 0; ; try++) {
+    for (attempt = 0; ; attempt++) {
         va_start(arg, fmt);
         /* Append the new formatted string */
         /* fmt_len is the length of the string required, excluding the
@@ -238,7 +238,7 @@ void strbuf_append_fmt_retry(strbuf_t *s, const char *fmt, ...)
 
         if (fmt_len <= empty_len)
             break;  /* SUCCESS */
-        if (try > 0)
+        if (attempt > 0)
             die("BUG: length of formatted string changed");
 
         strbuf_resize(s, s->length + fmt_len);
diff --git a/strbuf.h b/strbuf.h
index d861108..05b4878 100644
--- a/strbuf.h
+++ b/strbuf.h
@@ -48,6 +48,10 @@ typedef struct {
 #define STRBUF_DEFAULT_INCREMENT -2
 #endif
 
+#ifdef _MSC_VER
+#define inline 
+#endif
+
 /* Initialise */
 extern strbuf_t *strbuf_new(int len);
 extern void strbuf_init(strbuf_t *s, int len);]];
    }
}

-- vi:ai et sw=4 ts=4:
