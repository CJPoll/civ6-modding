Enum = {}

-- Reduce
--
-- Args:
--   table: Arbitrary table
--   acc: Accumulator for traversal
--
function Enum.reduce(tab, acc, func)
  for k, v in pairs(tab) do
    acc = func(k, v, acc);
  end

  return acc;
end

function Enum.map(tab, func)
  return Enum.reduce(tab, {}, function(key, value, acc)
    val = func(key, value);
    table.insert(acc, key, val);

    return acc;
  end)
end

function Enum.each(tab, func)
  Enum.reduce(tab, {}, function(key, value, acc)
    func(key, value);
  end)

  return true;
end

function Enum.filter(tab, func)
  return Enum.reduce(tab, {}, function(key, value, acc)
    if func(key, value) == true then
      table.insert(acc, value);
    end

    return acc;
  end);
end

function Enum.includes(list, value)
  for k,v in pairs(list) do
    if v == value then
      return true
    end
  end

  return false
end

function Enum.printOut(list)
  Enum.each(list, function(key, value)
    print("KEY: ", key, "VALUE: ", value)
  end)
end
