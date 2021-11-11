require "time"

class Generator
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

     #generates a random key as integer
  def key_generator
    key = []
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    lengths = [1, 2, 3, 4, 5]

    (lengths.sample).times do
      key << numbers.sample
    end
    key
  end

  #takes array, turns array to string with leading zeros 
  def key_padding(key_numbers)
    number_string = key_numbers.to_s.delete("[] ,")
    number_string.rjust(5, '0')
  end

  def offset_generator(time = Time.now) #formats time as string
    time = Time.now if time == nil
    time_array = []
    offset = nil

    if time.class == Time 
      array  = time.to_a
      offset = nil 
      
      time_array << array[3].to_s.rjust(2, '0')
      time_array << array[4].to_s.rjust(2, '0')
      time_array << array[5].to_s.slice(2, 3)
      
      squared = time_array.join.to_i ** 2
      offset  = squared.to_s.slice(-4..-1)
    elsif 
      offset = ((time.to_i) ** 2).to_s.slice(-4..-1)
    end 
    offset
  end
end 