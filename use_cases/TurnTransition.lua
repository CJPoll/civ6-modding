include("lib/Enum.lua")

function OnTurnBegin()
  print("START OnTurnBegin")
  print('\t', "Index", "ID", "Human?", "Barb?", "Major?", "Minor?")

  local majorPlayers = Enum.filter(Game.GetPlayers(), function(index, player)
    print("Filtering if is major player")
    return player:IsMajor()
  end)

  local customMajorPlayers =
    Enum.map(majorPlayers, function(index, player)
      return {player:GetID(), player:IsHuman(), player:IsBarbarian(), player:IsMajor()}
    end)

  Enum.each(customMajorPlayers, function(index, customMajorPlayer)
    Enum.printOut(customMajorPlayer)
  end)

  Enum.each(customMajorPlayers, function(index, customMajorPlayer)
    print('\t', index, customMajorPlayer[1], customMajorPlayer[2], customMajorPlayer[3], customMajorPlayer[4], "?")
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
