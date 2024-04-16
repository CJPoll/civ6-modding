Enum = {}

print("Loading Enum...");

-- Reduce
--
-- Args:
--   table: Arbitrary table
--   acc: Accumulator for traversal
--
function Enum.reduce(table, acc, func)
  for k, v in pairs(table) do
    print("reduce")
    acc = func(k, v, acc);
  end

  print("1")
  return acc;
end

function Enum.map(table, func)
    print("map")
  return Enum.reduce(table, {}, function(key, value, acc)
    print("mapper")
    val = func(key, value);
  print("1")
    table.insert(acc, val);
  print("2")

    return acc;
  end)
end

function Enum.filter(table, func)
  print("filter")
  return Enum.reduce(table, {}, function(key, element, acc)
    print("filter func")
    if func(key, element) == true then
      print("1")
      table.insert(acc, element);
    end
  print("2")

    return acc;
  end);
end

print("Enum loaded!");
