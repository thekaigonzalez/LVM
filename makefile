dep-d:
	mkdir deps
dep-install:
	wget https://raw.githubusercontent.com/mpeterv/argparse/master/src/argparse.lua -O ./deps/argparse.lua
all:
	luac -o lvm-build ./lvm/lvm-cli/lvm-build.lua
	luac -o lvm-run ./lvm/lvm-cli/lvm-run.lua
	luac -o lvm-invoke-build ./lvm/lvm-invoke-build.lua
	luac -o lvm-invoke-run ./lvm/lvm-invoke-run.lua
	gcc lvm/lvm-c-api.c -shared -lreadline -llua5.4 -fPIC -o ./lvm.so
	luac -o lvm-shell ./lvm/lvmparser.lua