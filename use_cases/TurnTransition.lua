include("lib/Lib.lua");
include("lib/Enum.lua")

function OnTurnBegin()
  print("START OnTurnBegin")
  print('\t', "Index", "ID", "Human?", "Barb?", "Major?", "Minor?")
  players = Enum.filter(Game.GetPlayers(), function(index, player)
    return player:IsMajor()
  end)

  Enum.each(players, function(index, player)
    print('\t', index, player:GetID(), player:IsHuman(), player:IsBarbarian(), player:IsMajor(), "?")
  end)
  print("END OnTurnBegin")
end

function OnTurnEnd()
  print("START OnTurnEnd")
  print("END OnTurnEnd")
end

function TurnTransition()
  print("Running Main")
  print("Adding turn begin")
  Events.TurnBegin.Add(OnTurnBegin);
  print("Adding turn end")
  Events.TurnEnd.Add(OnTurnEnd);
  print("Main Completed")
end
