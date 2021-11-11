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

  it 'can decrypt messages and handle uppercase letters' do 
    expect(enigma.decrypt("keDer ohUlw", "02715", "040895")).to eq({
    decryption: "hello world",
    key: "02715",
    date: "040895"
    })
  end 
end 