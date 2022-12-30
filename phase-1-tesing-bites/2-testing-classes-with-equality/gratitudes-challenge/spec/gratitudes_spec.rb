require 'gratitudes'
RSpec.describe Gratitudes do
  it "compiles array of gratitudes" do
    example_grat = Gratitudes.new
    example_grat.add("good health")
    example_grat.add("nice weather")
    result = example_grat.format
    expect(result).to eq "Be grateful for: good health, nice weather"
  end
end