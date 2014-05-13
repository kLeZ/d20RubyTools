class Dice
	attr_reader :throws, :faces, :operator, :modifier

	PATTERN = /\(?(?<throws>\d+)[Dd](?<faces>\d{1,3})(?<operator>\+|-|\*|\/)?(?<modifier>\d+)?\)?/
	DICE_TOKEN = "D"

	def initialize(throws, faces, operator = nil, modifier = Fixnum::MIN, replace = "")
		@throws = throws
		@faces = faces
		@operator = operator
		@modifier = modifier
		@replace = replace
		@results = []
	end

	def Dice.parse(s)
		m = PATTERN.match(s)
		return Dice.new(m[:throws], m[:faces], m[:operator], m[:modifier])
	end

	def Dice.parseMany(s)
		puts "Original string: #{s}"
		dices = []
		s.scan(PATTERN).each do |dice|
			puts dice
			dices << Dice.new(dice[0], dice[1], dice[2], dice[3])
		end
		return dices
	end

	def Dice.parseManyShowResults(s)
		exps = Dice.parseMany(s)
		exps.each do |d|
			puts "You made a throw of: #{d}"
			puts "Number dies: #{d.throws}"
			puts "Number faces: #{d.faces}"
			puts "Operator: #{d.operator}"
			puts "Modifier: #{d.modifier}"
		end
	end
end

Dice.parseManyShowResults('1d20+13+3d4*4d6-1')
Dice.parseManyShowResults('1d20+13+(3d4)*4d6-1')
Dice.parseManyShowResults('(1d20+13)+(3d4)*(4d6-1)')
