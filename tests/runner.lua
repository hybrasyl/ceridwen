-- A very small test runner: describe / it / assertions, and a report.
--
-- Deliberately dependency-free so `lua tests/run.lua` works with a stock
-- interpreter and nothing installed.

local runner = { passed = 0, failed = 0, skipped = 0, failures = {} }

local current = ""

local function fail(message)
  error({ __assertion = true, message = message }, 2)
end

function describe(name, body)
  current = name
  body()
  current = ""
end

function it(name, body)
  local ok, err = pcall(body)
  if ok then
    runner.passed = runner.passed + 1
  else
    runner.failed = runner.failed + 1
    local message
    if type(err) == "table" and err.__assertion then
      message = err.message
    else
      message = tostring(err)
    end
    runner.failures[#runner.failures + 1] = { where = current .. " > " .. name, message = message }
  end
end

function skip(name, why)
  runner.skipped = runner.skipped + 1
  print(string.format("  SKIP %s > %s (%s)", current, name, why))
end

-- -- assertions -------------------------------------------------------------

local function render(v)
  if type(v) ~= "table" then return tostring(v) end
  local parts = {}
  for i, x in ipairs(v) do parts[i] = tostring(x) end
  return "{" .. table.concat(parts, ", ") .. "}"
end

function assert_equal(actual, expected, what)
  if actual ~= expected then
    fail(string.format("%s: expected %s, got %s", what or "value", render(expected), render(actual)))
  end
end

function assert_true(actual, what)
  if actual ~= true then
    fail(string.format("%s: expected true, got %s", what or "value", tostring(actual)))
  end
end

function assert_false(actual, what)
  if actual ~= false then
    fail(string.format("%s: expected false, got %s", what or "value", tostring(actual)))
  end
end

function assert_nil(actual, what)
  if actual ~= nil then
    fail(string.format("%s: expected nil, got %s", what or "value", tostring(actual)))
  end
end

function assert_same(actual, expected, what)
  local a, e = render(actual), render(expected)
  if a ~= e then
    fail(string.format("%s:\n      expected %s\n      got      %s", what or "list", e, a))
  end
end

function runner.report()
  print("")
  for _, f in ipairs(runner.failures) do
    print(string.format("FAIL %s\n     %s", f.where, f.message))
  end
  print(string.format("%d passed, %d failed, %d skipped", runner.passed, runner.failed, runner.skipped))
  return runner.failed == 0
end

return runner
