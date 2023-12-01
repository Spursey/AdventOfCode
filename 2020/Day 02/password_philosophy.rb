#frozen_string_literal: true

inputs = File.read('input.txt').split("\n")
inputs_length = inputs.length - 1

correct_password_count = 0

inputs.each do |input|
  rules, password = input.split(':')
  lengths, char = rules.split(' ')

  min_length, max_length = lengths.split('-')

  password = password.split('').select { |x| x == char }

  correct_password_count += 1 if password.length >= min_length.to_i && password.length <= max_length.to_i
end

puts correct_password_count