-----------------------------------------------------------------------
------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
--------------- https://mods.factorio.com/user/Kirazy -----------------
-----------------------------------------------------------------------

--------------------------
---- data-updates.lua ----
--------------------------

-- If the reskins mods don't do anything, we shouldn't either
if not (reskins.angels and reskins.angels.triggers.smelting.entities) then return end
if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then return end

-- Set tier mapping
local materials = {
	["titanium"] = 4,
	["ceramic"] = 4,
	["tungsten"] = 4,
	["nitinol"] = 5,
}

local pipes = {
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
for material, tier in pairs(materials) do
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
for material, _ in pairs(materials) do
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