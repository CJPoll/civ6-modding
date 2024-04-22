include("lib/Type.lua")
Enum = {}

-- Reduce
--
-- Args:
--   table: Arbitrary table
--   acc:   Accumulator for traversal
--   func:  A function that takes a key, value, and accumulator and returns a new
--          accumulator
function Enum.reduce(tab, acc, func)
  for k, v in pairs(tab) do
    acc = func(k, v, acc);
  end

  return acc;
end

function Enum.map(tab, func)
  return Enum.reduce(tab, {}, function(key, value, acc)
    val = func(key, value);

    if isNumber(key) then
      table.insert(acc, key, val);
    else
      table.insert(acc, val)
    end

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

function Enum.keys(tab)
  return Enum.map(tab, function(key, value)
    return key
  end)
end

function Enum.values(tab)
  local keys = Enum.keys(tab)

  return Enum.map(keys, function(k, key)
    return tab[key]
  end)
end

function Enum.printOut(list, tableName)
  local keys = Enum.keys(list)
  local values = Enum.values(list)

  print("----")
  print("TABLE:", tableName)
  print(unpack(keys))

  print(unpack(values))
  print("----")
end
