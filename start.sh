git pull --recurse-submodules
stat_modtime="$(stat -c '%Y' start.sh)"
if [ "$(stat -c '%Y' start.sh)" -gt "$stat_modtime" ]; then
	exec start.sh
fi
./compile.sh
stty -echo
lua main.lua
