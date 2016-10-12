module Commands_Steam
  extend Discordrb::Commands::CommandContainer

  # Text channels commands can be used in. Must be an array. Can add more than one. Remove this line if global commands.
  @channel_restrict = ['bot-testing', 'steam-keys']
  # Custom message when user tries command in wrong channel. Default message will be used if this line is removed.
  #@channel_restrict_message = "Some custom error message: #{@channel_restrict}"

  command(:listgames, enabled: SteamConfig::Enabled) { |event|
    "This command is used to list all of the available steam keys we have."
  }

  command(:addkey, enabled: SteamConfig::Enabled) { |event|
  	"This command is used to donate steam keys."
  }

  command(:redeem, enabled: SteamConfig::Enabled) { |event|
  	"This command is to redeem a key"
  }
end