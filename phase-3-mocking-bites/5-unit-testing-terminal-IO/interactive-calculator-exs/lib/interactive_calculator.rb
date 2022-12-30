class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will subtract two numbers.\nPlease enter a number"
    number_1 = @io.gets.chomp.to_i
    @io.puts "Please enter another number"
    number_2 = @io.gets.chomp.to_i
    @io.puts "Here is your result:\n#{number_1} - #{number_2} = #{number_1 - number_2}"
  end
end

# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run

# REQUIRED OUTPUT:
# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1