--------------------------
---- data-updates.lua ----
--------------------------

-- This function returns the full pipe_pictures definition for a given material, sourced from the appropriate mod
local function get_pipe_pictures(material)
	if mods["reskins-bobs"] then
		return reskins.lib.pipe_pictures({mod = "bobs", group = "logistics", material = material})
	else
		return bob_pipepictures(material)
	end
end

-- This function returns the full pipe_covers definition for a given material, sourced from the appropriate mod
local function get_pipe_covers(material)
	if mods["reskins-bobs"] then
		return reskins.lib.pipe_covers({mod = "bobs", group = "logistics", material = material})
	else
		return bob_pipecoverspictures(material)
	end
end

-- This function creates the appropripate unique pipe_type item, recipe, and entity definitions
local function create_extensible_prototype_definitions(pipe_type, material)
	local flow_pipe_name = "pipe-"..material.."-"..pipe_type
	local health = data.raw.pipe[material.."-pipe"] and data.raw.pipe[material.."-pipe"].max_health or 100 -- 100 is fallback, but in theory is never used
	return
	{
		item = util.merge{data.raw.item["pipe-"..pipe_type],
			{
				name = flow_pipe_name,
				place_result = flow_pipe_name,
			}
		},

		recipe = util.merge{data.raw.recipe["pipe-"..pipe_type],
			{
				name = flow_pipe_name,
				result = flow_pipe_name,
			}
		},

		entity = util.merge{data.raw["storage-tank"]["pipe-"..pipe_type],
			{
				name = flow_pipe_name,
				minable = {result = material.."-pipe"},
				max_health = health,
			}
		},
	}
end

-- Begin construction
local materials = {
	["brass"] = {technology = "zinc-processing"},
	["bronze"] = {technology = "alloy-processing"},
	["copper"] = {enabled = true},
	["ceramic"] = {technology = "ceramics"},
	["stone"] = {enabled = true},
	["plastic"] = {technology = "plastics"},
	["steel"] = {technology = "steel-processing"},
	["titanium"] = {technology = "titanium-processing"},
	["tungsten"] = {technology = "tungsten-processing"},
	["copper-tungsten"] = {technology = "tungsten-alloy-processing"},
	["nitinol"] = {technology = "nitinol-processing"},
}

local pipes = {
	"straight",
	"junction",
	"elbow",
}

-- For each material
for material, parameters in pairs(materials) do
	-- Check to see if the pipe for the given material exists, if it does not, skip prototype creation
	if not data.raw.item[material.."-pipe"] then goto continue end

	-- For each type of pipe
	for _, pipe in pairs(pipes) do
		-- Build item, recipe, and entity
		local definitions = create_extensible_prototype_definitions(pipe, material)

		-- Create references
		local item = definitions.item
		local recipe = definitions.recipe
		local entity = definitions.entity

		-- Set icons
		local icon = "__flow-control-expanded-bob__/graphics/icon/base/pipe-"..material.."-"..pipe..".png"

		entity.icon = icon
		entity.icon_size = 64
		entity.icon_mipmaps = nil

		item.icon = icon
		item.icon_size = 64
		item.icon_mipmaps = nil

		-- Set recipe properties
		recipe.ingredients = {{material.."-pipe", 1}}
		recipe.enabled = parameters.enabled or false

		-- Generate pipe_pictures table
		local pipe_pictures = get_pipe_pictures(material)

		-- Assign the appropriate material pipe_picture subtypes and pipe covers
		if pipe == "straight" then
			entity.pictures.picture = {
				north = pipe_pictures.straight_vertical,
				east = pipe_pictures.straight_horizontal,
				south = pipe_pictures.straight_vertical,
				west = pipe_pictures.straight_horizontal,
			}
		elseif pipe == "junction" then
			entity.pictures.picture = {
				north = pipe_pictures.t_down,
				east = pipe_pictures.t_left,
				south = pipe_pictures.t_up,
				west = pipe_pictures.t_right,
			}
		elseif pipe == "elbow" then
			entity.pictures.picture = {
				north = pipe_pictures.corner_down_right,
				east = pipe_pictures.corner_down_left,
				south = pipe_pictures.corner_up_left,
				west = pipe_pictures.corner_up_right,
			}
		end
		entity.fluid_box.pipe_covers = get_pipe_covers(material)

		-- Add pipes to data
		if not recipe.hidden then
			data:extend({item, recipe, entity})
		end

		-- Add recipe to technology unlocks as needed and where possible
		if parameters.technology and data.raw.technology[parameters.technology] then
			table.insert(data.raw.technology[parameters.technology].effects, {type = "unlock-recipe", recipe = "pipe-"..material.."-"..pipe})
		end
	end

	-- Skip entity creation
	::continue::
