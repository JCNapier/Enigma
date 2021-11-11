require "rspec"
require "./lib/generator"

describe Generator do
  let(:generator) {Generator.new}

  it 'exists' do
    expect(generator).to be_an_instance_of(Generator)
  end