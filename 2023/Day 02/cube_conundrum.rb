#frozen_string_literal: true

MAX_RED = 12
MAX_GREEN = 13
MAX_BLUE = 14

def count_check(count, color)
  if color == 'red'
    count <= MAX_RED
  elsif color == 'green'
    count <= MAX_GREEN
  elsif color == 'blue'
    count <= MAX_BLUE
  end
end

sum_of_game_ids = 0

File.readlines('input.txt').each do |game|
  valid_game = true

  game_number = game.split(':')[0].split[1]

  game.split(/Game [0-9]*:/).each do |all_cubes|
    next if all_cubes == ''

    all_cubes.strip.split(';').each do |cube_groups|
      cube_groups.strip.split(',').each do |hand|
        count, color = hand.split(' ')

        unless count_check(count.to_i, color)
          valid_game = false

          break
        end
      end
    end
  end

  sum_of_game_ids += game_number.to_i if valid_game
end

puts sum_of_game_ids