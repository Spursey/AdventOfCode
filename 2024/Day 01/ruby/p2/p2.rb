# frozen_string_literal: true

left_numbers, right_numbers = [], []
total = 0

File.open('input.txt').each do |line|
  left, right = line.split(' ')

  left_numbers << left.to_i
  right_numbers << right.to_i
end

(0..left_numbers.length - 1).each do |i|
  total += left_numbers[i] * right_numbers.count { |x| x == left_numbers[i] }
end

puts total