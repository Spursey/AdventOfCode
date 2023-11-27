#frozen_string_literal: true

INPUT_FILE = 'input.txt'

# only used to visualize with example data
def draw_grid(grid, h_loc, t_loc)
  (0..4).each do |x|
    (0..5).each do |y|
      if [x, y] == h_loc
        print 'H'
      elsif [x, y] == t_loc
        print 'T'
      elsif [x, y] == [4, 0]
        print 's'
      else
        print '.'
      end
    end
    print "\n"
  end
  print "\n"
end

movements_file = File.open(INPUT_FILE)

t_location = [4, 0]
h_location = [4, 0]

rope_locations = []
(0..9).each do |num|
  rope_locations[num] = [4, 0]
end
puts rope_locations[0][1]
#pp rope_locations
t_visited_locations = []

grid = Array.new(4)
grid.each_with_index do |space, index|
  grid[index] = Array.new(5)
end

File.foreach(INPUT_FILE) do |line|
  direction, length = line.split(' ')
  length = length.to_i
  
  i = 0
  while i < length do

    rope_locations.each_with_index do |rope_locations, index|
      #puts rope_locations[index]
      case direction
      when 'R'
        rope_locations[index][1] += 1

        if (rope_locations[index][0] == rope_locations[index + 1][0]) && ((rope_locations[index][1] - rope_locations[index + 1][1]).abs > 1)
          rope_locations[index + 1][1] += 1
        elsif (rope_locations[index][0] > rope_locations[index + 1][0]) && ((rope_locations[index][1] - rope_locations[index + 1][1]).abs > 1) 
          rope_locations[index + 1][1] += 1
          rope_locations[index + 1][0] += 1
        elsif (rope_locations[index][0] < rope_locations[index + 1][0]) && ((rope_locations[index][1] - rope_locations[index + 1][1]).abs > 1) 
          rope_locations[index + 1][1] += 1
          rope_locations[index + 1][0] -= 1
        end
      when 'U'
         rope_locations[index][0] -= 1

        if (rope_locations[index][1] == rope_locations[index + 1][1]) && ((rope_locations[index][0] - rope_locations[index + 1][0]).abs > 1)
          rope_locations[index + 1][0] -= 1
        elsif (rope_locations[index][1] > rope_locations[index + 1][1]) && ((rope_locations[index][0] - rope_locations[index + 1][0]).abs > 1) 
          rope_locations[index + 1][0] -= 1
          rope_locations[index + 1][1] += 1
        elsif (rope_locations[index][1] < rope_locations[index + 1][1]) && ((rope_locations[index][0] - rope_locations[index + 1][0]).abs > 1)
          rope_locations[index + 1][0] -= 1
          rope_locations[index + 1][1] -= 1
        end
      when 'L'
         rope_locations[index][1] -= 1

        if (rope_locations[index][0] == rope_locations[index + 1][0]) && ((rope_locations[index][1] - rope_locations[index + 1][1]).abs > 1)
          rope_locations[index + 1][1] -= 1
        elsif (rope_locations[index][0] > rope_locations[index + 1][0]) && ((rope_locations[index][1] - rope_locations[index + 1][1]).abs > 1)
          rope_locations[index + 1][0] += 1
          rope_locations[index + 1][1] -= 1
        elsif (rope_locations[index][0] < rope_locations[index + 1][0]) && ((rope_locations[index][1] - rope_locations[index + 1][1]).abs > 1)
          rope_locations[index + 1][0] -= 1
          rope_locations[index + 1][1] -= 1
        end
      when 'D'
         rope_locations[index][0] += 1

        if ( rope_locations[index][1] == rope_locations[index + 1][1]) && ((rope_locations[index][0] - rope_locations[index + 1][0]).abs > 1)
          rope_locations[index + 1][0] += 1
        elsif (rope_locations[index][1] > rope_locations[index + 1][1]) && ((rope_locations[index][0] - rope_locations[index + 1][0]).abs > 1)
          rope_locations[index + 1][0] += 1
          rope_locations[index + 1][1] += 1
        elsif (rope_locations[index][1] < rope_locations[index + 1][1]) && ((rope_locations[index][0] - rope_locations[index + 1][0]).abs > 1)
          rope_locations[index + 1][0] += 1
          rope_locations[index + 1][1] -= 1
        end
      end

      i += 1
      t_visited_locations << [rope_locations[index + 1][0], rope_locations[index + 1][1]]
      #draw_grid
    end
  end
end

puts t_visited_locations.uniq.length