-- init.lua for the Ticker service
return {
	tracelevel = 7,			-- Framework trace level
	name = "TickService",	-- Service name for SCM
	display_name = "TickService - test",	-- Display service name for SCM
	script = "test.lua",	-- Script that runs the service
	-- lua_path = "@!\\lib\\?.lua";
	-- lua_cpath = "!\\lib\\?.dll";
}
