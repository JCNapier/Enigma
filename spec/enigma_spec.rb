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
end 