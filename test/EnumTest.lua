require "lib/IncludeMock"
include("test/Harness.lua")
include("lib/Enum.lua")

function ReduceSum()
  local table = {1, 2, 3, 4, 5, 6}
  sum =
    Enum.reduce(table, 0, function(key, value, acc) 
      return acc + value
    end)

  expected = 21

  assert(sum == expected)
end

function MapTest()
  local inputTable = {1, 2, 3, 4, 5}

  -- Remember that lua arrays are 1-indexed, not 0-indexed
  assert(inputTable[1] == 1)

  local outputTable =
    Enum.map(inputTable, function(n)
      return n * 2
    end)

  assert(outputTable[1] == 2)
  assert(outputTable[2] == 4)
  assert(outputTable[3] == 6)
  assert(outputTable[4] == 8)
  assert(outputTable[5] == 10)
end

function EachTest()
  -- For now, I haven't intercepted logging. I'll just manually look at the
  -- output when this test runs to verify that it's logging as expected
  local table = {1, 2, 3, 4, 5, "hello"}

  Enum.each(table, function(key, value)
    print("KEY: ", key, "VALUE: ", value)
  end)
end

function FilterTest()
  -- For now, I haven't intercepted logging. I'll just manually look at the
  -- output when this test runs to verify that it's logging as expected
  local table = {1, 2, 3, 4, 5}

  local outputTable =
    Enum.filter(table, function(key, value)
      return value >= 3
    end)

  assert(outputTable[1] == 3)
  assert(outputTable[2] == 4)
  assert(outputTable[3] == 5)
end

function IncludesTest()
  local table = {1, 2, 3, 4, 5}

  assert(Enum.includes(table, 0) == false)
  assert(Enum.includes(table, 1))
  assert(Enum.includes(table, 5))
  assert(Enum.includes(table, 6) == false)
end

Suite("reduce", { reduce_sum = ReduceSum,
  map_test = MapTest,
  each_test = EachTest,
  filter_test = FilterTest,
  includes_test = IncludesTest
})
