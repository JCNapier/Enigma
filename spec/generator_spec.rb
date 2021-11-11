require "rspec"
require "./lib/generator"

describe Generator do
  let(:generator) {Generator.new}
  let(:range) {Range.new(1, 9)}

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

  it '#key generator' do
    expect(generator.key_generator).to be_an(Array)
    expect(generator.key_generator.first.class).to eq(Integer)
    expect(generator.key_generator.last.class).to eq(Integer)
    expect(generator.key_generator.sample.class).to eq(Integer)
    expect(range.include?(generator.key_generator.length)).to be(true)
  end

  it '#key padding' do
    expect(generator.key_padding([1])).to eq("00001")
    expect(generator.key_padding([1, 2, 3])).to eq("00123")
    expect(generator.key_padding([1, 2, 3, 4])).to eq("01234")
    expect(generator.key_padding([1, 2, 3, 4, 5])).to eq("12345")
    expect(generator.key_padding([0, 0, 0, 0])).to eq("00000")
  end

  it 'can generate an offset' do
    expect(generator.offset_generator("061092")).to eq("2464")
    expect(generator.offset_generator("040895")).to eq("1025")
    expect(generator.offset_generator(Time.new(1995, 8, 4))).to eq("1025")
    expect(generator.offset_generator(Time.new(1930, 12, 8))).to eq("2900")
    expect(generator.offset_generator(Time.new(2021, 12, 8))).to eq("0841")
  end
end 