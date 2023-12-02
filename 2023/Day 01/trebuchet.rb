#frozen_string_literal: true

INPUT_FILE = 'input.txt'

input = File.read(INPUT_FILE).split("\n")

total_calibration = 0

input.each do |line|
  current_line_value = 0

  chars = line.split('')

  line_numbers = chars.map { |x| x.match(/[0-9]/).to_s.to_i }.reject { |y| y == 0 }

  if line_numbers.length == 1
    total_calibration += "#{line_numbers[0]}#{line_numbers[0]}".to_i
    next
  end

  total_calibration += "#{line_numbers[0]}#{line_numbers[-1]}".to_i
end

puts total_calibration