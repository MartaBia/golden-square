require 'make_snippet'

describe "make_snippet method" do
  it "returns the string passed to it if under 5 words" do
    result = make_snippet('this is a test')
    expect(result).to eq "this is a test"
  end

  it "prints first five words and three dots" do
    result = make_snippet('this is a test string number two for my programme')
    expect(result).to eq "this is a test string..."
  end
end