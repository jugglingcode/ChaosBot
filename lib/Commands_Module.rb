=begin
=====================================================================
DO NOT CHANGE ANYTHING HERE UNLESS YOU KNOW WHAT YOU'RE DOING!!
IT IS IMPERITIVE THAT THIS FILE BE LOADED BEFORE ANY COMMANDS ARE 
ADDED TO THE BOT!

Extended some of the default modules from discordrb. Added an option
to commands to prevent their usage from certain text channels as well
as an ability to put some custom text message when used in wrong
channels.


When making new commands for the bot, create a module like so:


module SomeModuleNameHere
  extend Discordrb::Commands::CommandContainer

  # Text channels commands can be used in. Must be an array. Can add more than one. Remove this line if global commands.
  @channel_restrict = ['text-channel']
  # Custom message when user tries command in wrong channel. Default message will be used if this line is removed.
  @channel_restrict_message = "Some custom error message: #{@channel_restrict}"

  command(:mycommand) { |event|
    event.send_message("This command works here!")
  }
end

=====================================================================
=end

module Discordrb::Commands
  # Command that can be called in a chain
  class Command
    def initialize(name, attributes = {}, &block)
      @name = name
      @attributes = {
        # The lowest permission level that can use the command
        permission_level: attributes[:permission_level] || 0,

        # Message to display when a user does not have sufficient permissions to execute a command
        permission_message: attributes[:permission_message].is_a?(FalseClass) ? nil : (attributes[:permission_message] || "You don't have permission to execute command %name%!"),

        # Discord action permissions required to use this command
        required_permissions: attributes[:required_permissions] || [],

        # Roles required to use this command
        required_roles: attributes[:required_roles] || [],

        # Whether this command is usable in a command chain
        chain_usable: attributes[:chain_usable].nil? ? true : attributes[:chain_usable],

        # Whether this command should show up in the help command
        help_available: attributes[:help_available].nil? ? true : attributes[:help_available],

        # Description (for help command)
        description: attributes[:description] || nil,

        # Usage description (for help command and error messages)
        usage: attributes[:usage] || nil,

        # Parameter list (for help command and error messages)
        parameters: attributes[:parameters] || nil,

        # Minimum number of arguments
        min_args: attributes[:min_args] || 0,

        # Maximum number of arguments (-1 for no limit)
        max_args: attributes[:max_args] || -1,

        # Message to display upon rate limiting (%time% in the message for the remaining time until the next possible
        # request, nil for no message)
        rate_limit_message: attributes[:rate_limit_message],

        # Rate limiting bucket (nil for no rate limiting)
        bucket: attributes[:bucket],

        # Commands restricted only to the following list of text channels
        channels: attributes[:channels] || [],
        # Displays an error message if using a command outside of the allowed text channels
        channels_message: attributes[:channels_message] || "This command may only be used in the following channels: #{attributes[:channels]}",

        # Denotes whether the command is enabled or not, NOT ACTUALLY BEING USED AT THE MOMENT
        enabled: attributes[:enabled],
        disabled_message: attributes[:disabled_message] || "`#{name}`, or its module, is not enabled.",
      }

      @block = block
    end

    alias recall_command call
    def call(event, arguments, chained = false)
      if @attributes[:channels].nil? || @attributes[:channels] == [] || @attributes[:channels].include?(event.channel.name)
        return recall_command(event, arguments, chained)
      elsif @attributes[:channels_message].is_a?(String)
        event.send_message(@attributes[:channels_message])
        return
      end
      nil
    end
  end
end

module Discordrb::Commands::CommandContainer
    alias modded_command_method command
    def command(name, attributes = {}, &block)
      attributes[:channels] = @channel_restrict
      attributes[:channels_message] = @channel_restrict_message
      modded_command_method(name, attributes, &block)
    end
end