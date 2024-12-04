# frozen_string_literal: true

INPUT_FILE = ARGV[0]

class Report
  def initialize(levels)
    @levels = levels.split(' ')
    @init_level_length = @levels.length

    @valid_report = self.is_valid?(@levels)

    unless @valid_report
      for i in (0..@levels.length - 1) do
        adjusted_levels = @levels.dup
        adjusted_levels.delete_at(i)

        if self.is_valid?(adjusted_levels)
          @@valid_reports += 1
          break
        end
      end
    end

    @@valid_reports += 1 if @valid_report
  end

  def is_valid?(levels)
    increasing_levels = levels[0].to_i < levels[1].to_i

    levels.each_with_index do |level, index|
      next if levels[index + 1] == nil

      if level.to_i == levels[index + 1].to_i 
        return false
      elsif level.to_i > levels[index + 1].to_i && increasing_levels
        return false
      elsif level.to_i < levels[index + 1].to_i && !increasing_levels
        return false
      end
      
      unless level_within_parameters?(level.to_i, levels[index + 1].to_i)
        return false
      end
    end

    return true
  end

  def level_within_parameters?(current_level, next_level)
    (next_level.to_i - current_level.to_i).abs <= 3
  end

  def display_valid_reports
    puts @@valid_reports
  end

  private
    @@valid_reports = 0
end

reports = []

File.readlines(INPUT_FILE).each_with_index do |line, index|
  reports << Report.new(line)
end

reports[0].display_valid_reports