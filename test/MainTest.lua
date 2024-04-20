require "lib/IncludeMock"
include("test/Harness.lua")
include("use_cases/TurnTransition.lua")
include("mock/Events.lua")

function RunsSuccessfully()
  TurnTransition()
end

function PrintsTurnEnding()
  TurnTransition()
  TriggerTurnEnd()
end

Suite("Run", {
  runs_successfully = RunsSuccessfully,
  prints_turn_ending = PrintsTurnEnding
})
