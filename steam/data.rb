class SteamData

	attr_accessor :last_user
	attr_accessor :last_time
	attr_accessor :steam_keys

	def initialize
		@last_user = nil
		@last_time = nil
		@steam_keys = {}
	end

	def get_game_name(appid)

	end

	def get_game_url(appid)
	end

	def self.load
		if FileTest.exists?("data/keys.bin")
			f = File.open("data/keys.bin", "r")
			$steam_data = Marshal.load(f)
			f.close
		end
	end

	def self.save
		f = File.open("data/keys.bin", "w")
		Marshal.dump($steam_data, f)
		f.close
	end

end

if SteamConfig::Enabled
	$steam_data = SteamData.new
	SteamData.load
end