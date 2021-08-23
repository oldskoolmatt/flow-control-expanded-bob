-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

------------------
---- data.lua ----
------------------


-- Fetch functions
local assign_icon = require("utils.lib").assign_icon
local get_pipe_pictures = require("utils.lib").get_pipe_pictures
local get_pipe_covers = require("utils.lib").get_pipe_covers
local create_extensible_prototype_definitions = require("utils.lib").create_extensible_prototype_definitions

-----------------------------------------------------------------------

-- Begin construction
local materials =
{
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

local pipes =
{
	"straight",
	"junction",
	"elbow",
}

-- Make vanilla and bob logistics pipe icons
assign_icon("pipe", "pipe")
assign_icon("pipe-to-ground", "pipe-to-ground")
assign_icon("pipe-straight", "storage-tank")
assign_icon("pipe-junction", "storage-tank")
assign_icon("pipe-elbow", "storage-tank")
for material, _ in pairs(materials) do
	if data.raw.item[material.."-pipe"] then
		assign_icon(material.."-pipe", "pipe")
		assign_icon(material.."-pipe-to-ground", "pipe-to-ground")
	end
end

-- Build straight, T and elbow pipes for each material
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
			entity.pictures.picture =
			{
				north = pipe_pictures.straight_vertical,
				east = pipe_pictures.straight_horizontal,
				south = pipe_pictures.straight_vertical,
				west = pipe_pictures.straight_horizontal
			}
		elseif pipe == "junction" then
			entity.pictures.picture =
			{
				north = pipe_pictures.t_down,
				east = pipe_pictures.t_left,
				south = pipe_pictures.t_up,
				west = pipe_pictures.t_right
			}
		elseif pipe == "elbow" then
			entity.pictures.picture =
			{
				north = pipe_pictures.corner_down_right,
				east = pipe_pictures.corner_down_left,
				south = pipe_pictures.corner_up_left,
				west = pipe_pictures.corner_up_right
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