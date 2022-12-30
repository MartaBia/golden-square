require 'string_repeater'

RSpec.describe StringRepeater do
  context "when insterted a positive number of repetitions" do
    it "returns a given string 3 times" do
      io = double :io
      expect(io).to receive(:puts).with("Hello. I will repeat a string many times.\nPlease enter a string")
      expect(io).to receive(:gets).and_return("ciao")
      expect(io).to receive(:puts).with("Please enter a number of repeats")
      expect(io).to receive(:gets).and_return("3")
      expect(io).to receive(:puts).with("Here is your result:\nCIAOCIAOCIAO")

      string_repeater = StringRepeater.new(io)
      string_repeater.run
    end
  end

  context "when inserted 0 as repetitions number" do
    it "returns an error message" do
      io = double :io
      expect(io).to receive(:puts).with("Hello. I will repeat a string many times.\nPlease enter a string")
      expect(io).to receive(:gets).and_return("ciao")
      expect(io).to receive(:puts).with("Please enter a number of repeats")
      expect(io).to receive(:gets).and_return("0")
      expect(io).to receive(:puts).with("Number of repetitions must be above 0")

      string_repeater = StringRepeater.new(io)
      string_repeater.run
    end
  end

  context "when inserted a negative number as repetitions number" do
    it "returns an error message" do
      io = double :io
      expect(io).to receive(:puts).with("Hello. I will repeat a string many times.\nPlease enter a string")
      expect(io).to receive(:gets).and_return("ciao")
      expect(io).to receive(:puts).with("Please enter a number of repeats")
      expect(io).to receive(:gets).and_return("-9")
      expect(io).to receive(:puts).with("Number of repetitions must be above 0")

      string_repeater = StringRepeater.new(io)
      string_repeater.run
    end
  end
end