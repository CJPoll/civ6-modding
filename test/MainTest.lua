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

-- Can't include yet because we haven't implemented mocks for some things this
-- function depends on.
function PrintsTurnStarting()
  TurnTransition()
  TriggerTurnBegin()
end

Suite("Run", {
  runs_successfully = RunsSuccessfully,
  prints_turn_ending = PrintsTurnEnding,
  prints_turn_staring = PrintsTurnStarting
})
