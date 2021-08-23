-------------------
---- MIGRATION ----
-------------------

-- Load migration table
local migration_table =
{
	["valve-return"] = "flowbob-check-valve",
	["valve-overflow"] = "flowbob-overflow-valve",
	["valve-underflow"] = "flowbob-topup-valve-2",
	["check-valve"] = "flowbob-check-valve",
	["overflow-valve"] = "flowbob-overflow-valve",
	["underflow-valve"] = "flowbob-topup-valve-2"
}

-- Look for entities to be migrated
for _, surface in pairs (game.surfaces, migration_table) do
	local valves = surface.find_entities_filtered{name = migration_table}
	for _, valve in pairs (valves) do
		
		-- Store entity properties
		local name = valve.name
		local position = valve.position
		local force = valve.force
		if not name then return else end

		-- Migrate entity and fix position
		valve.destroy()
		surface.create_entity
		{
			name = name,
			position = position,
			reverse = true,
			force = force,
			fast_replace = true,
			spill = false,
			raise_built = true,
			create_build_effect_smoke = false
		}
	end
end