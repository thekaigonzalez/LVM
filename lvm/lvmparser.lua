
require "lvm"

print("LVM helper Interactive Shell 1.0")
print("type the name of any file (whether it be raw Lua Bytecode, or a Lua source file.")
while true do
    local prompt = readline(">>> ")
    addhistory(prompt)
    if io.open(prompt) ~= nil then
        local work = loadfile(prompt)
        if work == nil then
            print("might be a directory")
        else
            work()
        end
    else
        print("lvm-shell: file not found.")
    end
end