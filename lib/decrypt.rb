require "time"
require "./lib/enigma"
require "./lib/generator"
require "./lib/alphabet_index"

enigma = Enigma.new
encrypted = ARGV[0]
decrypted = ARGV[1]
key = ARGV[2]
time = ARGV[3]
encrypted_file = File.new(encrypted).read 
File.open(decrypted, "w") do |file|
    file.puts enigma.decrypt(encrypted_file.scan(/\w+/)[1], key, time)
    puts "Created #{decrypted} with the key #{key} and date #{time}"
end