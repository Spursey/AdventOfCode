#frozen_string_literal: true

input = File.read('input.txt').split("\n")

def print_card_quantities(card_quantities)
  card_quantities.each_with_index do |quantity, index|
    puts "Card: #{index + 1}: #{quantity}"
  end
end

def identify_card_matches(card)
  game, numbers = card.split(/:/)

  winning_numbers, my_numbers = numbers.strip.split(' | ')

  winning_numbers = winning_numbers.split(' ')
  my_numbers = my_numbers.split(' ')

  my_numbers.intersection(winning_numbers).length
end

def update_card_quantities(quantity, quantity_counts, start_index)
  i = 0

  while i < quantity
    quantity_counts[start_index + i] += 1

    i += 1
  end
end

scratch_card_quantities = input.map { |x| 1 }

input.each_with_index do |card, index|
  (0..scratch_card_quantities[index] - 1).each do |times|
    matches = identify_card_matches(card)

    next if matches == 0

    update_card_quantities(matches, scratch_card_quantities, index + 1)
  end
end

puts scratch_card_quantities.sum
