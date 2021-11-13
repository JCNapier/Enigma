require "./lib/shift"
require "./lib/enigma"
require "./lib/generator"
require "./lib/alphabet_index"

enigma = Enigma.new
message   = ARGV[0]
encrypted = ARGV[1]

message_file = File.new(message).read 
File.open(encrypted, "w") do |file|
    enigma.encrypt(message_file)
    file.puts enigma.encrypted[:encryption]
    puts "Created #{encrypted} with the key #{enigma.gen_key} and date #{enigma.gen_time}"
end