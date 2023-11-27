#frozen_string_literal: true

INPUT_FILE = 'input.txt'

counter = 0

cur_pair = nil
prev_pair = nil

pairs_file = File.open(INPUT_FILE)
pair_data = pairs_file.readlines.map(&:chomp)

pair_data.each_with_index do |item, index|
  if index % 2 == 0 && index != 0
    left = pair_data[index-2]
    right = pair_data[index-1]
    
    
    puts '-------------------------'
  end
end