---------------------------------------------------------------
-- THIS IS THE SUPER-DUPER-VALVE-NUKER! YES! THAT'S CORRECT! --
---------------------------------------------------------------

local function super_duper_valve_nuker()

	local valve_nuke_list =
	{
		["bob-valve"] = "flowbob-check-valve", -- Bob
		["bob-overflow-valve"] = "flowbob-overflow-valve", -- Bob
		["bob-topup-valve"] = "flowbob-topup-valve-1", -- Bob
		["valve-return"] = "flowbob-check-valve", -- Angels
		["valve-overflow"] = "flowbob-overflow-valve", -- Angels
		["valve-underflow"] = "flowbob-topup-valve-2", -- Angels
		["check-valve"] = "flowbob-check-valve", -- Flow Control
		["overflow-valve"] = "flowbob-overflow-valve", -- Flow Control
		["underflow-valve"] = "flowbob-topup-valve-2" -- Flow Control
	}
	
	local nuke_entity = require("utils.lib").nuke_entity
	
	-- NUKE'EM HIGH!!!
	for old_valve, new_valve in pairs(valve_nuke_list) do
		nuke_entity(old_valve, new_valve, "storage-tank")
	end
end

super_duper_valve_nuker() -- Just because... https://www.youtube.com/watch?v=X0fp-kq-0Fw