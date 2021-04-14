-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

------------------
---- data.lua ----
------------------

-- Remove duplicate valves
local remove_entity = require("utils.lib").remove_entity
local entity = "storage-tank"

remove_entity("check-valve",		"fluid-handling", entity)
remove_entity("overflow-valve",		"fluid-handling", entity)
remove_entity("underflow-valve",	"fluid-handling", entity)

-- Create flow control top-valve equivalent
local flowbob_topup_valve = util.merge{data.raw.item["bob-topup-valve"], -- Item
{
	name = "flowbob-topup-valve",
	icon_size = 32,
	place_result = "flowbob-topup-valve"
}}
data:extend({flowbob_topup_valve})

local flowbob_topup_valve = util.merge{data.raw.recipe["bob-topup-valve"], -- Recipe
{
	name = "flowbob-topup-valve",
	result = "flowbob-topup-valve"
}}
data:extend({flowbob_topup_valve})

local flowbob_topup_valve = util.merge{data.raw["storage-tank"]["bob-topup-valve"], -- Entity
{
	name = "flowbob-topup-valve",
	minable = {result = "flowbob-topup-valve"}
}}
flowbob_topup_valve.fluid_box.height = 0.8
data:extend({flowbob_topup_valve})

if data.raw.technology["fluid-handling"] then -- Tech
	table.insert(data.raw["technology"]["fluid-handling"].effects, {type = "unlock-recipe", recipe = "flowbob-topup-valve"})
end

-- Assign icons to valves
local icon_path = "__Flow Control__/graphics/icon/"

data.raw.item["bob-valve"].icon = icon_path .. "check-valve.png"
data.raw["storage-tank"]["bob-valve"].icon = icon_path .. "check-valve.png"
data.raw.item["bob-overflow-valve"].icon = icon_path .. "overflow-valve.png"
data.raw["storage-tank"]["bob-overflow-valve"].icon = icon_path .. "overflow-valve.png"
data.raw.item["bob-topup-valve"].icon = icon_path .. "underflow-valve.png"
data.raw["storage-tank"]["bob-topup-valve"].icon = icon_path .. "underflow-valve.png"

local icon_path = "__flow-control-expanded-bob__/graphics/icon/valve/"
data.raw.item["flowbob-topup-valve"].icon = icon_path .. "flowbob-topup-valve.png"
data.raw["storage-tank"]["flowbob-topup-valve"].icon = icon_path .. "flowbob-topup-valve.png"

-- Add recipe ingredients
table.insert(data.raw["recipe"]["bob-valve"].ingredients, {type="item", name="iron-gear-wheel", amount=1})
table.insert(data.raw["recipe"]["bob-overflow-valve"].ingredients, {type="item", name="iron-gear-wheel", amount=1})
table.insert(data.raw["recipe"]["bob-overflow-valve"].ingredients, {type="item", name="electronic-circuit", amount=1})
table.insert(data.raw["recipe"]["bob-topup-valve"].ingredients, {type="item", name="electronic-circuit", amount=1})
table.insert(data.raw["recipe"]["bob-topup-valve"].ingredients, {type="item", name="iron-gear-wheel", amount=1})
table.insert(data.raw["recipe"]["flowbob-topup-valve"].ingredients, {type="item", name="electronic-circuit", amount=1})
table.insert(data.raw["recipe"]["flowbob-topup-valve"].ingredients, {type="item", name="iron-gear-wheel", amount=1})

-- Assign skins to valves
if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	
	local picture_path = "__flow-control-expanded-bob__/graphics/entity/valve/"

	data.raw["storage-tank"]["bob-valve"].pictures.picture.sheet =
	{
		filename = picture_path .. "bob-valve.png",
		priority = "extra-high",
		frames = 4,
		width = 58,
		height = 55,
		shift = {0.28125, -0.078125}
	}
	
	data.raw["storage-tank"]["bob-overflow-valve"].pictures.picture.sheet =
	{
    filename = picture_path .. "bob-overflow-valve.png",
    priority = "extra-high",
    frames = 4,
    width = 58,
    height = 55,
    shift = {0.28125, -0.078125}
}
	
	data.raw["storage-tank"]["bob-topup-valve"].pictures.picture.sheet =
	{
		filename = picture_path .. "bob-topup-valve.png",
		priority = "extra-high",
		frames = 4,
		width = 58,
		height = 55,
		shift = {0.28125, -0.078125}
	}
	
	data.raw["storage-tank"]["flowbob-topup-valve"].pictures.picture.sheet =
	{
		filename = picture_path .. "flowbob-topup-valve.png",
		priority = "extra-high",
		frames = 4,
		width = 58,
		height = 55,
		shift = {0.28125, -0.078125}
	}
	return
else
	local inputs =
	{
		type = "storage-tank",
		icon_name = "valve",
		base_entity = "pipe",
		mod = "bobs",
		group = "logistics",
		particles = {["small"] = 2},
		icon_layers = 2,
		make_remnants = false,
	}

	local tint_map =
	{
		["flowbob-topup-valve"] = util.color("fffb1f"),
	}

	local function cardinal_pictures(x, tint)
		local x_lr = 64*x
		local x_hr = 128*x

		return
		{
			layers =
			{
				-- Base
				{
					filename = reskins.bobs.directory.."/graphics/entity/logistics/valve/valve-base.png",
					priority = "extra-high",
					x = x_lr,
					width = 64,
					height = 64,
					hr_version =
					{
						filename = reskins.bobs.directory.."/graphics/entity/logistics/valve/hr-valve-base.png",
						priority = "extra-high",
						x = x_hr,
						width = 128,
						height = 128,
						scale = 0.5
					}
				},
				-- Mask
				{
					filename = reskins.bobs.directory.."/graphics/entity/logistics/valve/valve-mask.png",
					priority = "extra-high",
					x = x_lr,
					width = 64,
					height = 64,
					tint = tint,
					hr_version =
					{
						filename = reskins.bobs.directory.."/graphics/entity/logistics/valve/hr-valve-mask.png",
						priority = "extra-high",
						x = x_hr,
						width = 128,
						height = 128,
						tint = tint,
						scale = 0.5
					}
				}
			}
		}
	end

	-- Reskin entities, create and assign extra details
	for name, tint in pairs(tint_map) do
		-- Fetch entity
		local entity = data.raw[inputs.type][name]

		-- Check if entity exists, if not, skip this iteration
		if not entity then goto continue end

		-- Assign tint
		inputs.tint = tint

		reskins.lib.setup_standard_entity(name, 0, inputs)

		-- Reskin entities
		entity.pictures.picture.north = cardinal_pictures(0, inputs.tint)
		entity.pictures.picture.east = cardinal_pictures(1, inputs.tint)
		entity.pictures.picture.south = cardinal_pictures(2, inputs.tint)
		entity.pictures.picture.west = cardinal_pictures(3, inputs.tint)

		-- Label to skip to next iteration
		::continue::
	end
end
