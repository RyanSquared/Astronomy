git submodule update
stat_modtime="$(stat -c '%Y' start.sh)"
git pull
if [ "$(stat -c '%Y' start.sh)" -gt "$stat_modtime" ]; then
	./compile.sh -force-compile
	exec start.sh
fi
./compile.sh
stty -echo
if [ ! "$LUA" ]; then
	LUA=lua
fi
$LUA main.lua
