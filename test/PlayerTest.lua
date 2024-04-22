require "lib/IncludeMock"
include("test/Harness.lua")

function CreatePlayer()
  local player = Game.Player:new(nil, true, true, false)

  assert(player)

  -- Assert using methods
  assert(player:IsHuman())
  assert(player:IsMajor())
  assert(player:IsBarbarian() == false)

  -- Assert using properties
  assert(player.human)
  assert(player.major)
  assert(player.barbarian == false)
end

Suite("Player", {
  creates_a_player = CreatePlayer()
})
