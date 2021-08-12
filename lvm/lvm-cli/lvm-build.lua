package.path = package.path .. ";./deps/?.lua"

local argparse = require "argparse"

local parser = argparse("lvm-build", "Build applications on the Lua VM.")

parser:argument("FILE", "The file to run.")
parser:option("-I --include", "a file to include (must be absolute path to a file)")
parser:option("-o --output", "The output file.", "a.byte")
local args = parser:parse()

for i in ipairs(args.include) do
    loadfile(i)()
end

os.execute("/usr/bin/luac -o " .. args.output .. " " .. args.FILE)