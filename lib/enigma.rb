class Enigma
  attr_reader :generator,
              :alphabet_hash,
              :gen_key, 
              :gen_time, 
              :encrypted,
              :decrypted

  def initialize 
    @generator      = Generator.new 
    @shift          = Shift.new
    @alphabet_hash  = AlphabetIndex.new
    @gen_key        = @generator.key_padding(@generator.key_generator) 
    @gen_time       = @generator.offset_generator
    @encrypted      = {encryption: nil, key: nil, date: nil}
    @decrypted      = {decryption: nil, key: nil, date: nil}
  end 

  def encrypt(message, key = @gen_key, time = @gen_time)
    new_key     = @generator.key_padding(key)
    new_time    = @generator.offset_generator(time)
    shift       = @shift.create_shift(new_key, new_time)
    letter_code = @shift.letters_to_integers(message.downcase)
    encrypted_string = @shift.shift_applicator(letter_code, key, time)
     
    @encrypted[:encryption] = encrypted_string
    @encrypted[:key] = key
    @encrypted[:date] = time
    @encrypted
  end

  def decrypt(message, key, time)
    new_key     = @generator.key_padding(key)
    new_time    = @generator.offset_generator(time)
    shift       = @shift.reverse_shift(new_key, new_time)
    letter_code = @shift.letters_to_integers(message.downcase)
    decrypted_string = @shift.un_shift_applicator(letter_code, key, time)

    if time.class == String
      @decrypted[:date] = time
    elsif 
      @decrypted[:date] = new_time
    end

    @decrypted[:decryption] = decrypted_string
    @decrypted[:key] = new_key
    @decrypted
  end
end 