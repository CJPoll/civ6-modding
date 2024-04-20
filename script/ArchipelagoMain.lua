if include == nil then
  print("DOING BAD INCLUDE!")
  require "lib/IncludeMock"
  include("mock/Events.lua")
end

include("lib/APHarness.lua")
include("use_cases/TurnTransition.lua")

print("RUNNING AP MAIN")

APMain(TurnTransition)

print("RAN AP MAIN")
