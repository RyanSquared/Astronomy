local astronomy = require('astronomy')
local lfs = require('lfs')
if not (lfs.attributes('subprograms', 'mode') == 'directory') then
  error('Unable to locate subprograms directory')
end
local dir = lfs.currentdir()
for program in lfs.dir('subprograms') do
  local _continue_0 = false
  repeat
    if program:sub(1, 1) == '.' then
      _continue_0 = true
      break
    end
    lfs.chdir('subprograms/' .. program)
    local func = assert(loadfile('main.lua'))
    func()
    lfs.chdir(dir)
    _continue_0 = true
  until true
  if not _continue_0 then
    break
  end
end
return astronomy:loop()
