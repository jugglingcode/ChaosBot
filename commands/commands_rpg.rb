module Commands_RPG
  extend Discordrb::Commands::CommandContainer

  # Text channels commands can be used in. Must be an array. Can add more than one. Remove this line if global commands.
  @channel_restrict = ['rpg-fun', 'bot-testing']
  # Custom message when user tries command in wrong channel. Default message will be used if this line is removed.
  #@channel_restrict_message = "Some custom error message: #{@channel_restrict}"

  command(:mycommand) { |event|
    event.send_message("This command works here!")
  }
end