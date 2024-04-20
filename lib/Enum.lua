Enum = {}

-- Reduce
--
-- Args:
--   table: Arbitrary table
--   acc: Accumulator for traversal
--
function Enum.reduce(table, acc, func)
  for k, v in pairs(table) do
    acc = func(k, v, acc);
  end

  return acc;
end

function Enum.map(table, func)
  return Enum.reduce(table, {}, function(key, value, acc)
    val = func(key, value);
    table.insert(acc, val);

    return acc;
  end)
end

function Enum.each(table, func)
  Enum.reduce(table, {}, function(key, value, acc)
    func(key, value);
  end)

  return true;
end

function Enum.filter(table, func)
  return Enum.reduce(table, {}, function(key, value, acc)
    if func(key, value) == true then
      table.insert(acc, key, value);
    end

    return acc;
  end);
end
