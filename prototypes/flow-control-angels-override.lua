-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

--------------------------
---- data-updates.lua ----
--------------------------

-- Set tier mapping
local material_map =
{
	["titanium"] = {4},
	["ceramic"] = {4},
	["tungsten"] = {4},
	["nitinol"] = {5}
}

-- Assign tiered icons
for material, map in pairs(material_map) do

	local icon_path = "__flow-control-expanded-bob__/graphics/icon/reskin/angels/"
	local tier = map[1]

	-- Angels straight pipe
	str_angels_pipe_icon_inputs =
	{
		icon = icon_path .. "pipe-" .. material .. "-straight.png",
		icon_size = 64,
		icon_mipmaps = 4,
		make_icon_pictures = true
	}

	-- Angels junction pipe
	jun_angels_pipe_icon_inputs =
	{
		icon = icon_path .. "pipe-" .. material .. "-junction.png",
		icon_size = 64,
		icon_mipmaps = 4,
		make_icon_pictures = true
	}

	-- Angels elbow pipe
	elb_angels_pipe_icon_inputs =
	{
		icon = icon_path .. "pipe-" .. material .. "-elbow.png",
		icon_size = 64,
		icon_mipmaps = 4,
		make_icon_pictures = true
	}

	-- Setup tier labels
	if reskins.lib.setting("reskins-bobs-do-pipe-tier-labeling") == true then
		str_angels_pipe_icon_inputs.icon = {{icon = str_angels_pipe_icon_inputs.icon}}
		jun_angels_pipe_icon_inputs.icon = {{icon = jun_angels_pipe_icon_inputs.icon}}
		elb_angels_pipe_icon_inputs.icon = {{icon = elb_angels_pipe_icon_inputs.icon}}

		str_angels_pipe_icon_inputs.tier_labels = true
		jun_angels_pipe_icon_inputs.tier_labels = true
		elb_angels_pipe_icon_inputs.tier_labels = true
		
		reskins.lib.append_tier_labels(tier, str_angels_pipe_icon_inputs)
		reskins.lib.append_tier_labels(tier, jun_angels_pipe_icon_inputs)
		reskins.lib.append_tier_labels(tier, elb_angels_pipe_icon_inputs)
	else
		str_angels_pipe_icon_inputs.tier_labels = false
		jun_angels_pipe_icon_inputs.tier_labels = false
		elb_angels_pipe_icon_inputs.tier_labels = false
	end

	-- Handle naming
	str_angels_pipe_icon_name = "pipe-" .. material .."-straight"
	jun_angels_pipe_icon_name = "pipe-" .. material .."-junction"
	elb_angels_pipe_icon_name = "pipe-" .. material .."-elbow"

	-- Assign tiering and icons to targeted pipes
	reskins.lib.assign_icons(str_angels_pipe_icon_name, str_angels_pipe_icon_inputs)
	reskins.lib.assign_icons(jun_angels_pipe_icon_name, jun_angels_pipe_icon_inputs)
	reskins.lib.assign_icons(elb_angels_pipe_icon_name, elb_angels_pipe_icon_inputs)
end

-- Assign pictures to entities
for material, map in pairs(material_map) do

	-- Define local variables
	local picture_path = "__reskins-angels__/graphics/entity/smelting/pipe/"
	local icon_path = "/graphics/icon/reskin/angels"
	local covers_path = flow_bob_covers_path
	local shadow_covers_path = flow_bob_shadow_covers_path
	
	if data.raw["storage-tank"] and data.raw["storage-tank"]["pipe-" .. material .. "-straight"] then
	
		data.raw["storage-tank"]["pipe-" .. material .. "-straight"].pictures.picture =
		{
			north = flow_bob_str_pictures(material, picture_path).straight_vertical,
			east = flow_bob_str_pictures(material, picture_path).straight_horizontal,
			south = flow_bob_str_pictures(material, picture_path).straight_vertical,
			west = flow_bob_str_pictures(material, picture_path).straight_horizontal
		}
		data.raw["storage-tank"]["pipe-" .. material .. "-straight"].fluid_box.pipe_covers = flow_bob_pipe_covers_pictures(material, covers_path, shadow_covers_path)
	end
	
	if data.raw["storage-tank"] and data.raw["storage-tank"]["pipe-" .. material .. "-junction"] then
		data.raw["storage-tank"]["pipe-" .. material .. "-junction"].pictures.picture =
		{
			north = flow_bob_jun_pictures(material, picture_path).t_down,
			east = flow_bob_jun_pictures(material, picture_path).t_left,
			south = flow_bob_jun_pictures(material, picture_path).t_up,
			west = flow_bob_jun_pictures(material, picture_path).t_right
		}
		data.raw["storage-tank"]["pipe-" .. material .. "-junction"].fluid_box.pipe_covers = flow_bob_pipe_covers_pictures(material, covers_path, shadow_covers_path)
	end
	
	if data.raw["storage-tank"] and data.raw["storage-tank"]["pipe-" .. material .. "-elbow"] then
		data.raw["storage-tank"]["pipe-" .. material .. "-elbow"].pictures.picture =
		{
			north = flow_bob_elb_pictures(material, picture_path).corner_down_right,
			east = flow_bob_elb_pictures(material, picture_path).corner_down_left,
			south = flow_bob_elb_pictures(material, picture_path).corner_up_left,
			west = flow_bob_elb_pictures(material, picture_path).corner_up_right
		}
		data.raw["storage-tank"]["pipe-" .. material .. "-elbow"].fluid_box.pipe_covers = flow_bob_pipe_covers_pictures(material, covers_path, shadow_covers_path)
	end
end
