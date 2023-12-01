#frozen_string_literal: true

inputs = File.read('input.txt').split("\n").map { |x| x.to_i }

total_increases = 0

inputs.each_with_index do |input, index|
  if index < inputs.length - 1 && input < inputs[index + 1]
    total_increases += 1
  end
end

puts total_increases