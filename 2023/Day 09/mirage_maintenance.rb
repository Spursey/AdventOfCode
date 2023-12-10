# frozen_string_literal: true

class SensorSequence
  def initialize(seq)
    @sequence = seq
    @differences = []
    @difference_counts = 0
    @final_difference = 0
  end

  def find_final_difference
    @final_difference = @differences.map { |x| x.last }.sum
  end

  def find_next_number
    @sequence.last.to_i + @final_difference
  end

  def find_differences
    i = 0

    while true
      sequence = nil

      @differences[@difference_counts] = []

      if @difference_counts == 0
        sequence = @sequence
      else
        sequence = @differences[@difference_counts - 1]
      end

      for i in (0..sequence.length - 1)
        @differences[@difference_counts] << sequence[i + 1].to_i - sequence[i].to_i unless sequence[i + 1].nil?
      end

      all_zeroes = true
      @differences[@difference_counts].each do |number|
        all_zeroes = false unless number == 0
      end

      return if all_zeroes

      @difference_counts += 1

      i += 1
    end
  end
end

total = 0

input = File.readlines('input.txt')

input.each do |line|
  line = line.split(' ')

  sequence = SensorSequence.new(line)

  sequence.find_differences
  sequence.find_final_difference
  total += sequence.find_next_number
end

puts total

