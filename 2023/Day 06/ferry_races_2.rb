#frozen_string_literal: true

input = File.read('input_2.txt').split("\n")

time = input[0].split(/Time:/)[1].strip.to_i
distance = input[1].split(/Distance:/)[1].strip.to_i

winning_conditions = []

for i in (1..time)
  if i * (time - i) > distance.to_i
    winning_conditions << i
  end
end

p winning_conditions.count