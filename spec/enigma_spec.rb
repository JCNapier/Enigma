require "time"
require "rspec"
require "./lib/enigma"
require "./lib/generator"
require "./lib/alphabet_index"

describe Enigma do
  let(:enigma) {Enigma.new}
  let(:generator) {Generator.new}

  it 'exists' do
    expect(enigma).to be_an_instance_of(Enigma)
  end

  it 'attributes' do
    expect(enigma.generator).to be_an_instance_of(Generator)
    expect(enigma.alphabet_hash).to be_an_instance_of(AlphabetIndex)
    expect(enigma.gen_time.length).to eq(4)
    expect(enigma.gen_time).to be_a(String)
    expect(enigma.gen_key).to be_a(String)
    expect(enigma.gen_key.length).to eq(5)
    expect(enigma.encrypted).to be_a(Hash)
    expect(enigma.encrypted.length).to eq(3)
  end
end 