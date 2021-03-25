------------------------------
---- data-final-fixes.lua ----
------------------------------
local make_subgroup = flow_bob_make_subgroup
local assign_subgroup = flow_bob_assign_assign_subgroup
local material_index =
{
	"copper",
	"stone",
	"bronze",
	"steel",
	"plastic",
	"brass",
	"titanium",
	"ceramic",
	"tungsten",
	"nitinol",
	"copper-tungsten"
}

-- Generate subgroups for flow-bob entities and pipes
make_subgroup("valves",				"z-v-01") -- valves
make_subgroup("flow-bob-row-1",		"z-z-01") -- copper
make_subgroup("flow-bob-row-2",		"z-z-02") -- iron
make_subgroup("flow-bob-row-3",		"z-z-03") -- stone
make_subgroup("flow-bob-row-4",		"z-z-04") -- bronze
make_subgroup("flow-bob-row-5",		"z-z-05") -- steel
make_subgroup("flow-bob-row-6",		"z-z-06") -- plastic
make_subgroup("flow-bob-row-7",		"z-z-07") -- brass
make_subgroup("flow-bob-row-8",		"z-z-08") -- titanium
make_subgroup("flow-bob-row-9",		"z-z-09") -- ceramic
make_subgroup("flow-bob-row-10",	"z-z-10") -- tungsten
make_subgroup("flow-bob-row-11",	"z-z-11") -- nitinol
make_subgroup("flow-bob-row-12",	"z-z-12") -- copper-tungsten

-- Assign subgroups to flow-bob valves and pipes
assign_subgroup("void-pump",			"valves", "1") -- Bobplates
assign_subgroup("check-valve",			"valves", "2") -- Flow control
assign_subgroup("overflow-valve",		"valves", "3") -- Flow control
assign_subgroup("underflow-valve",		"valves", "4") -- Flow control
assign_subgroup("underflow-valve-2",	"valves", "5") -- Flow control
assign_subgroup("pipe", 				"flow-bob-row-2", "1") -- Flow control
assign_subgroup("pipe-to-ground",		"flow-bob-row-2", "2") -- Flow control
assign_subgroup("pipe-straight",		"flow-bob-row-2", "3") -- Flow control
assign_subgroup("pipe-junction",		"flow-bob-row-2", "4") -- Flow control
assign_subgroup("pipe-elbow",			"flow-bob-row-2", "5") -- Flow control
for _, material in pairs(material_index) do

	-- Set material order
	if material == "copper"				then row_number = "1" end
	if material == "stone"				then row_number = "3" end
	if material == "bronze"				then row_number = "4" end
	if material == "steel"				then row_number = "5" end
	if material == "plastic"			then row_number = "6" end
	if material == "brass"				then row_number = "7" end
	if material == "titanium"			then row_number = "8" end
	if material == "ceramic"			then row_number = "9" end
	if material == "tungsten"			then row_number = "10" end
	if material == "nitinol"			then row_number = "11" end
	if material == "copper-tungsten"	then row_number = "12" end
	
	-- Assign material order to subgroup (subgroup = crafting menu horizontal row)
	local flow_bob_row = "flow-bob-row-" .. row_number
	
	-- Assign subgroups to generated pipes
	if data.raw.item and data.raw.item[material .. "-pipe"] and data.raw.recipe and data.raw.recipe[material .. "-pipe"] then
		data.raw.item[material .. "-pipe"].order = "1"
		data.raw.item[material .. "-pipe"].subgroup = flow_bob_row
		data.raw.item[material .. "-pipe-to-ground"].order = "2"
		data.raw.item[material .. "-pipe-to-ground"].subgroup = flow_bob_row
		data.raw.item["pipe-" .. material .. "-straight"].order = "3"
		data.raw.item["pipe-" .. material .. "-straight"].subgroup = flow_bob_row
		data.raw.item["pipe-" .. material .. "-junction"].order = "4"
		data.raw.item["pipe-" .. material .. "-junction"].subgroup = flow_bob_row
		data.raw.item["pipe-" .. material .. "-elbow"].order = "5"
		data.raw.item["pipe-" .. material .. "-elbow"].subgroup = flow_bob_row
		------------------------------------------------
		data.raw.recipe[material .. "-pipe"].order = "1"
		data.raw.recipe[material .. "-pipe"].subgroup = flow_bob_row
		data.raw.recipe[material .. "-pipe-to-ground"].order = "2"
		data.raw.recipe[material .. "-pipe-to-ground"].subgroup = flow_bob_row
		data.raw.recipe["pipe-" .. material .. "-straight"].order = "3"
		data.raw.recipe["pipe-" .. material .. "-straight"].subgroup = flow_bob_row
		data.raw.recipe["pipe-" .. material .. "-junction"].order = "4"
		data.raw.recipe["pipe-" .. material .. "-junction"].subgroup = flow_bob_row
		data.raw.recipe["pipe-" .. material .. "-elbow"].order = "5"
		data.raw.recipe["pipe-" .. material .. "-elbow"].subgroup = flow_bob_row
	end
