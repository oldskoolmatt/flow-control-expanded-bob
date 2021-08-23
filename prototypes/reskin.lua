-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

------------------
---- data.lua ----
------------------

-- If reskins is present and doing reskin work, reskin stuff
if (mods["reskins-bobs"] and (reskins.bobs and reskins.bobs.triggers.logistics.entities)) then -- Bob Pipes
	
	-- Set tier mapping
	local material_map =
	{
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

	-- Set pipe types
	local pipes =
	{
		"straight",
		"junction",
		"elbow"
	}
	
	-- Constructor function for icon inputs
	local function set_icon_inputs(material, variant)
		return
		{
			icon = "__flow-control-expanded-bob__/graphics/icon/reskin/pipe-"..material.."-"..variant..".png",
			icon_size = 64,
			make_icon_pictures = true,
			tier_labels = reskins.lib.setting("reskins-bobs-do-pipe-tier-labeling"),
			type = "storage-tank",
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

if (mods["reskins-bobs"] and (reskins.bobs and reskins.bobs.triggers.logistics.entities)) then -- Bob Valves
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
		["flowbob-check-valve"] = util.color("2ac0ff"),
		["flowbob-overflow-valve"] = util.color("ff3b29"),
		["flowbob-topup-valve-1"] = util.color("4dff2a"),
		["flowbob-topup-valve-2"] = util.color("fcfcfc"),
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
		entity.pictures.picture.sheet = nil

		-- Label to skip to next iteration
		::continue::
	end
end

if (mods["reskins-angels"] and (reskins.angels and reskins.angels.triggers.smelting.entities)) then -- Angels Pipes
	
	-- Set tier mapping
	local material_map =
	{
		["titanium"] = 4,
		["ceramic"] = 4,
		["tungsten"] = 4,
		["nitinol"] = 5,
	}

	-- Set pipe types
	local pipes =
	{
		"straight",
		"junction",
		"elbow",
	}
	
	-- Constructor function for icon inputs
	local function set_icon_inputs(material, variant)
	return
	{
		icon = "__flow-control-expanded-bob__/graphics/icon/reskin/angels/pipe-"..material.."-"..variant..".png",
		icon_size = 64,
		make_icon_pictures = true,
		tier_labels = reskins.lib.setting("reskins-bobs-do-pipe-tier-labeling"),
		type = "storage-tank",
	}
end
	
	-- Assign tiered icons
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
	
	-- Assign pictures to entities
	for material, _ in pairs(material_map) do
		-- Setup inputs
		local inputs = {
			mod = "angels",
			group = "smelting",
			material = material,
		}
	
		-- Fetch pipe pictures and pipe covers
		local pipe_pictures = reskins.lib.pipe_pictures(inputs)
		local pipe_covers = reskins.lib.pipe_covers(inputs)
	
		-- Fetch pipe entities
		local straight_pipe = data.raw["storage-tank"]["pipe-"..material.."-straight"]
		local junction_pipe = data.raw["storage-tank"]["pipe-"..material.."-junction"]
		local elbow_pipe = data.raw["storage-tank"]["pipe-"..material.."-elbow"]
	
		if data.raw["storage-tank"] then
			if straight_pipe then
				straight_pipe.pictures.picture = {
					north = pipe_pictures.straight_vertical,
					east = pipe_pictures.straight_horizontal,
					south = pipe_pictures.straight_vertical,
					west = pipe_pictures.straight_horizontal
				}
				straight_pipe.fluid_box.pipe_covers = pipe_covers
			end
	
			if junction_pipe then
				junction_pipe.pictures.picture = {
					north = pipe_pictures.t_down,
					east = pipe_pictures.t_left,
					south = pipe_pictures.t_up,
					west = pipe_pictures.t_right
				}
				junction_pipe.fluid_box.pipe_covers = pipe_covers
			end
	
			if elbow_pipe then
				elbow_pipe.pictures.picture = {
					north = pipe_pictures.corner_down_right,
					east = pipe_pictures.corner_down_left,
					south = pipe_pictures.corner_up_left,
					west = pipe_pictures.corner_up_right
				}
				elbow_pipe.fluid_box.pipe_covers = pipe_covers
			end
		end
	end
end

if (mods["reskins-angels"] and (reskins.angels and reskins.angels.triggers.petrochem.entities)) then -- Angels Valves
	-- Set input parameters
	local inputs =
	{
		type = "storage-tank",
		icon_name = "valve",
		base_entity = "pipe",
		mod = "angels",
		group = "petrochem",
		particles = {["small"] = 2},
		icon_layers = 2,
		make_remnants = false,
	}
	
	local valves =
	{
		["valve-inspector"] = {tint = util.color("d4933f")},
		["flowbob-check-valve"] = {tint = util.color("2ac0ff")},
		["flowbob-overflow-valve"] = {tint = util.color("ff3b29")},
		["flowbob-topup-valve-1"] = {tint = util.color("4dff2a")},
		["flowbob-topup-valve-2"] = {tint = util.color("fcfcfc")},
	}
	
	local path = "__flow-control-expanded-bob__/graphics/entity/valve/angels"
	
	local function cardinal_pictures(x, tint)
		local x_lr = 64*x
		local x_hr = 128*x
	
		return
		{
			layers =
			{
				-- Base
				{
					filename = path.."/valve-base.png",
					priority = "extra-high",
					x = x_lr,
					width = 64,
					height = 64,
					hr_version =
					{
						filename = path.."/hr-valve-base.png",
						priority = "extra-high",
						x = x_hr,
						width = 128,
						height = 128,
						scale = 0.5
					}
				},
				-- Mask
				{
					filename = path.."/valve-mask.png",
					priority = "extra-high",
					x = x_lr,
					width = 64,
					height = 64,
					tint = tint,
					hr_version =
					{
						filename = path.."/hr-valve-mask.png",
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
	
	for name, map in pairs(valves) do
		-- Fetch entity
		local entity = data.raw[inputs.type][name]
	
		-- Check if entity exists, if not, skip this iteration
		if not entity then goto continue end
	
		-- Assign tint
		inputs.tint = map.tint
	
		reskins.lib.setup_standard_entity(name, 0, inputs)
	
		-- Reskin entities
		entity.pictures.picture.north = cardinal_pictures(0, inputs.tint)
		entity.pictures.picture.east = cardinal_pictures(1, inputs.tint)
		entity.pictures.picture.south = cardinal_pictures(2, inputs.tint)
		entity.pictures.picture.west = cardinal_pictures(3, inputs.tint)
		entity.pictures.picture.sheet = nil
	
		-- Add pipe overs
		entity.fluid_box.pipe_covers = pipecoverspictures()
	
		-- Label to skip to next iteration
		::continue::
	end
end