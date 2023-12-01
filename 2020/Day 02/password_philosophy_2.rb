#frozen_string_literal: true

def verify_password(pw, char, first, second)
  return false if pw[first] == char && pw[second] == char

  pw[first] == char || pw[second] == char
end

inputs = File.read('input.txt').split("\n")
inputs_length = inputs.length - 1

correct_password_count = 0

inputs.each do |input|
  rules, password = input.split(':')
  lengths, char = rules.split(' ')

  first_position, second_position = lengths.split('-')

  password = password.strip

  correct_password_count += 1 if verify_password(password, char, first_position.to_i - 1, second_position.to_i - 1)
end

puts correct_password_count