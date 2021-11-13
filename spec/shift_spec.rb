require "time"
require "rspec"
require "./lib/shift"
require "./lib/generator"
require "./lib/alphabet_index"
require_relative "./spec_helper"

describe Shift do
  let(:shift) {Shift.new}
  let(:generator) {Generator.new}

  it 'exists' do
    expect(shift).to be_an_instance_of(Shift)
  end

   it '#create shift' do 
    expect(shift.create_shift("06100", "6641")).to eq([12, 67, 14, 1])
    expect(shift.create_shift("00000", "4852")).to eq([4, 8, 5, 2])
  end

  it '#reverse shift' do 
    expect(shift.reverse_shift("00000", "4852")).to eq([-4, -8, -5, -2])
    expect(shift.reverse_shift("00409", "2881")).to eq([-2, -12, -48, -10])
  end

  it '#letters to integers' do 
    expect(shift.letters_to_integers("johnnyboy!")).to eq([9, 14, 7, 13, 13, 24, 1, 14, 24, "!"])
    expect(shift.letters_to_integers("dog")).to eq([3, 14, 6])
  end

  it '#shift applicator' do 
    expect(shift.shift_applicator([9, 14, 7, 13, 13, 24, "!", 1, 14, 24, "!"], "00009", "6641")).to eq("lwpxpf!lqf!")
  end

  it '#unshift applicator' do 
    expect(shift.un_shift_applicator([11, 22, 15, 20, 15, 5, "!", 8, 16, 5, "!", "\n"], "00409", "6641"))
  end
end 