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
end 