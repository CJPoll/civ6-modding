include("lib/Enum.lua")

Events = {}
Events.TurnBegin = {}
Events.TurnEnd = {}

function Events.TurnBegin.Add(callback)
  table.insert(Events.TurnBegin, callback)
end

function Events.TurnEnd.Add(callback)
  table.insert(Events.TurnEnd, callback)
end

function TriggerTurnBegin()
  Enum.each(Events.TurnBegin, function(key, value) 
    value()
  end)
end

function TriggerTurnEnd()
  print("Triggering Turn End")
  Enum.each(Events.TurnEnd, function(key, value) 
    value()
  end)
end
