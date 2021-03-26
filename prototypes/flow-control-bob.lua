--------------------------
---- data-updates.lua ----
--------------------------

-- Define global variables
flow_bob_icon_path = "__flow-control-expanded-bob__/graphics/icon/base/"
flow_bob_shadow_covers_path = "__base__/graphics/entity/pipe-covers"

if mods ["reskins-bobs"] then
	flow_bob_picture_path = "__reskins-bobs__/graphics/entity/logistics/pipe/"
	flow_bob_covers_path = "__reskins-bobs__/graphics/entity/logistics/pipe-covers/"
else
	flow_bob_picture_path = "__boblogistics__/graphics/entity/pipe/"
	flow_bob_covers_path = "__boblogistics__/graphics/entity/pipe/"
end

-- Define local variables
local picture_path = flow_bob_picture_path
local covers_path = flow_bob_covers_path
local icon_path = flow_bob_icon_path
local shadow_covers_path = flow_bob_shadow_covers_path

-- Pipe icons
function flow_bob_pipe_icons(material, icon_path)
	return
{
	straight=
	{
		filename = icon_path .. material .. "/pipe-straight-vertical.png",
		priority = "extra-high",
		width = 64,
		height = 64,
		scale=0.5,
	},
	elbow=
	{
		filename = icon_path .. material .. "/pipe-corner-down-right.png",
		priority = "extra-high",
		width = 64,
		height = 64,
		scale = 0.5,
	},
	junction=
	{
		filename = icon_path .. material .. "/pipe-t-up.png",
		priority = "extra-high",
		width = 64,
		height = 64,
		scale=0.5,
	}
}
end

-- Straight pipe
function flow_bob_str_pictures(material, picture_path)
	return
	{
		straight_vertical =
		{
			filename = picture_path .. material .. "/pipe-straight-vertical.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			hr_version =
			{
				filename = picture_path .. material .. "/hr-pipe-straight-vertical.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				scale = 0.5
			}
		},
		straight_horizontal =
		{
			filename = picture_path .. material .. "/pipe-straight-horizontal.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			hr_version =
			{
				filename = picture_path .. material .. "/hr-pipe-straight-horizontal.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				scale = 0.5
			}
		},
	}
end

-- Elbow pipe
function flow_bob_elb_pictures(material, picture_path)
	return
	{
		corner_up_right =
		{
			filename = picture_path .. material .. "/pipe-corner-up-right.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			hr_version =
			{
				filename = picture_path .. material .. "/hr-pipe-corner-up-right.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				scale = 0.5
			}
		},
		corner_up_left =
		{
			filename = picture_path .. material .. "/pipe-corner-up-left.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			hr_version =
			{
				filename = picture_path .. material .. "/hr-pipe-corner-up-left.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				scale = 0.5
			}
		},
		corner_down_right =
		{
			filename = picture_path .. material .. "/pipe-corner-down-right.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			hr_version =
			{
				filename = picture_path .. material .. "/hr-pipe-corner-down-right.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				scale = 0.5
			}
		},
		corner_down_left =
		{
			filename = picture_path .. material .. "/pipe-corner-down-left.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			hr_version =
			{
				filename = picture_path .. material .. "/hr-pipe-corner-down-left.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				scale = 0.5
			}
		}
	}
end

-- Junction pipe
function flow_bob_jun_pictures(material, picture_path)
	return
	{
		t_up =
		{
			filename = picture_path .. material .. "/pipe-t-up.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			hr_version =
			{
				filename = picture_path .. material .. "/hr-pipe-t-up.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				scale = 0.5
			}
		},
		t_down =
		{
			filename = picture_path .. material .. "/pipe-t-down.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			hr_version =
			{
				filename = picture_path .. material .. "/hr-pipe-t-down.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				scale = 0.5
			}
		},
		t_right =
		{
			filename = picture_path .. material .. "/pipe-t-right.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			hr_version =
			{
				filename = picture_path .. material .. "/hr-pipe-t-right.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				scale = 0.5
			}
		},
		t_left =
		{
			filename = picture_path .. material .. "/pipe-t-left.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			hr_version =
			{
				filename = picture_path .. material .. "/hr-pipe-t-left.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				scale = 0.5
			},
		}
	}
end

