# These are the settings you can control for your server.

module ChaosBot

	module BotSettings
		BotToken         = nil
		ClientID         = nil
		CommandPrefix    = '$'
	end

	module RPGSettings
		MaxGold          = 99999
		MaxLevel         = 99
		MaxStats         = 999
	end

end

# Converting Config Modules to hash for easy JSON access and allowing to change settings on fly using commands. 
# Probably not super important that the BotSettings get changed without restarting, but its there for convenience sake. 

$settings = {

		"BotSettings" => {
			"BotToken" => nil,
			"ClientID" => nil,
			"CommandPrefix" => '$',
		},
		# Honestly, this should probably go in its own file in the RPG module, but meh, lazynesssssssss
		"RPGSettings" => {
			"MaxGold" => 99999,
			"MaxLevel" => 99,
			"MaxStats" => 999,
		}
}
