-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

------------------
---- data.lua ----
------------------

-- Setup valve list
local valves =
{
	"flowbob-check-valve",
	"flowbob-overflow-valve",
	"flowbob-topup-valve-1",
	"flowbob-topup-valve-2",
}

-- Item
local valve_check =
{
	type = "item",
	name = "flowbob-check-valve",
	icon = "__flow-control-expanded-bob__/graphics/icon/valve/flowbob-check-valve.png",
	icon_size = 32,
	place_result = "flowbob-check-valve",
	stack_size = 100
}	data:extend({valve_check})
for _, valve_name in pairs(valves) do
	if valve_name ~= "flowbob-check-valve" then
		local valve = table.deepcopy(data.raw.item["flowbob-check-valve"])
		valve.name = valve_name
		valve.icon = "__flow-control-expanded-bob__/graphics/icon/valve/"..valve_name..".png"
		valve.place_result = valve_name
		data:extend({valve})
	end
end

-- Recipe
local valve_check =
{
	type = "recipe",
	name = "flowbob-check-valve",
	energy_required = 2,
	ingredients =
	{
		{"iron-plate", 1},
		{"pipe", 1},
		{"iron-gear-wheel", 1}
	},
    result= "flowbob-check-valve"
}	data:extend({valve_check})
for _, valve_name in pairs(valves) do
	if valve_name ~= "flowbob-check-valve" then
		local valve = table.deepcopy(data.raw.recipe["flowbob-check-valve"])
		valve.name = valve_name
		valve.result = valve_name
		data:extend({valve})

		table.insert(data.raw.recipe[valve_name].ingredients, {"electronic-circuit", 1})
	end
end

-- Entity
local valve_check =
{
	type = "storage-tank",
	name = "flowbob-check-valve",
	icon = "__flow-control-expanded-bob__/graphics/icon/valve/flowbob-check-valve.png",
	icon_size = 32,
	flags = {"placeable-neutral", "player-creation"},
	minable = {hardness = 0.2, mining_time = 0.1, result = "flowbob-check-valve"},
	max_health = 50,
	two_direction_only = false,
	fast_replaceable_group = "pipe",
	corpse = "small-remnants",
	resistances = {{type = "fire", percent = 80}},
	collision_box = {{-0.29, -0.29}, {0.29, 0.2}},
	selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	fluid_box =
	{
		base_area = 1,
		pipe_covers = pipecoverspictures(),
		pipe_connections = {{position={0, -1}, type="output"}, {position={0, 1}, type="input"}}
	},
	vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
	pictures =
	{
		picture =
		{
			sheet =
			{
				filename = "__flow-control-expanded-bob__/graphics/entity/valve/flowbob-check-valve.png",
				priority = "extra-high",
				frames = 4,
				width = 58,
				height = 55,
				shift = {0.28125, -0.078125}
			}
		},
		fluid_background =
		{
			filename = "__core__/graphics/empty.png",
			width = 1,
			height = 1
		},
		window_background =
		{
			filename = "__core__/graphics/empty.png",
			width = 1,
			height = 1
		},
		flow_sprite =
		{
			filename = "__core__/graphics/empty.png",
			width = 1,
			height = 1
		},
		gas_flow =
		{
			filename = "__base__/graphics/entity/pipe/steam.png",
			width = 1,
			height = 1,
			frame_count = 1
		}
	},
	window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
	flow_length_in_ticks = 360,
	circuit_wire_connection_points = circuit_connector_definitions["bob-valve"].points,
	circuit_connector_sprites = circuit_connector_definitions["bob-valve"].sprites,
	circuit_wire_max_distance = 7.5,
}	data:extend({valve_check})
for _, valve_name in pairs(valves) do
	if valve_name ~= "flowbob-check-valve" then
		local valve = table.deepcopy(data.raw["storage-tank"]["flowbob-check-valve"])
		valve.name = valve_name
		valve.icon = "__flow-control-expanded-bob__/graphics/icon/valve/"..valve_name..".png"
		valve.minable = {hardness = 0.2, mining_time = 0.1, result = valve_name}
		valve.pictures.picture.sheet.filename = "__flow-control-expanded-bob__/graphics/entity/valve/"..valve_name..".png"
		if valve_name == "flowbob-overflow-valve" then
			valve.fluid_box.base_level = 0.8
			valve.fluid_box.height = 0.2
		elseif valve_name == "flowbob-topup-valve-1" then
			valve.fluid_box.height = 0.2
		elseif valve_name == "flowbob-topup-valve-2" then
			valve.fluid_box.height = 0.8
		end
		data:extend({valve})
	end
end

-- Tech
for _, valve_name in pairs(valves) do -- tech
	table.insert(data.raw.technology["fluid-handling"].effects, {type = "unlock-recipe", recipe = valve_name})
end