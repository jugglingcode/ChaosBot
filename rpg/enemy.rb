class Enemy
	attr_accessor :hp
	def initialize
		@hp = 20
	end

	def test(player)
		puts player.gold
	end

	def test2
		p = Player.new
		p.gold = 200
		puts p.gold
	end
end