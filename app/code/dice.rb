require 'logger'

class Dice
	attr_reader :throws, :faces, :operator, :modifier, :replace, :results, :sum

	PATTERN = /(?<entire>\(?(?<throws>\d+)[Dd](?<faces>\d{1,3})(\s*(?<operator>\+|-|\*|\/)?\s*(?<modifier>\d+)?)?\)?)(\s*(?<diceoperator>\+|-|\*|\/)?)?/
	DICE_TOKEN = "D"
	RANDOM = Random.new

	@@log = Logger.new(STDOUT)
	@@log.level = Logger::DEBUG

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
			@resultSum += @results.last
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

	def Dice.isManyDice(s)
		return s.scan(PATTERN).any?
	end

	def Dice.parse(s)
		m = PATTERN.match(s)
		return Dice.new(m[:throws], m[:faces], m[:operator], m[:modifier], m[:entire])
	end

	def Dice.parseMany(s)
		{}.tap do |dices|
			s.scan(PATTERN).each do |dice|
				dices[Dice.new(dice[1], dice[2], dice[3], dice[4], dice[0])] = dice[5]
			end
		end
	end

	def Dice.parseManyShowResults(s)
		@@log.debug("Original string: #{s}")

		exps = Dice.parseMany(s)
		replaced = s
		exp = []
		exps.each do |d, dop|
			d.roll
			replaced = replaced.sub(d.replace, d.to_s)
			exp << d.sum
			exp << dop unless dop.nil?

			@@log.debug("You made a throw of: #{d}")
			@@log.debug("Number dies: #{d.throws}")
			@@log.debug("Number faces: #{d.faces}")
			@@log.debug("Operator: #{d.operator}")
			@@log.debug("Modifier: #{d.modifier}")
			@@log.debug("Entire string: #{d.replace}")
			@@log.debug("Your dice roll: #{d.to_s}")
		end
		sums = eval(exp.join)
		@@log.debug("Replaced string now is: #{replaced} :: #{sums}")
		return "#{replaced} :: #{sums}"
	end

	def Dice.logger
		return @@log
	end
end

#Dice.logger.level = Logger::INFO
#puts Dice.parseManyShowResults('(1d20 + 13) + (3d4) * (4d6 - 1) + (25d12 + 35) - (25d12 / 76)')
#puts Dice.parseManyShowResults('This is a string in which I can play D&D. Now roll (1d6) + for example, and then a will save by 1d20+5')
