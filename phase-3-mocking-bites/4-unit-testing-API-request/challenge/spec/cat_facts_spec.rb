require "cat_facts"

RSpec.describe CatFacts do
  it "returns a fact about cats" do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI("https://catfact.ninja/fact")
    ).and_return( 
      '{"fact":"Cats have 300 million neurons; dogs have about 160 million","length":58}' 
    )
    cat_facts = CatFacts.new(fake_requester)
    expect(cat_facts.provide).to eq 'Cat fact: Cats have 300 million neurons; dogs have about 160 million'
  end
end