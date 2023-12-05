#frozen_string_literal: true

input = File.read('input.txt').split("\n")

card_total = []

total_points = 0

input.each do |line|
  game, numbers = line.split(/:/)
  game = game.split(' ')[1].to_i - 1

  winning_numbers, my_numbers = numbers.strip.split(' | ')

  winning_numbers = winning_numbers.split(' ')
  my_numbers = my_numbers.split(' ')

  winning_number_count = 0
  points = 0

  my_numbers.each do |my_number|
    if winning_numbers.include?(my_number)
      winning_number_count += 1

      if winning_number_count == 1
        points += 1
      else
        points *= 2
      end
    end
  end

  total_points += points
end

puts total_points