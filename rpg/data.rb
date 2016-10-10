require 'json'

$players = {
	"54354353415" => {
		"name" => "RPG Dummy",
		"gold" => 100,
		"weapon" => "Blizzard's Staff",
		"id" => 54354353415,
	},
}

module RPGData
	def self.dump

	end
	def self.load

	end
end

if FileTest.exists?("data/players.json")
	RPGData.load("data/players.json")
end