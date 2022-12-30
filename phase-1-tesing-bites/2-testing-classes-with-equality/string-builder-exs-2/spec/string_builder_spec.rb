require 'string_builder'

RSpec.describe StringBuilder do
  it "build a string" do
    example_string = StringBuilder.new
    example_string.add("Hello!")
    result = example_string.size
    expect(result).to eq 6
  end

  it "build a string" do
    example_string = StringBuilder.new
    example_string.add("Hello!")
    result = example_string.output
    expect(result).to eq "Hello!"
  end

  it "build a string" do
    example_string = StringBuilder.new
    example_string.add("Hello, ")
    example_string.add("Marta")
    result = example_string.output
    expect(result).to eq "Hello, Marta"
  end

  it "build a string" do
    example_string = StringBuilder.new
    example_string.add("Hello, ")
    example_string.add("Marta")
    result = example_string.size
    expect(result).to eq 12
  end
end