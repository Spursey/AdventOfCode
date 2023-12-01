#frozen_string_literal: true

inputs = File.read('input.txt').split("\n").map { |x| x.to_i }

inputs_length = inputs.length - 1

for i in 0..inputs_length do
  for j in 1..inputs_length do
    for k in 2..inputs_length do
      if inputs[i] + inputs[j] + inputs[k] == 2020      
        puts inputs[i] * inputs[j] * inputs[k]
        exit
      end
    end
  end
end