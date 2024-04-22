if Game == nil then
  Game = {}
end

ID = 0

function GenerateID()
  ID = ID + 1
  return ID
end

Game.Player = {id = 0, human = false, major = false, barbarian = false}

function Game.Player:new (o, human, major, barbarian)
  local o = o or {}
  setmetatable(o, self)
  self.__index = self

  self.id = GenerateID
  self.human = human
  self.major = major
  self.barbarian = barbarian

  return o
end

function Game.Player:IsHuman()
  return self.human
end

function Game.Player:IsMajor()
  return self.major
end

function Game.Player:IsBarbarian()
  return self.barbarian
end

function Game.Player:GetID()
  return self.id
end

function HumanPlayer()
  return Game.Player:new(nil, true, true, false)
end

function Game.GetPlayers()
  return {
    HumanPlayer()
  }
end