-- Pipe covers
function flow_bob_pipe_covers_pictures(material, covers_path, shadow_covers_path)
	return
	{
		north =
		{
			layers =
			{
				{
					filename = covers_path .. material .. "/pipe-cover-north.png",
					priority = "extra-high",
					width = 64,
					height = 64,
					hr_version =
					{
						filename = covers_path .. material .. "/hr-pipe-cover-north.png",
						priority = "extra-high",
						width = 128,
						height = 128,
						scale = 0.5
					}
				},
				{
					filename = shadow_covers_path .. "/pipe-cover-north-shadow.png",
					priority = "extra-high",
					width = 64,
					height = 64,
					draw_as_shadow = true,
					hr_version =
					{
						filename = shadow_covers_path .. "/hr-pipe-cover-north-shadow.png",
						priority = "extra-high",
						width = 128,
						height = 128,
						scale = 0.5,
						draw_as_shadow = true
					}
				}
			}
		},
		east =
		{
			layers =
			{
				{
					filename = covers_path .. material .. "/pipe-cover-east.png",
					priority = "extra-high",
					width = 64,
					height = 64,
					hr_version =
					{
						filename = covers_path .. material .. "/hr-pipe-cover-east.png",
						priority = "extra-high",
						width = 128,
						height = 128,
						scale = 0.5
					}
				},
				{
					filename = shadow_covers_path .. "/pipe-cover-east-shadow.png",
					priority = "extra-high",
					width = 64,
					height = 64,
					draw_as_shadow = true,
					hr_version =
					{
						filename = shadow_covers_path .. "/hr-pipe-cover-east-shadow.png",
						priority = "extra-high",
						width = 128,
						height = 128,
						scale = 0.5,
						draw_as_shadow = true --was disabled
					}
				}
			}
		},
		south =
		{
			layers =
			{
				{
					filename = covers_path .. material .. "/pipe-cover-south.png",
					priority = "extra-high",
					width = 64,
					height = 64,
					hr_version =
					{
						filename = covers_path .. material .. "/hr-pipe-cover-south.png",
						priority = "extra-high",
						width = 128,
						height = 128,
						scale = 0.5
					}
				},
				{
					filename = shadow_covers_path .. "/pipe-cover-south-shadow.png",
					priority = "extra-high",
					width = 64,
					height = 64,
					draw_as_shadow = true,
					hr_version =
					{
						filename = shadow_covers_path .. "/hr-pipe-cover-south-shadow.png",
						priority = "extra-high",
						width = 128,
						height = 128,
						scale = 0.5,
						draw_as_shadow = true
					}
				}
			}
		},
		west =
		{
			layers =
			{
				{
					filename = covers_path .. material .. "/pipe-cover-west.png",
					priority = "extra-high",
					width = 64,
					height = 64,
					hr_version =
					{
						filename = covers_path .. material .. "/hr-pipe-cover-west.png",
						priority = "extra-high",
						width = 128,
						height = 128,
						scale = 0.5
					}
				},
				{
					filename = shadow_covers_path .. "/pipe-cover-west-shadow.png",
					priority = "extra-high",
					width = 64,
					height = 64,
					draw_as_shadow = true,
					hr_version =
					{
						filename = shadow_covers_path .. "/hr-pipe-cover-west-shadow.png",
						priority = "extra-high",
						width = 128,
						height = 128,
						scale = 0.5,
						draw_as_shadow = true
					}
				}
			}
		}
	}
end

