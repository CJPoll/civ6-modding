include("lib/Enum.lua")

tests = {}

function Suite(name, table)
  Enum.each(table, function(test_name, test_function)
    print("")
    print("Running test: ", test_name)
    test_function()
    print("Test: ", test_name, " COMPLETE!")
  end)
end
