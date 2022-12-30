require_relative '../lib/todo'

RSpec.describe 'todo' do
    it 'returns false when no TODO in the string ' do 
        result = has_it("I have nothing to do")
        expect(result).to eq false
    end 
    it 'returns true when TODO in the string ' do 
        result = has_it("I have TODO everything!")
        expect(result).to eq true
    end
end