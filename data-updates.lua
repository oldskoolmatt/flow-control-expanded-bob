
-- Generate pipes for boblogistics
require("prototypes.flow-control-bob")

-- Overrides some pipes edited by Angel's Smelting
if mods ["reskins-angels"] and mods ["angelssmelting"] then
	require("prototypes.flow-control-angels-override")
end

-- Remove bob valves
local remove_bob_valve = flow_bob_remove_bob_valve
remove_bob_valve("bob-valve")
remove_bob_valve("bob-overflow-valve")
remove_bob_valve("bob-topup-valve")

-- Valves reskin
if mods ["reskins-bobs"] then
	local reskin_valve = flow_bob_reskin_valve
	reskin_valve("check-valve")
	reskin_valve("overflow-valve")
	reskin_valve("underflow-valve")
	reskin_valve("underflow-valve-2")	
end