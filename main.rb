require 'discordrb'
require_relative 'config.rb'
require_relative 'rpg/data.rb'

$clientID = ARGV[0] == nil ? ChaosBot::BotSettings::ClientID : ARGV[0].to_i
$botToken = ARGV[1] == nil ? ChaosBot::BotSettings::BotToken : ARGV[1].to_s

$bot = Discordrb::Commands::CommandBot.new token: $botToken, client_id: $clientID, prefix: ChaosBot::BotSettings::CommandPrefix
$bot.ready() { |event| 
	$bot.game = "Use $help to get started"
}
require_relative 'rpg/classes.rb'
require_relative 'rpg/commands.rb'
require_relative 'rpg/player.rb'
require_relative 'rpg/enemy.rb'

$bot.run