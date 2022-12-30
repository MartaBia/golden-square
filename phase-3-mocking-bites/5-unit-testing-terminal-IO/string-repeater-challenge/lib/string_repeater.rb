class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will repeat a string many times.\nPlease enter a string"
    user_entry = @io.gets.chomp
    @io.puts "Please enter a number of repeats"
    number_of_repetitions = @io.gets.chomp.to_i
    return @io.puts string_repeater(user_entry, number_of_repetitions) if number_of_repetitions <= 0
    @io.puts "Here is your result:\n#{string_repeater(user_entry, number_of_repetitions)}"
  end

  private

  def string_repeater(entry, repetitions)
    return "Number of repetitions must be above 0" if repetitions <= 0
    return entry.upcase * repetitions
  end
end

# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run

# REQUIRED OUTPUT:
# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX