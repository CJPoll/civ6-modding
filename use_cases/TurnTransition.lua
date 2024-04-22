include("lib/Enum.lua")

function OnTurnBegin()
  print("START OnTurnBegin")
  --print('\t', "Index", "ID", "Human?", "Barb?", "Major?", "Minor?")

  local majorPlayers = Enum.filter(Game.GetPlayers(), function(index, player)
    print("Index", index)
    print("Player", player)
    print("Filtering if is major player")

    Enum.printOut(player, "Major Player")

    return player:IsMajor()
  end)

  local customMajorPlayers =
    Enum.map(majorPlayers, function(index, player)
      return {ID = player:GetID(), Human = player:IsHuman(), Barb = player:IsBarbarian(), Major = player:IsMajor()}
    end)

  Enum.each(customMajorPlayers, function(index, customMajorPlayer)
    Enum.printOut(customMajorPlayer, "Custom Major Player")
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
