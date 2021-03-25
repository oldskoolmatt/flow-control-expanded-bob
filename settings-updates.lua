

-- Void setting function
local function remove_setting(setting, name)
	if data.raw[setting] and data.raw[setting][name] then
		data.raw[setting][name] = nil
		data:extend
		({
			{
				type = "string-setting",
				name = name,
				setting_type = "startup",
				default_value = "VOID",
				allowed_values = {"VOID"},
				hidden = true
			}
		})
	end
end

-- Removed settings
remove_setting("bool-setting", "flow-control-new-group")