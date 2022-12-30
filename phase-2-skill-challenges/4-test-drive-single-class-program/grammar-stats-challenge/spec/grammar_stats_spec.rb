require 'grammar_stats'

RSpec.describe GrammarStats do
  describe "#check" do
    context "When given a text" do
      it "returns true if text begins with a capital letter and ends with a sentence-ending punctuation mark" do
        text_1 = GrammarStats.new
        expect(text_1.check("Hello!")).to eq true
      end

      it "returns false if text begins with a big letter and end without a sentence-ending punctuation mark" do
        text_1 = GrammarStats.new
        expect(text_1.check("Hello")).to eq false
      end

      it "returns false if text begins with a small letter and end with a sentence-ending punctuation mark" do
        text_1 = GrammarStats.new
        expect(text_1.check("hello!")).to eq false
      end
    end

    context "When no text has been passed" do
      it "returns an error message when no no text is passed" do
        text_1 = GrammarStats.new
        expect { text_1.check("")}.to raise_error "No text has been passed"
      end
    end
  end

  describe "#percentage_good" do
    it "returns 100 if the texts passed so far are correct" do
      text_1 = GrammarStats.new
      text_1.check("Hello!")
      expect(text_1.percentage_good).to eq 100
    end

    it "returns 75 if 3 of 4 texts are correct" do
      text_1 = GrammarStats.new
      text_1.check("Hello!")
      text_1.check("Hello?")
      text_1.check("Hello.")
      text_1.check("Hello")
      expect(text_1.percentage_good).to eq 75
    end

    it "returns 0 if none of the tests are correct" do
      text_1 = GrammarStats.new
      text_1.check("hello")
      text_1.check("Hello,")
      text_1.check("hello.")
      text_1.check("Hello")
      expect(text_1.percentage_good).to eq 0
    end
  end
end