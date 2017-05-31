package = "luuid"
version = "20120501-2"
source = {
   url = "http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/5.1/luuid.tar.gz",
   md5 = "28273187c1f8176e98f959889d6abdbc",
   dir = "uuid"
}
description = {
   summary = "A library for UUID generation",
   detailed = [[
      A library for generating universally unique identifiers based on
      libuuid, which is part of e2fsprogs.
   ]],
   homepage = "http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/#luuid",
   license = "Public domain"
}
dependencies = {
   "lua ~> 5.1"
}
external_dependencies = {
   platforms = {
      unix = {
         LIBUUID = {
            header = "uuid/uuid.h",
            library = "libuuid.so"
         }
      }
   }
}
build = {
   type = "builtin",
   platforms = {
      win32 = {
         modules = {
            uuid = {
               libraries = {
                  "rpcrt4",
               },
               sources = {
                  "luuid.c",
                  "wuuid.c",
               }
            }
         }
      },
      unix = {
         modules = {
            uuid = {
               libraries = {
                  "uuid", 
               },
               sources = {
                  "luuid.c",
               }
            }
         }
      }
   };
   patches = {
      ["wuuid.diff"] = [[--- wuuid.h	Tue Sep 25 02:25:11 2007
+++ wuuid.h	Sun Aug 21 00:36:43 2016
@@ -19,7 +19,9 @@
 #include <windows.h>
 #include <rpc.h>
 #endif
+#ifndef _MSC_VER
 #include <sys/time.h>
+#endif
 
 /*
  * Fix declaration of uuid_t (possibly made in <basetypes.h> included]]
   }
}