end

-- Create underflow valve 2; replaces Bob's top-up valve

-- Item
local underflow_valve_2_item = util.merge{data.raw.item["overflow-valve"], {
	name = "underflow-valve-2",
	icon = "__flow-control-expanded-bob__/graphics/icon/valve/underflow-valve-2.png",
	icon_size = 32,
	place_result = "underflow-valve-2"
}}
data:extend({underflow_valve_2_item})

-- Recipe
local underflow_valve_2_recipe = util.merge{data.raw.recipe["overflow-valve"], {
	name = "underflow-valve-2",
	result = "underflow-valve-2",
}}
data:extend({underflow_valve_2_recipe})

-- Entity
local underflow_valve_2_entity = util.merge{data.raw["storage-tank"]["overflow-valve"], {
	name = "underflow-valve-2",
	minable = {result = "underflow-valve-2"},
}}

underflow_valve_2_entity.fluid_box.base_level = -0.8
underflow_valve_2_entity.pictures.picture.sheet.filename = "__flow-control-expanded-bob__/graphics/entity/valve/underflow-valve-2.png"

data:extend({underflow_valve_2_entity})

-- Tech
if data.raw.technology["fluid-handling"] then
	table.insert(data.raw["technology"]["fluid-handling"].effects, {type = "unlock-recipe", recipe = "underflow-valve-2"})
end

-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

-- If reskins-bobs isn't present, end code execution
if not mods["reskins-bobs"] then
	local assign_icon = require("utils.lib").assign_icon

	-- Reskin the underground pipes
	for material, _ in pairs(materials) do
		if data.raw.item[material.."-pipe"] then
			assign_icon(material.."-pipe", "pipe")
			assign_icon(material.."-pipe-to-ground", "pipe-to-ground")
		end
	end

	-- Update the iron pipe and related entities
	assign_icon("pipe", "pipe")
	assign_icon("pipe-to-ground", "pipe-to-ground")
	assign_icon("pipe-straight", "storage-tank")
	assign_icon("pipe-junction", "storage-tank")
	assign_icon("pipe-elbow", "storage-tank")
elseif (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	-- Initialise material mapping
	local material_map = {
		["iron"] = 1,
		["copper"] = 1,
		["stone"] = 1,
		["bronze"] = 2,
		["steel"] = 2,
		["plastic"] = 3,
		["brass"] = 3,
		["titanium"] = 4,
		["ceramic"] = 4,
		["tungsten"] = 4,
		["nitinol"] = 5,
		["copper-tungsten"] = 5,
	}

	-- Constructor function for icon inputs
	local function set_icon_inputs(material, variant)
		return
		{
			icon = "__flow-control-expanded-bob__/graphics/icon/reskin/pipe-"..material.."-"..variant..".png",
			icon_size = 64,
			make_icon_pictures = true,
			tier_labels = reskins.lib.setting("reskins-bobs-do-pipe-tier-labeling"),
		}
	end

	-- Set reskins-style icons
	for material, tier in pairs(material_map) do
		for _, pipe in pairs(pipes) do
			-- Setup inputs
			local icon_inputs = set_icon_inputs(material, pipe)

			-- Append tier labels (the function will do nothing if tier_labels is false)
			reskins.lib.append_tier_labels(tier, icon_inputs)

			-- Assign tiering and icons to targeted pipes
			local name = (material == "iron") and "pipe-"..pipe or "pipe-"..material.."-"..pipe
			reskins.lib.assign_icons(name, icon_inputs)
		end
	end
end