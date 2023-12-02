#frozen_string_literal: true

start_time = Time.now

INPUT_FILE = 'input.txt'

input = File.read(INPUT_FILE).split("\n")

integers = {
  'one'   => 1,
  'two'   => 2,
  'three' => 3,
  'four'  => 4,
  'five'  => 5,
  'six'   => 6,
  'seven' => 7,
  'eight' => 8,
  'nine'  => 9
}

total_calibration = 0

input.each do |line|
  numbers_in_line = []

  for i in 0..line.length - 1 do
    if line[i].match(/\d/)
      numbers_in_line << line[i]
      next
    end
    
    if line[i].match(/[a-z]/)
      for j in ((i + 1)..(line.length - 1)) do
        if line[j].match(/\d/)
          break
        end

        if integers.keys.include?(line[i..j])
          numbers_in_line << integers[line[i..j]]
          break
        end
      end
    end
  end

  total_calibration += "#{numbers_in_line[0]}#{numbers_in_line[-1]}".to_i
end

end_time = Time.now

puts total_calibration

puts end_time - start_time