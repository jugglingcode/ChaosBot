# This example is nearly the same as the normal ping example, but rather than simply responding with "Pong!", it also
# responds with the time it took to send the message.

require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MjA4NjY0MzY3NTkwMjc3MTIw.CtssUw.pfNXMoUBRsBC39hxdDFpx_xKFYY', client_id: 208664297801252865, prefix: '!'

=begin
bot.message(content: 'Ping!') do |event|
  # The `respond` method returns a `Message` object, which is stored in a variable `m`. The `edit` method is then called
  # to edit the message with the time difference between when the event was received and after the message was sent.
  m = event.respond('Pong!')
  m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
end
=end

bot.command(:roll) do |event, *args|
  # Roll COMMAND bitches /////
  die = 1
  sides = 6
  if args.size > 0
  	if args.size > 1
  	end
  end
  return Random.new.rand(1..6) 
end

bot.run
