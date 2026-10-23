-- Every formula token in the XML must be one the server defines. The server
-- evaluates a formula with an unknown token to 0.0 and does not report it, so a
-- misspelled token silently turns a heal, a cost or a modifier off.
--
-- This finds misspellings only. A real token in the wrong context (TARGETHP on a
-- self-cast) also evaluates to 0.0, and this spec does not find that.

local xml = require("tests.xml")
local known = require("tests.formula_tokens")

-- An uppercase word that starts with one of these is a formula token.
local PREFIXES = { "SOURCE", "TARGET", "ORIGINALCASTER", "CASTABLE", "MAP", "ITEM", "RAND" }

local function is_token(word)
  if word == "DAMAGE" then return true end
  for _, prefix in ipairs(PREFIXES) do
    if word:sub(1, #prefix) == prefix then return true end
  end
  return false
end

describe("formula tokens", function()
  local files = xml.files("xml")

  if files == nil or #files == 0 then
    skip("every formula token is one the server defines",
      "could not list xml (run from the repo root, needs a POSIX shell)")
    return
  end

  it("uses only tokens the server defines", function()
    local problems = {}
    for _, path in ipairs(files) do
      local f = io.open(path, "r")
      if f ~= nil then
        local line_no = 0
        for line in f:lines() do
          line_no = line_no + 1
          for start, word, after in line:gmatch("()([%u_][%u%d_]*)()") do
            local before = start > 1 and line:sub(start - 1, start - 1) or ""
            local next_char = line:sub(after, after)
            -- Skip words inside a mixed-case identifier, and $ITEM-style
            -- placeholders in localization strings.
            if not before:match("[%w$]") and not next_char:match("%l")
                and is_token(word) and not known[word] then
              problems[#problems + 1] = string.format("%s:%d: %s", path, line_no, word)
            end
          end
        end
        f:close()
      end
    end
    assert_same(problems, {}, "undefined formula tokens")
  end)
end)
