#frozen_string_literal: true

total_visible_trees = 0

input = File.read('input.txt').split("\n")

for i in 0..input.length - 1
  if input[i] == '#' && (!input[i + 1].nil? && input[i + 1][i].split('') == '#')
    total_visible_trees += 1
  end
end

puts total_visible_trees