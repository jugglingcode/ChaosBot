module Commands_Steam
  extend Discordrb::Commands::CommandContainer

  # Text channels commands can be used in. Must be an array. Can add more than one. Remove this line if global commands.
  @channel_restrict = ['bot-testing', 'steam-keys']
  # Custom message when user tries command in wrong channel. Default message will be used if this line is removed.
  #@channel_restrict_message = "Some custom error message: #{@channel_restrict}"

  command(:listgames) { |event|
  	if $settings["Steam"]["Enabled"]
    	"This command is used to list all of the available steam keys we have."
    else
    	$settings["Steam"]["DisabledMessage"]
    end
  }

  command(:addkey) { |event|
  	if $settings["Steam"]["Enabled"]
  		"This command is used to donate steam keys."
  	else
    	$settings["Steam"]["DisabledMessage"]
    end
  }

  command(:redeem) { |event|
  	if $settings["Steam"]["Enabled"]
  		"This command is to redeem a key"
  	else
    	$settings["Steam"]["DisabledMessage"]
    end
  }
end