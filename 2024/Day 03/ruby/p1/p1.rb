# frozen_string_literal: true
require 'pp'
INPUT_FILE = ARGV[0]

total = 0

File.readlines(INPUT_FILE).each_with_index do |line, index|
  instructions = line.scan(/mul\([0-9]+\,[0-9]+\)/)

  instructions.each do |instruction|
    instruction.scan(/\([0-9]+\,[0-9]+\)/).each do |values|
      values.gsub!('(', '').gsub!(')', '')

      x, y = values.split(',')

      total += x.to_i * y.to_i
    end
  end
end

puts total