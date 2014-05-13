class Dice
	attr_reader :throws, :faces, :operator, :modifier, :replace, :results, :sum

	PATTERN = /(?<entire>\(?(?<throws>\d+)[Dd](?<faces>\d{1,3})(?<operator>\+|-|\*|\/)?(?<modifier>\d+)?\)?)/
	DICE_TOKEN = "D"
	RANDOM = Random.new

	def initialize(throws, faces, operator = nil, modifier = nil, replace = nil)
		@throws = Integer(throws)
		@faces = Integer(faces)
		@operator = operator
		@modifier = Integer(modifier) unless modifier.nil?
		@replace = replace
		@results = []
		@sum = 0
		@resultSum = 0
	end

	def roll
		@throws.times do
			@results << RANDOM.rand(1..@faces)
			@resultSum+=@results.last
		end
		@sum = @resultSum
		@sum = @sum.send(@operator, @modifier) unless modifier.nil? or operator.nil?
		return @sum
	end

	def to_s
		s = "#{@throws}#{DICE_TOKEN}#{@faces}#{@operator}#{@modifier}"
		s = "{ #{s} => #{@results} = #{@resultSum} } = #{sum}" if @results.any?
		s = "(#{s})"
		return s
	end

	def Dice.parse(s)
		m = PATTERN.match(s)
		return Dice.new(m[:throws], m[:faces], m[:operator], m[:modifier], m[:entire])
	end

	def Dice.parseMany(s)
		dices = []
		s.scan(PATTERN).each do |dice|
			dices << Dice.new(dice[1], dice[2], dice[3], dice[4], dice[0])
		end
		return dices
	end

	def Dice.parseManyShowResults(s)
		exps = Dice.parseMany(s)
		replaced = s
		exps.each do |d|
			d.roll
			replaced = replaced.sub(d.replace, d.to_s)
		end
		puts "#{replaced}"
	end

	def Dice.parseManyShowDebug(s)
		puts "Original string: #{s}"
		exps = Dice.parseMany(s)
		replaced = s
		exps.each do |d|
			d.roll
			puts "You made a throw of: #{d}"
			puts "Number dies: #{d.throws}"
			puts "Number faces: #{d.faces}"
			puts "Operator: #{d.operator}"
			puts "Modifier: #{d.modifier}"
			puts "Entire string: #{d.replace}"
			puts "Your dice roll: #{d.to_s}"
			puts "\n\n"
			replaced = replaced.sub(d.replace, d.to_s)
		end
		puts "Replaced string now is: #{replaced}"
	end
end

Dice.parseManyShowDebug('(1d20+13)+(3d4)*(4d6-1)+(25d12+35)-(25d12/76)')
Dice.parseManyShowDebug('This is a string in which I can play D&D. Now roll 1d6 for example, and then a will save by 1d20+5')
Dice.parseManyShowResults('(1d20+13)+(3d4)*(4d6-1)+(25d12+35)-(25d12/76)')
Dice.parseManyShowResults('This is a string in which I can play D&D. Now roll 1d6 for example, and then a will save by 1d20+5')