-- Initialise pipe generation
local overflow_bob_pipe_names = {} do

	-- Begin construction
	local new_pipes = {}

	-- Straight
	local strtable = function ()
	 	return
		{
			item = table.deepcopy(data.raw.item["pipe-straight"]),
			recipe = table.deepcopy(data.raw.recipe["pipe-straight"]),
			entity = table.deepcopy(data.raw["storage-tank"]["pipe-straight"])
		}
	end

	-- Junction
	local juntable = function ()
		return
		{
			item = table.deepcopy(data.raw.item["pipe-junction"]),
			recipe = table.deepcopy(data.raw.recipe["pipe-junction"]),
			entity = table.deepcopy(data.raw["storage-tank"]["pipe-junction"])
		}
	end

	--Elbow
	local elbtable = function ()
		return
		{
			item = table.deepcopy(data.raw.item["pipe-elbow"]),
			recipe = table.deepcopy(data.raw.recipe["pipe-elbow"]),
			entity = table.deepcopy(data.raw["storage-tank"]["pipe-elbow"])
		}
	end

	-- Set images of bob pipes
	local pic1 = icon_path .. "pipe-"
	local mne  = function (material) return material .. "-pipe" end
	local str  = function (material) return "pipe-" .. material .. "-straight" end
	local jun  = function (material) return "pipe-" .. material .. "-junction" end
	local elb  = function (material) return "pipe-" .. material .. "-elbow" end
	local pstr = function (type) return type .. "-straight.png" end
	local pjun = function (type) return type .. "-junction.png" end
	local pelb = function (type) return type .. "-elbow.png" end

	local p =
	{
		as=pstr("brass"),		aj=pjun("brass"),		ae=pelb("brass"),
		bs=pstr("bronze"),	 bj=pjun("bronze"),	 be=pelb("bronze"),
		cs=pstr("copper"),	 cj=pjun("copper"),	 ce=pelb("copper"),
		es=pstr("ceramic"),	ej=pjun("ceramic"),	ee=pelb("ceramic"),
		ns=pstr("stone"),		nj=pjun("stone"),		ne=pelb("stone"),
		ps=pstr("plastic"),	pj=pjun("plastic"),	pe=pelb("plastic"),
		ss=pstr("steel"),		sj=pjun("steel"),		se=pelb("steel"),
		ts=pstr("titanium"), tj=pjun("titanium"), te=pelb("titanium"),
		us=pstr("tungsten"), uj=pjun("tungsten"), ue=pelb("tungsten"),
		ws=pstr("copper-tungsten"), wj=pjun("copper-tungsten"), we=pelb("copper-tungsten"),
		ls=pstr("nitinol"), lj=pjun("nitinol"), le=pelb("nitinol")
	}
	local m=
	{
		as=mne("brass"),		aj=mne("brass"),		ae=mne("brass"),
		bs=mne("bronze"),	 bj=mne("bronze"),	 be=mne("bronze"),
		cs=mne("copper"),	 cj=mne("copper"),	 ce=mne("copper"),
		es=mne("ceramic"),	ej=mne("ceramic"),	ee=mne("ceramic"),
		ns=mne("stone"),		nj=mne("stone"),		ne=mne("stone"),
		ps=mne("plastic"),	pj=mne("plastic"),	pe=mne("plastic"),
		ss=mne("steel"),		sj=mne("steel"),		se=mne("steel"),
		ts=mne("titanium"), tj=mne("titanium"), te=mne("titanium"),
		us=mne("tungsten"), uj=mne("tungsten"), ue=mne("tungsten"),
		ws=mne("copper-tungsten"), wj=mne("copper-tungsten"), we=mne("copper-tungsten"),
		ls=mne("nitinol"), lj=mne("nitinol"), le=mne("nitinol")
	}
	local n =
	{
		as=str("brass"),		aj=jun("brass"),		ae=elb("brass"), --a=brass
		bs=str("bronze"),	 bj=jun("bronze"),	 be=elb("bronze"), --b=bronze
		cs=str("copper"),	 cj=jun("copper"),	 ce=elb("copper"), --c=copper
		es=str("ceramic"),	ej=jun("ceramic"),	ee=elb("ceramic"), --e=ceramic
		ns=str("stone"),		nj=jun("stone"),		ne=elb("stone"), --n=stone
		ps=str("plastic"),	pj=jun("plastic"),	pe=elb("plastic"), --p=plastic
		ss=str("steel"),		sj=jun("steel"),		se=elb("steel"),	--s=steel
		ts=str("titanium"), tj=jun("titanium"), te=elb("titanium"), --t=titanium
		us=str("tungsten"), uj=jun("tungsten"), ue=elb("tungsten"), --u=tungsten
		ws=str("copper-tungsten"), wj=jun("copper-tungsten"), we=elb("copper-tungsten"), --w=tungsten-copper
		ls=str("nitinol"), lj=jun("nitinol"), le=elb("nitinol") --l=nitinol
	}

	-- Build initial table
	for key,value in pairs(n) do
		-- external object reference for control.lua
		overflow_bob_pipe_names[value] = true

		if string.sub(key,2)=="s" then	-- Straight pipe
			new_pipes[value] = strtable()
		elseif string.sub(key,2)=="j" then	-- Junction pipe
			new_pipes[value] = juntable()
		elseif string.sub(key,2)=="e" then	-- Elbow pipe
			new_pipes[value] = elbtable()
		end
	end

	-- Setup properties for entities, recipes and items
	for key,value in pairs(n) do
	
		-- entity.name / recipe.name / item.name
		new_pipes[value].entity.name = value
		new_pipes[value].recipe.name = value
		new_pipes[value].item.name	 = value
		-- Used for grouping in menus
		--find mat using n(key)
		if string.sub(key,1,1) == "a" then
			mat= "brass"
		elseif string.sub(key,1,1) == "b" then
			mat="bronze"
		elseif string.sub(key,1,1) == "c" then
			mat="copper"
		elseif string.sub(key,1,1) == "e" then
			mat="ceramic"
		elseif string.sub(key,1,1) == "n" then
			mat="stone"
		elseif string.sub(key,1,1) == "p" then
			mat="plastic"
		elseif string.sub(key,1,1) == "s" then
			mat="steel"
		elseif string.sub(key,1,1) == "t" then
			mat="titanium"
		elseif string.sub(key,1,1) == "u" then
			mat="tungsten"
		elseif string.sub(key,1,1) == "l" then
			mat="nitinol"
		elseif string.sub(key,1,1) == "w" then
			mat="copper-tungsten"
		else
			mat="iron" --throws an error, should not occur
		end
		-- entity.icon / item.icon
		new_pipes[value].entity.icon = pic1..p[key]
		new_pipes[value].item.icon	 = pic1..p[key]
		-- entity.minable.result
		new_pipes[value].entity.minable.result = m[key]
		-- recipe.ingredients
		new_pipes[value].recipe.ingredients = {{m[key], 1}}
		-- recipe.result
		new_pipes[value].recipe.result = value
		-- recipe.enabled
		if string.sub(key,1,1) == "c" or string.sub(key,1,1) == "n" then
			-- (c)opper and sto(n)e begin enabled
			new_pipes[value].recipe.enabled = "true"
		else
			new_pipes[value].recipe.enabled = "false"
		end
		-- item.place_result
		new_pipes[value].item.place_result = value
		if pipe_type == "storage-tank" then
			if string.sub(key,2)=="s" then --straight pipe
				new_pipes[value].entity.pictures.picture =
				{
					north = flow_bob_str_pictures(mat, picture_path).straight_vertical,
					east = flow_bob_str_pictures(mat, picture_path).straight_horizontal,
					south = flow_bob_str_pictures(mat, picture_path).straight_vertical,
					west = flow_bob_str_pictures(mat, picture_path).straight_horizontal
				}
			elseif string.sub(key,2)=="j" then --junction pipes
				new_pipes[value].entity.pictures.picture =
				{
					north = flow_bob_jun_pictures(mat, picture_path).t_down,
					east = flow_bob_jun_pictures(mat, picture_path).t_left,
					south = flow_bob_jun_pictures(mat, picture_path).t_up,
					west = flow_bob_jun_pictures(mat, picture_path).t_right
				}
			else --elbows are left
				new_pipes[value].entity.pictures.picture =
				{
					north = flow_bob_elb_pictures(mat, picture_path).corner_down_right,
					east = flow_bob_elb_pictures(mat, picture_path).corner_down_left,
					south = flow_bob_elb_pictures(mat, picture_path).corner_up_left,
					west = flow_bob_elb_pictures(mat, picture_path).corner_up_right
				}
			end
		end
		new_pipes[value].entity.fluid_box.pipe_covers= flow_bob_pipe_covers_pictures(mat, covers_path, shadow_covers_path)
	end
	do -- Set fluid box and health points for entities
		--copper
		new_pipes[n.cs].entity.fluid_box.base_area = 1
		new_pipes[n.cs].entity.max_health = 100
		new_pipes[n.cj].entity.fluid_box.base_area = 1
		new_pipes[n.cj].entity.max_health = 100
		new_pipes[n.ce].entity.fluid_box.base_area = 1
		new_pipes[n.ce].entity.max_health = 100
		--stone
		new_pipes[n.ns].entity.fluid_box.base_area = 1
		new_pipes[n.ns].entity.max_health = 100
		new_pipes[n.nj].entity.fluid_box.base_area = 1
		new_pipes[n.nj].entity.max_health = 100
		new_pipes[n.ne].entity.fluid_box.base_area = 1
		new_pipes[n.ne].entity.max_health = 100
		--bronze
		new_pipes[n.bs].entity.fluid_box.base_area = 1
		new_pipes[n.bs].entity.max_health = 150
		new_pipes[n.bj].entity.fluid_box.base_area = 1
		new_pipes[n.bj].entity.max_health = 150
		new_pipes[n.be].entity.fluid_box.base_area = 1
		new_pipes[n.be].entity.max_health = 150
		--steel
		new_pipes[n.ss].entity.fluid_box.base_area = 1
		new_pipes[n.ss].entity.max_health = 150
		new_pipes[n.sj].entity.fluid_box.base_area = 1
		new_pipes[n.sj].entity.max_health = 150
		new_pipes[n.se].entity.fluid_box.base_area = 1
		new_pipes[n.se].entity.max_health = 150
		--plastic
		new_pipes[n.ps].entity.fluid_box.base_area = 1
		new_pipes[n.ps].entity.max_health = 200
		new_pipes[n.pj].entity.fluid_box.base_area = 1
		new_pipes[n.pj].entity.max_health = 200
		new_pipes[n.pe].entity.fluid_box.base_area = 1
		new_pipes[n.pe].entity.max_health = 200
		--brass
		new_pipes[n.as].entity.fluid_box.base_area = 1
		new_pipes[n.as].entity.max_health = 200
		new_pipes[n.aj].entity.fluid_box.base_area = 1
		new_pipes[n.aj].entity.max_health = 200
		new_pipes[n.ae].entity.fluid_box.base_area = 1
		new_pipes[n.ae].entity.max_health = 200
		--titanium
		new_pipes[n.ts].entity.fluid_box.base_area = 1
		new_pipes[n.ts].entity.max_health = 250
		new_pipes[n.tj].entity.fluid_box.base_area = 1
		new_pipes[n.tj].entity.max_health = 250
		new_pipes[n.te].entity.fluid_box.base_area = 1
		new_pipes[n.te].entity.max_health = 250
		--ceramic
		new_pipes[n.es].entity.fluid_box.base_area = 1
		new_pipes[n.es].entity.max_health = 250
		new_pipes[n.ej].entity.fluid_box.base_area = 1
		new_pipes[n.ej].entity.max_health = 250
		new_pipes[n.ee].entity.fluid_box.base_area = 1
		new_pipes[n.ee].entity.max_health = 250
		--tungsten
		new_pipes[n.us].entity.fluid_box.base_area = 1
		new_pipes[n.us].entity.max_health = 250
		new_pipes[n.uj].entity.fluid_box.base_area = 1
		new_pipes[n.uj].entity.max_health = 250
		new_pipes[n.ue].entity.fluid_box.base_area = 1
		new_pipes[n.ue].entity.max_health = 250
		--nitiniol
		new_pipes[n.ls].entity.fluid_box.base_area = 1
		new_pipes[n.ls].entity.max_health = 300
		new_pipes[n.lj].entity.fluid_box.base_area = 1
		new_pipes[n.lj].entity.max_health = 300
		new_pipes[n.le].entity.fluid_box.base_area = 1
		new_pipes[n.le].entity.max_health = 300
		--copper tungsten
		new_pipes[n.ws].entity.fluid_box.base_area = 1
		new_pipes[n.ws].entity.max_health = 300
		new_pipes[n.wj].entity.fluid_box.base_area = 1
		new_pipes[n.wj].entity.max_health = 300
		new_pipes[n.we].entity.fluid_box.base_area = 1
		new_pipes[n.we].entity.max_health = 300
	end
	do -- Nil flow-bob pipes if parent pipe is missing
		if not data.raw.item["bronze-pipe"] then
			new_pipes[n.bs] = nil
			new_pipes[n.bj] = nil
			new_pipes[n.be] = nil
		end
		if not data.raw.item["brass-pipe"] then
			new_pipes[n.as] = nil
			new_pipes[n.aj] = nil
			new_pipes[n.ae] = nil
		end
		if not data.raw.item["titanium-pipe"] then
			new_pipes[n.ts] = nil
			new_pipes[n.tj] = nil
			new_pipes[n.te] = nil
		end
		if not data.raw.item["ceramic-pipe"] then
			new_pipes[n.es] = nil
			new_pipes[n.ej] = nil
			new_pipes[n.ee] = nil
		end
		if not data.raw.item["tungsten-pipe"] then
			new_pipes[n.us] = nil
			new_pipes[n.uj] = nil
			new_pipes[n.ue] = nil
		end
		if not data.raw.item["nitinol-pipe"] then
			new_pipes[n.ls] = nil
			new_pipes[n.lj] = nil
			new_pipes[n.le] = nil
		end
		if not data.raw.item["copper-tungsten-pipe"] then
			new_pipes[n.ws] = nil
			new_pipes[n.wj] = nil
			new_pipes[n.we] = nil
		end
	end
	-- Add generated pipes to data tables
	for k,v in pairs(new_pipes) do
		if not v.recipe.hidden then
			data:extend({v.entity,v.recipe,v.item})
		end
	end
	
	-- Technology add function
	local function add_tech(technology, recipe)
		if data.raw.recipe and data.raw.recipe[recipe] then
			table.insert(data.raw.technology[technology].effects,{type = "unlock-recipe", recipe = recipe})
		end
	end
	
	-- Add pipes to appropriate technologies
	add_tech("steel-processing",				"pipe-steel-straight")
	add_tech("steel-processing",				"pipe-steel-junction")
	add_tech("steel-processing",				"pipe-steel-elbow")
	add_tech("plastics",						"pipe-plastic-straight")
	add_tech("plastics",						"pipe-plastic-junction")
	add_tech("plastics",						"pipe-plastic-elbow")
	-- bobplates techs
	add_tech("alloy-processing",				"pipe-bronze-straight")
	add_tech("alloy-processing",				"pipe-bronze-junction")
	add_tech("alloy-processing",				"pipe-bronze-elbow")
	add_tech("zinc-processing",					"pipe-brass-straight")
	add_tech("zinc-processing",					"pipe-brass-junction")
	add_tech("zinc-processing",					"pipe-brass-elbow")
	add_tech("titanium-processing",				"pipe-titanium-straight")
	add_tech("titanium-processing",				"pipe-titanium-junction")
	add_tech("titanium-processing",				"pipe-titanium-elbow")
	add_tech("ceramics",						"pipe-ceramic-straight")
	add_tech("ceramics",						"pipe-ceramic-junction")
	add_tech("ceramics",						"pipe-ceramic-elbow")
	add_tech("tungsten-processing",				"pipe-tungsten-straight")
	add_tech("tungsten-processing",				"pipe-tungsten-junction")
	add_tech("tungsten-processing",				"pipe-tungsten-elbow")
	add_tech("nitinol-processing",				"pipe-nitinol-straight")
	add_tech("nitinol-processing",				"pipe-nitinol-junction")
	add_tech("nitinol-processing",				"pipe-nitinol-elbow")
	add_tech("tungsten-alloy-processing",		"pipe-copper-tungsten-straight")
	add_tech("tungsten-alloy-processing",		"pipe-copper-tungsten-junction")
	add_tech("tungsten-alloy-processing",		"pipe-copper-tungsten-elbow")
	
	-----------------------------------------------------------------------
	------ INFINITE THANKS TO KIRAZY FOR THE HELP AND DOCUMENTATION  ------
	--------------- https://mods.factorio.com/user/Kirazy -----------------
	-----------------------------------------------------------------------
	if mods ["reskins-bobs"] then
		-- Initialise material mapping
		local material_map =
		{
			["copper"] = {1},
			["stone"] = {1},
			["bronze"] = {2},
			["steel"] = {2},
			["plastic"] = {3},
			["brass"] = {3},
			["titanium"] = {4},
			["ceramic"] = {4},
			["tungsten"] = {4},
			["nitinol"] = {5},
			["copper-tungsten"] = {5}
		}

		-- Assign tiered icons
		for material, map in pairs(material_map) do
		
			local icon_path = "__flow-control-expanded-bob__/graphics/icon/reskin/"
			local tier = map[1]

			-- Bob straight pipe
			str_bob_pipe_icon_inputs =
			{
				icon = icon_path .. "pipe-" .. material .. "-straight.png",
				icon_size = 64,
				icon_mipmaps = 4,
				make_icon_pictures = true
			}

			-- Bob junction pipe
			jun_bob_pipe_icon_inputs =
			{
				icon = icon_path .. "pipe-" .. material .. "-junction.png",
				icon_size = 64,
				icon_mipmaps = 4,
				make_icon_pictures = true
			}

			-- Bob elbow pipe
			elb_bob_pipe_icon_inputs =
			{
				icon = icon_path .. "pipe-" .. material .. "-elbow.png",
				icon_size = 64,
				icon_mipmaps = 4,
				make_icon_pictures = true
			}

			-- Straight pipe
			str_pipe_icon_inputs =
			{
				icon = icon_path .. "pipe-straight.png",
				icon_size = 64,
				icon_mipmaps = 4,
				make_icon_pictures = true
			}

			-- Junction pipe
			jun_pipe_icon_inputs =
			{
				icon = icon_path .. "pipe-junction.png",
				icon_size = 64,
				icon_mipmaps = 4,
				make_icon_pictures = true
			}

			-- Elbow pipe
			elb_pipe_icon_inputs =
			{
				icon = icon_path .. "pipe-elbow.png",
				icon_size = 64,
				icon_mipmaps = 4,
				make_icon_pictures = true
			}

			-- Setup tier labels
			if reskins.lib.setting("reskins-bobs-do-pipe-tier-labeling") == true then
				str_bob_pipe_icon_inputs.icon = {{icon = str_bob_pipe_icon_inputs.icon}}
				jun_bob_pipe_icon_inputs.icon = {{icon = jun_bob_pipe_icon_inputs.icon}}
				elb_bob_pipe_icon_inputs.icon = {{icon = elb_bob_pipe_icon_inputs.icon}}
				str_pipe_icon_inputs.icon = {{icon = str_pipe_icon_inputs.icon}}
				jun_pipe_icon_inputs.icon = {{icon = jun_pipe_icon_inputs.icon}}
				elb_pipe_icon_inputs.icon = {{icon = elb_pipe_icon_inputs.icon}}

				str_bob_pipe_icon_inputs.tier_labels = true
				jun_bob_pipe_icon_inputs.tier_labels = true
				elb_bob_pipe_icon_inputs.tier_labels = true
				str_pipe_icon_inputs.tier_labels = true
				jun_pipe_icon_inputs.tier_labels = true
				elb_pipe_icon_inputs.tier_labels = true

				reskins.lib.append_tier_labels(tier, str_bob_pipe_icon_inputs)
				reskins.lib.append_tier_labels(tier, jun_bob_pipe_icon_inputs)
				reskins.lib.append_tier_labels(tier, elb_bob_pipe_icon_inputs)
				reskins.lib.append_tier_labels(1, str_pipe_icon_inputs)
				reskins.lib.append_tier_labels(1, jun_pipe_icon_inputs)
				reskins.lib.append_tier_labels(1, elb_pipe_icon_inputs)
			else
				str_bob_pipe_icon_inputs.tier_labels = false
				jun_bob_pipe_icon_inputs.tier_labels = false
				elb_bob_pipe_icon_inputs.tier_labels = false
				str_pipe_icon_inputs.tier_labels = false
				jun_pipe_icon_inputs.tier_labels = false
				elb_pipe_icon_inputs.tier_labels = false
			end

			-- Handle naming
			str_bob_pipe_icon_name = "pipe-" .. material .."-straight"
			jun_bob_pipe_icon_name = "pipe-" .. material .."-junction"
			elb_bob_pipe_icon_name = "pipe-" .. material .."-elbow"
			str_pipe_icon_name = "pipe-straight"
			jun_pipe_icon_name = "pipe-junction"
			elb_pipe_icon_name = "pipe-elbow"

			-- Assign tiering and icons to targeted pipes
			reskins.lib.assign_icons(str_bob_pipe_icon_name, str_bob_pipe_icon_inputs)
			reskins.lib.assign_icons(jun_bob_pipe_icon_name, jun_bob_pipe_icon_inputs)
			reskins.lib.assign_icons(elb_bob_pipe_icon_name, elb_bob_pipe_icon_inputs)
			reskins.lib.assign_icons(str_pipe_icon_name, str_pipe_icon_inputs)
			reskins.lib.assign_icons(jun_pipe_icon_name, jun_pipe_icon_inputs)
			reskins.lib.assign_icons(elb_pipe_icon_name, elb_pipe_icon_inputs)
		end
	end
end
