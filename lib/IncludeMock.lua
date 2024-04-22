files = {}

-- Exactly the same thing as Lib.includes, but doesn't have to be required and
-- can be included later in the main script.
function bootstrapIncludes(list, value)
  for k,v in pairs(list) do
    if v == value then
      return true
    end
  end

  return false
end

function include(fileName)
  if bootstrapIncludes(files, fileName) then
    return
  else
    print("Including", fileName)
    table.insert(files, fileName)
    local func = assert(loadfile(fileName))
    func()
  end
end
