require 'json'

$players = {
	"54354353415" => {
		"name" => "RPG Dummy",
		"gold" => 100,
		"weapon" => "Blizzard's Staff",
		"id" => 54354353415,
	},
}

# Doing it wrong. Need to create a servers hash to keep players data separate from other servers.
# Will need to add TO the "bot ready" method and detect servers. 

$servers = {
	"server id" => {
		"player id" => {
			"name" => "RPG Dummy"
		}
	}
}

module RPGData
	def self.dump

	end
	def self.load(file)

	end
end

if FileTest.exists?("data/players.json")
	RPGData.load("data/players.json")
end