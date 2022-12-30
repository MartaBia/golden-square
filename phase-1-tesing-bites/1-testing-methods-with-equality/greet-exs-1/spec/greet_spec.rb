require 'greet'

RSpec.describe "greet method" do
  it "returns a greet for given name" do
    result = greet("David")
    expect(result).to eq "Hello, David!"
  end
end