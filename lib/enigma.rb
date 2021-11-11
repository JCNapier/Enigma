require "time"
require_relative "generator"
require_relative "alphabet_index"

class Enigma
  attr_reader :generator,
              :alphabet_hash,
              :gen_key, 
              :gen_time, 
              :encrypted

  def initialize 
    @generator      = Generator.new 
    @alphabet_hash  = AlphabetIndex.new
    @gen_key        = @generator.key_padding(@generator.key_generator) 
    @gen_time       = @generator.offset_generator
    @encrypted      = {encryption: nil, key: nil, date: nil}
  end

  def encrypt(message, key = @gen_key, time = @gen_time)
    new_message = message.downcase
    new_key     = @generator.key_padding(key)
    new_time    = @generator.offset_generator(time)
    letter_code = []
    encrypted_string = []

      #determines shift
    a = (new_key.slice(0..1).to_i) + (new_time.slice(0).to_i)
    b = (new_key.slice(1..2).to_i) + (new_time.slice(1).to_i)
    c = (new_key.slice(2..3).to_i) + (new_time.slice(2).to_i)
    d = (new_key.slice(3..4).to_i) + (new_time.slice(3).to_i)

      #creates integers array representing letters
    new_message.chars.each do |letter|
      if letter != " "
        letter_code << @alphabet_hash.index[letter]
      elsif 
        letter_code << letter
      end
    end
    
      #shifts alphabet, and returns new message
    letter_code.each_with_index do |num, index|
      if num.class == String 
        encrypted_string << num 
      elsif
        index % 4 == 0
        encrypted_string << @generator.alphabet.rotate(a)[num]
      elsif 
        index % 4 == 1
        encrypted_string << @generator.alphabet.rotate(b)[num]
      elsif 
        index % 4 == 2
        encrypted_string << @generator.alphabet.rotate(c)[num]
      elsif 
        index % 4 == 3 
        encrypted_string << @generator.alphabet.rotate(d)[num]
      end
    end
    @encrypted[:encryption] = encrypted_string.join
    @encrypted[:key] = new_key
    @encrypted[:date] = time
    @encrypted
  end
end 