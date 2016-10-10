$bot.command(:test) { |event| 
	event << "Soulshaker3 likes to eat dicks"
}

$bot.command(:roll) { |event, *args|
	rand = Random.new
	if args.size >= 1
		dice = args[0].to_i
		sides = 6
		if args.size > 1
			sides = args[1].to_i
		end
		total = 0
		output = event.user.name + " rolled a "
		for i in 0...dice
			total += rand.rand(1..sides)
		end
		total
	else
		rand.rand(1..6)
	end
}

$bot.command(:classes, description: "Lists all available classes to play as.", usage: "!classes") { |event| 
	event << "List of available classes"
	$classes.each_key {|key| 
		event << '`' + key + '`'
	}
	nil
}

$bot.command(:stat_test) { |event, *args| 
	player = nil
	if args.size > 0
		user = $bot.parse_mention(args[0])
		if user == nil
			"User '" + args[0] + "' doesn't exist."
		else
			user_id = user.id.to_s
			if $players.has_key?(user_id)
				player = $players[user_id]
			else
				args[0] + " has not started their character yet."
			end
		end
	else
		user_id = event.user.id.to_s
		if $players.has_key?(user_id)
			player = $players[user_id]
		else
			"You have not started your character yet. Use !start to get started."
		end
	end
	if player != nil
		"```Name: " + player["name"] + "\r\nClass: " + player["class"] + "\r\nGold: " + player["gold"].to_s + "```"
	end
}

$bot.command(:start) { |event, *args| 
	# This will start a player
	if $players.has_key?(event.user.id)
		event.user.pm("You've already registered your character on this server.")
		nil
	elsif args.size < 2
		event.user.pm("Make sure you pick a name and a starting class. Do !classes for a list of classes.\r\n`!start Warrior Agathor the Great`")
		nil
	else
		player_class = args.shift
		player_name = args.join(" ")
		if $classes.has_key?(player_class)
			$players[event.user.id.to_s] = {
				"name" => player_name,
				"class" => player_class,
				"gold" => 100,
				"id" => event.user.id
			}
		else
			event.user.pm("I'm sorry but '" + player_class + "' doesn't exist. Please use !classes to get a list of classes.")
		end
	end
}

$bot.command(:pmme) { |event|
  event.user.pm("Hello there!")
}