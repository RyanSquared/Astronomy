if [ ! "$LUA" ]; then
	LUA=lua
fi
find tests -type f -name "*.lua" | xargs -n 1 $LUA
