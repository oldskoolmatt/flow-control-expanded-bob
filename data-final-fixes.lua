------------------------------
---- data-final-fixes.lua ----
------------------------------

-- Fetch functions from library
local make_subgroup = require("utils.lib").make_subgroup
local assign_subgroup = require("utils.lib").assign_subgroup

local materials = {
	["copper"] = {row = 1},
	["stone"] = {row = 3},
	["bronze"] = {row = 4},
	["steel"] = {row = 5},
	["plastic"] = {row = 6},
	["brass"] = {row = 7},
	["titanium"] = {row = 8},
	["ceramic"] = {row = 9},
	["tungsten"] = {row = 10},
	["nitinol"] = {row = 11},
	["copper-tungsten"] = {row = 12},
}

-- Generate subgroups for bob pipes
make_subgroup("valves",			"z-v-01") -- valves
make_subgroup("pipes-row-1",	"z-z-01") -- copper
make_subgroup("pipes-row-2",	"z-z-02") -- iron
make_subgroup("pipes-row-3",	"z-z-03") -- stone
make_subgroup("pipes-row-4",	"z-z-04") -- bronze
make_subgroup("pipes-row-5",	"z-z-05") -- steel
make_subgroup("pipes-row-6",	"z-z-06") -- plastic
make_subgroup("pipes-row-7",	"z-z-07") -- brass
make_subgroup("pipes-row-8",	"z-z-08") -- titanium
make_subgroup("pipes-row-9",	"z-z-09") -- ceramic
make_subgroup("pipes-row-10",	"z-z-10") -- tungsten
make_subgroup("pipes-row-11",	"z-z-11") -- nitinol
make_subgroup("pipes-row-12",	"z-z-12") -- copper-tungsten

-- Assign subgroup to valves
assign_subgroup("check-valve",			"valves") -- Flow control
assign_subgroup("overflow-valve",		"valves") -- Flow control
assign_subgroup("underflow-valve",		"valves") -- Flow control
assign_subgroup("underflow-valve-2",	"valves") -- Flow control
assign_subgroup("void-pump",			"valves") -- Flow control

-- Assign subgroup to pipes
assign_subgroup("pipe", 			"pipes-row-2", "1") -- Base
assign_subgroup("pipe-to-ground", 	"pipes-row-2", "2") -- Base
assign_subgroup("pipe-straight",	"pipes-row-2", "3") -- Flow control
assign_subgroup("pipe-junction",	"pipes-row-2", "4") -- Flow control
assign_subgroup("pipe-elbow",		"pipes-row-2", "5") -- Flow control
for material, parameters in pairs(materials) do
	-- Assign material to row
	local subgroup_row = "pipes-row-"..parameters.row

	-- Assign subgroup
	assign_subgroup(material.."-pipe",				subgroup_row, "1") -- pipe
	assign_subgroup(material.."-pipe-to-ground",	subgroup_row, "2") -- pipe to ground
	assign_subgroup("pipe-"..material.."-straight", subgroup_row, "3") -- straight
	assign_subgroup("pipe-"..material.."-junction", subgroup_row, "4") -- junction
	assign_subgroup("pipe-"..material.."-elbow", 	subgroup_row, "5") -- elbow
end

-- Generate subgroups for other entities
make_subgroup("storage-tanks",	"a-a-1") -- storage tanks
make_subgroup("pumpjacks-1",	"a-b-1") -- pumpjacks
make_subgroup("pumpjacks-2",	"a-b-2") -- pumpjacks
make_subgroup("compressors-1",	"a-c-1") -- compressors
make_subgroup("compressors-2",	"a-c-2") -- compressors
make_subgroup("pumps",			"a-d-1") -- pumps
make_subgroup("offshore-pumps",	"a-e-1") -- offshore pumps

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
assign_subgroup("air-pump",		"compressors-1") -- Bobplates
assign_subgroup("air-pump-2",	"compressors-1") -- Bobplates
assign_subgroup("air-pump-3",	"compressors-1") -- Bobplates
assign_subgroup("air-pump-4",	"compressors-1") -- Bobplates
assign_subgroup("water-pump",	"compressors-2") -- Bobplates
assign_subgroup("water-pump-2",	"compressors-2") -- Bobplates
assign_subgroup("water-pump-3",	"compressors-2") -- Bobplates
assign_subgroup("water-pump-4",	"compressors-2") -- Bobplates

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
if not mods ["P.U.M.P.S."] then
	assign_subgroup("offshore-pump",	"offshore-pumps") -- Base
end

assign_subgroup("offshore-pump-1",		"offshore-pumps") -- P-U-M-P-S
assign_subgroup("offshore-pump-2",		"offshore-pumps") -- P-U-M-P-S
assign_subgroup("offshore-pump-3",		"offshore-pumps") -- P-U-M-P-S
assign_subgroup("offshore-pump-4",		"offshore-pumps") -- P-U-M-P-S