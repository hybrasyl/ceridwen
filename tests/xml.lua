-- Helpers for specs that read the world XML.

local xml = {}

local function listing(command)
  local pipe = io.popen(command)
  if pipe == nil then return nil end
  local out = {}
  for raw in pipe:lines() do
    local path = raw:gsub("\\", "/")
    -- The server does not load deprecated/ or any *.ignore/ directory.
    if path:match("%.xml$") and not path:match("/[Dd]eprecated/") and not path:match("%.ignore/") then
      out[#out + 1] = path
    end
  end
  pipe:close()
  if #out == 0 then return nil end
  return out
end

--- List every .xml the server loads under dir (e.g. "xml/castables"). Lua has no
--- stdlib directory walk, so shell out -- POSIX first, then cmd.exe for Windows
--- dev machines. Returns nil if neither works, so the caller can skip.
function xml.files(dir)
  local find = 'find ' .. dir .. ' -name "*.xml" 2>/dev/null'
  if package.config:sub(1, 1) == "\\" then
    return listing('dir /b /s ' .. dir:gsub("/", "\\") .. '\\*.xml 2>nul') or listing(find)
  end
  return listing(find)
end

return xml
