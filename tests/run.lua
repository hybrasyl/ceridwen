-- Entry point for the ceridwen tests. Run from the repo root:
--
--   lua tests/run.lua
--
-- Add a spec by dropping a file in tests/spec/ and listing it below.

package.path = "./?.lua;" .. package.path

local runner = require("tests.runner")

local SPECS = {
  "formula_tokens",
}

for _, name in ipairs(SPECS) do
  print("== " .. name)
  require("tests.spec." .. name .. "_spec")
end

os.exit(runner.report() and 0 or 1)
