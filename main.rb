require 'discordrb'
require_relative 'config.rb'

# ClientID and BotToken are obtained either from config.rb or as passed arguments in the console
raise "Too many arguments! The command is ruby main.rb [CLIENT_ID BOT_TOKEN]" if ARGV.size > 2
ARGV.each{ |arg|
  if arg.size >= 30 # Just using a large arbitrary number...
    $botToken = arg
  else
    $clientID = arg
  end
}

# Grabs Client ID and Token from passed arguments, else resorts to BotSettings
$clientID = ARGV[0] == nil ? ChaosBot::BotSettings::ClientID : ARGV[0].to_i if $clientID == nil
$botToken = ARGV[1] == nil ? ChaosBot::BotSettings::BotToken : ARGV[1].to_s if $botToken == nil

# If either is not provided, alert user and exit the program
error_msg = "\nPlease consult config.rb or use the following command in console when starting the bot:\nruby main.rb [CLIENT_ID BOT_TOKEN]"
if $clientID.nil?
  puts "\nERROR: No Client ID was specified!" + error_msg
  exit
elsif $botToken.nil?
  puts "\nERROR: No Bot Token was specified!" + error_msg
  exit
end

# Create the command bot
$bot = Discordrb::Commands::CommandBot.new token: $botToken, client_id: $clientID, prefix: ChaosBot::BotSettings::CommandPrefix
$bot.ready() { |event| 
  $bot.game = "Use $help to get started"
  # AT SOME POINT IMPLEMENT LOADING DATA FILES HERE, OR SOMEWHERE ELSE, I DON'T CARE
}
# Read in the rest of the supporting classes that contain classes or other bot commands.
# This particular command allows requiring all .rb files in a certain directory.
Dir["./lib/*.rb"].each { |file| require_relative file }
Dir["./rpg/*.rb"].each { |file| require_relative file }
Dir["./steam/*.rb"].each { |file| require_relative file }
Dir["./commands/*.rb"].each { |file| require_relative file }
# Adds command containers here
$bot.include!(Commands_Test)
$bot.include!(Commands_RPG)
$bot.include!(Commands_Steam)
# Start the bot asynchronously
$bot.run :async
# Program will now be stuck in this loop until bot closes. Use for time-related events or the like.
while true
  # Do whatever you want here.
end