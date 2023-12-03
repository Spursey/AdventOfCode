#frozen_string_literal: true

sum_of_game_powers = 0

File.readlines('input.txt').each do |game|
  min_cube_count = {
    red: 0,
    green: 0,
    blue: 0
  }

  game_number = game.split(':')[0].split[1]

  game.split(/Game [0-9]*:/).each do |all_cubes|
    next if all_cubes == ''

    all_cubes.strip.split(';').each do |cube_groups|
      cube_groups.strip.split(',').each do |hand|
        count, color = hand.split(' ')

        min_cube_count[color.to_sym] = count.to_i if count.to_i > min_cube_count[color.to_sym]
      end
    end
  end

  sum_of_game_powers += min_cube_count[:red] * min_cube_count[:green] * min_cube_count[:blue]
end

puts sum_of_game_powers