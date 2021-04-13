-- Generate pipes for boblogistics
require("prototypes.flow-control-bob")

-- Overrides Angel's Smelting pipes
if mods ["reskins-angels"] and mods ["angelssmelting"] then
-- if settings.startup[reskins-angels-use-angels-material-colors-pipes].value == true then
	require("prototypes.flow-control-angels-override")
end

-- Remove bob valves
local remove_valve = flow_bob_remove_bob_valve

remove_valve("bob-valve")
remove_valve("bob-overflow-valve")
remove_valve("bob-topup-valve")

-- Reskin valves
local reskin_valve = flow_bob_reskin_valve

if mods ["reskins-bobs"] then
	reskin_valve("check-valve")
	reskin_valve("overflow-valve")
	reskin_valve("underflow-valve")
	reskin_valve("underflow-valve-2")	
end