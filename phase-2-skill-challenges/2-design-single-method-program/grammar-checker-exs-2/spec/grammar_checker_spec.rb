require 'grammar_checker'

RSpec.describe "grammar_checker_method" do
  it "returns false when no sentence is passed" do
    result = check_grammar("")
    expect(result).to eq false
  end

  it "returns true when the sentence starts with a capital letter and finishes with a full stop" do
    result = check_grammar("This is a sentence.")
    expect(result).to eq true
  end

  it "returns false when the sentence starts with a small letter and finishes with a full stop" do
    result = check_grammar("this is a sentence.")
    expect(result).to eq false
  end

  it "returns false when the sentence starts with a capital letter and has no full stop" do
    result = check_grammar("This is a sentence")
    expect(result).to eq false
  end

  it "returns false when the sentence starts with a small letter and has no full stop" do
    result = check_grammar("this is a sentence")
    expect(result).to eq false
  end
end