//LVM GNU readline Bindings
//licensed under the GNU General Public license.

#include <lua5.4/lua.h>
#include <lua5.4/lualib.h>
#include <lua5.4/lauxlib.h>
#include <readline/readline.h>
#include <readline/history.h>

#define LUA_REG(x) int x(lua_State* lua)

LUA_REG(readling)
{
    char* b = readline(luaL_checkstring(lua, 1));
    lua_pushstring(lua, b);
    return 1;
}

LUA_REG(addHistory)
{
    add_history(luaL_checkstring(lua, 1));
    return 1;
}

LUA_REG(luaopen_lvm)
{
    lua_register(lua, "readline", readling);
    lua_register(lua, "addhistory", addHistory);
    return 1;
}