end

-- Generate subgroups for other entities
make_subgroup("storage-tanks",	"a-a-1") -- storage tanks
make_subgroup("pumpjacks-1",	"a-b-1") -- pumpjacks [oil]
make_subgroup("pumpjacks-2",	"a-b-2") -- pumpjacks [water]
make_subgroup("compressors-1",	"a-c-1") -- compressors [gases]
make_subgroup("compressors-2",	"a-c-2") -- compressors [liquids]
make_subgroup("pumps",			"a-d-1") -- pumps
make_subgroup("offshore-pumps",	"a-e-1") -- offshore pumps

-- Assign subgroups to other entities

-- Storage tanks
assign_subgroup("bob-small-inline-storage-tank",	"storage-tanks") -- Bobplates
assign_subgroup("bob-small-storage-tank",			"storage-tanks") -- Bobplates
assign_subgroup("storage-tank",						"storage-tanks") -- Boblogistics
assign_subgroup("storage-tank-2",					"storage-tanks") -- Boblogistics
assign_subgroup("storage-tank-3",					"storage-tanks") -- Boblogistics
assign_subgroup("storage-tank-4",					"storage-tanks") -- Boblogistics
assign_subgroup("bob-storage-tank-all-corners",		"storage-tanks") -- Boblogistics
assign_subgroup("bob-storage-tank-all-corners-2",	"storage-tanks") -- Boblogistics
assign_subgroup("bob-storage-tank-all-corners-3",	"storage-tanks") -- Boblogistics
assign_subgroup("bob-storage-tank-all-corners-4",	"storage-tanks") -- Boblogistics

-- Pumps
assign_subgroup("pump",			"pumps") -- Base
assign_subgroup("bob-pump-2",	"pumps") -- Boblogistics
assign_subgroup("bob-pump-3",	"pumps") -- Boblogistics
assign_subgroup("bob-pump-4",	"pumps") -- Boblogistics

-- Compressors
assign_subgroup("air-pump",			"compressors-1") -- Bobplates
assign_subgroup("air-pump-2",		"compressors-1") -- Bobplates
assign_subgroup("air-pump-3",		"compressors-1") -- Bobplates
assign_subgroup("air-pump-4",		"compressors-1") -- Bobplates
assign_subgroup("water-pump",		"compressors-2") -- Bobplates
assign_subgroup("water-pump-2",		"compressors-2") -- Bobplates
assign_subgroup("water-pump-3",		"compressors-2") -- Bobplates
assign_subgroup("water-pump-4",		"compressors-2") -- Bobplates

-- Pumpjacks
assign_subgroup("pumpjack",			"pumpjacks-1") -- Base
assign_subgroup("bob-pumpjack-1",	"pumpjacks-1") -- Bobmining
assign_subgroup("bob-pumpjack-2",	"pumpjacks-1") -- Bobmining
assign_subgroup("bob-pumpjack-3",	"pumpjacks-1") -- Bobmining
assign_subgroup("bob-pumpjack-4",	"pumpjacks-1") -- Bobmining
assign_subgroup("water-miner-1",	"pumpjacks-2") -- Bobmining
assign_subgroup("water-miner-2",	"pumpjacks-2") -- Bobmining
assign_subgroup("water-miner-3",	"pumpjacks-2") -- Bobmining
assign_subgroup("water-miner-4",	"pumpjacks-2") -- Bobmining
assign_subgroup("water-miner-5",	"pumpjacks-2") -- Bobmining

-- Offshore pumps
assign_subgroup("offshore-pump",			"offshore-pumps") -- Base
assign_subgroup("electric-offshore-pump-1",	"offshore-pumps") -- P-U-M-P-S
assign_subgroup("electric-offshore-pump-2",	"offshore-pumps") -- P-U-M-P-S
assign_subgroup("electric-offshore-pump-3",	"offshore-pumps") -- P-U-M-P-S
assign_subgroup("electric-offshore-pump-4",	"offshore-pumps") -- P-U-M-P-S
------------------------------
assign_subgroup("offshore-pump-2",			"offshore-pumps") -- Higher-tier-offshore-pumps
assign_subgroup("offshore-pump-3",			"offshore-pumps") -- Higher-tier-offshore-pumps
assign_subgroup("offshore-pump-4",			"offshore-pumps") -- Higher-tier-offshore-pumps