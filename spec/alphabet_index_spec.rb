require "rspec"
require "./lib/alphabet_index"

describe AlphabetIndex do 
  let(:alpha) {AlphabetIndex.new} 

  it 'exists' do 
      expect(alpha).to be_an_instance_of(AlphabetIndex)
  end

  it 'attributes' do 
      expect(alpha.index).to be_a(Hash)
      expect(alpha.index.count).to eq(27)
  end
end