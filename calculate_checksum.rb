require './lib/calculate_checksum'

p CalculateChecksum.new.execute(File.read("input.txt"))
