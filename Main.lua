-- Main
-- Author: cjpoll
-- DateCreated: 3/30/2024 6:29:37 PM
--------------------------------------------------------------

print("HELLO WORLD");

include("Lib.lua");
include("Enum.lua")

printLoaded();

function OnTurnBegin()
  -- enum.filter(GameCore.Players.players, function(key, element)
  --   element.is
  -- end)
  print("Getting")
  var = GameCore.Players
  print("Got")

  Enum.map(GameCore.Players, function(key, element)
    print('\t', key, value)
    return value
  end)
  print("New Turn Started UPDATED");
end

function OnTurnEnd()
  print("Turn Ending UPDATED");
end

Events.TurnBegin.Add(OnTurnBegin);
Events.TurnEnd.Add(OnTurnEnd);
