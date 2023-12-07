#frozen_string_literal: true

input = File.read('input.txt').split("\n")

times = input[0].split(/Time:/)[1].split(' ')
distances = input[1].split(/Distance:/)[1].split(' ')

winning_conditions = []

times.each_with_index do |time, index|
  time = time.to_i

  winning_conditions[time] = []
  for i in (1..time)
    if i * (time - i) > distances[index].to_i
      winning_conditions[time] << i
    end
  end
end

p winning_conditions.compact.map { |x| x.length }.inject(&:*)