-- Generate pipes for boblogistics
require("prototypes.flow-control-bob")

-- Conform pipe materials to those added by reskins-angels
require("prototypes.flow-control-angels-override")

-- Remove bob valves
local remove_valve = require("utils.lib").remove_bob_valve

remove_valve("bob-valve")
remove_valve("bob-overflow-valve")
remove_valve("bob-topup-valve")

-- Reskin valves
if mods ["reskins-bobs"] then
	local reskin_valve = require("utils.lib").reskin_valve

	reskin_valve("check-valve")
	reskin_valve("overflow-valve")
	reskin_valve("underflow-valve")
	reskin_valve("underflow-valve-2")
end