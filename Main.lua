-- Main
-- Author: cjpoll
-- DateCreated: 3/30/2024 6:29:37 PM
--------------------------------------------------------------
require "Lib"

print("HELLO WORLD");
printLoaded();

function OnTurnBegin()
  print("New Turn Started UPDATED");
end

function OnTurnEnd()
  print("Turn Ending UPDATED");
end

Events.TurnBegin.Add(OnTurnBegin);
Events.TurnEnd.Add(OnTurnEnd);
