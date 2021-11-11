require "rspec"
require "./lib/generator"

describe Generator do
  let(:generator) {Generator.new}

  it 'exists' do
    expect(generator).to be_an_instance_of(Generator)
  end

  it 'attributes' do
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", 
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", 
      "u", "v", "w", "x", "y", "z", " "]

    expect(generator.alphabet).to eq(expected)
    expect(generator.alphabet).to be_an(Array)
    expect(generator.alphabet.length).to eq(27)
    expect(generator.alphabet.sample.class).to eq(String)
  end
end 