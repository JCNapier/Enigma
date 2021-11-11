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
end 