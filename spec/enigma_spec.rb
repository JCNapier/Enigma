require "time"
require "rspec"
require "./lib/enigma"
require "./lib/generator"
require "./lib/alphabet_index"
require_relative "./spec_helper"

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

  it '#create shift' do 
    expect(enigma.create_shift("06100", "6641")).to eq([12, 67, 14, 1])
    expect(enigma.create_shift("00000", "4852")).to eq([4, 8, 5, 2])
  end

  it '#reverse shift' do 
    expect(enigma.reverse_shift("00000", "4852")).to eq([-4, -8, -5, -2])
    expect(enigma.reverse_shift("00409", "2881")).to eq([-2, -12, -48, -10])
  end

  it '#letters to integers' do 
    expect(enigma.letters_to_integers("johnnyboy!")).to eq([9, 14, 7, 13, 13, 24, 1, 14, 24, "!"])
    expect(enigma.letters_to_integers("dog")).to eq([3, 14, 6])
  end

  it '#shift applicator' do 
    expect(enigma.shift_applicator([9, 14, 7, 13, 13, 24, "!", 1, 14, 24, "!"], "00009", "6641")).to eq("lwpxpf!lqf!")
  end

  it '#unshift applicator' do 
    expect(enigma.un_shift_applicator([11, 22, 15, 20, 15, 5, "!", 8, 16, 5, "!", "\n"], "00409", "6641"))
  end

  it 'can encrypt messages' do
    expect(enigma.encrypt("hello world", "02715", "040895")).to eq({
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
    })
  end 

  it 'can encrypt upper case messages' do 
    expect(enigma.encrypt("JOHN", "03330", "061092")).to eq({
    encryption: "oytu",
    key: "03330",
    date: "061092"
    })
  end

  it 'can encrypt special characters' do 
    expect(enigma.encrypt("JOHN!", "03330", "061092")).to eq({
    encryption: "oytu!",
    key: "03330",
    date: "061092"
    })
  end

  it 'can decrypt messages' do 
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq({
    decryption: "hello world",
    key: "02715",
    date: "040895"
    })
  end

  it 'can decrypt special characters' do 
    expect(enigma.decrypt("oytu!", "03330", "061092")).to eq({
    decryption: "john!",
    key: "03330",
    date: "061092"
    })
  end

  it 'can decrypt messages and handle uppercase letters' do 
    expect(enigma.decrypt("keDer ohUlw", "02715", "040895")).to eq({
    decryption: "hello world",
    key: "02715",
    date: "040895"
    })
  end 
end 