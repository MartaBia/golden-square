require 'interactive_calculator'

RSpec.describe InteractiveCalculator do
  it "returns a positive number when sustract a smaller number to a bigger one" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.\nPlease enter a number")
    expect(io).to receive(:gets).and_return("5")
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Here is your result:\n5 - 3 = 2")

    calculator = InteractiveCalculator.new(io)
    calculator.run
  end

  it "returns a negative number when sustract a bigger number to a smaller one" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.\nPlease enter a number")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets).and_return("5")
    expect(io).to receive(:puts).with("Here is your result:\n2 - 5 = -3")

    calculator = InteractiveCalculator.new(io)
    calculator.run
  end
end