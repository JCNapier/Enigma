class Shift
  attr_reader :generator,
              :alphabet_hash,
              :gen_key, 
              :gen_time

  def initialize 
    @generator      = Generator.new 
    @alphabet_hash  = AlphabetIndex.new
    @gen_key        = @generator.key_padding(@generator.key_generator) 
    @gen_time       = @generator.offset_generator
  end

  #determines encrypt shift 
  def create_shift(key, time)
    a = (key.slice(0..1).to_i) + (time.slice(0).to_i)
    b = (key.slice(1..2).to_i) + (time.slice(1).to_i)
    c = (key.slice(2..3).to_i) + (time.slice(2).to_i)
    d = (key.slice(3..4).to_i) + (time.slice(3).to_i)
    [a, b, c, d]
  end

  #determines decrypt shift
  def reverse_shift(key, time)
    a = ((key.slice(0..1).to_i) + (time.slice(0).to_i)) * -1
    b = ((key.slice(1..2).to_i) + (time.slice(1).to_i)) * -1
    c = ((key.slice(2..3).to_i) + (time.slice(2).to_i)) * -1
    d = ((key.slice(3..4).to_i) + (time.slice(3).to_i)) * -1 
    [a, b, c, d]
  end

  def letters_to_integers(message)
    message.chars.map do |letter|
      if !@alphabet_hash.index.include?(letter)
        letter
      else
        @alphabet_hash.index[letter]
      end
    end
  end

  def shift_applicator(number_array, key, time)
    shift = create_shift(@generator.key_padding(key), @generator.offset_generator(time))
    encrypted_string = []

    number_array.compact.each_with_index do |num, index|
      if num.class == String 
        encrypted_string << num 
      elsif
        index % 4 == 0
        encrypted_string << @generator.alphabet.rotate(shift[0])[num]
      elsif 
        index % 4 == 1
        encrypted_string << @generator.alphabet.rotate(shift[1])[num]
      elsif 
        index % 4 == 2
        encrypted_string << @generator.alphabet.rotate(shift[2])[num]
      elsif 
        index % 4 == 3 
        encrypted_string << @generator.alphabet.rotate(shift[3])[num]
      end
    end
    encrypted_string.join
  end 

  def un_shift_applicator(number_array, key, time)
    shift = reverse_shift(@generator.key_padding(key), @generator.offset_generator(time))
    decrypted_string = []

    number_array.compact.each_with_index do |num, index|
      if num.class == String 
        decrypted_string << num 
      elsif
        index % 4 == 0
        decrypted_string << @generator.alphabet.rotate(shift[0])[num]
      elsif 
        index % 4 == 1
        decrypted_string << @generator.alphabet.rotate(shift[1])[num]
      elsif 
        index % 4 == 2
        decrypted_string << @generator.alphabet.rotate(shift[2])[num]
      elsif 
        index % 4 == 3 
        decrypted_string << @generator.alphabet.rotate(shift[3])[num]
      end
    end
    decrypted_string.join
  end 
end 