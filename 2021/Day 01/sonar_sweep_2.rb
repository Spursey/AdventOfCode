#frozen_string_literal: true

def sum_inputs(inputs, starting_idx)
  inputs[starting_idx] + inputs[starting_idx + 1] + inputs[starting_idx + 2]
end

inputs = File.read('input.txt').split("\n").map { |x| x.to_i }

total_increases = 0

inputs.each_with_index do |input, index|
  if !inputs[index + 3].nil? && (sum_inputs(inputs, index) < sum_inputs(inputs, index + 1))
    total_increases += 1
  end
end

puts total_increases