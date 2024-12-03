# frozen_string_literal: true
INPUT_FILE = ARGV[0]

total = 0
execute_commands = true
current_command = ''

File.readlines(INPUT_FILE).each_with_index do |line, index|
  line.split('').each_with_index do |char, index|
    current_command += char

    if current_command.scan(/don\'t\(\)/).length > 0
      execute_commands = false
      current_command = ''
    elsif current_command.scan(/do\(\)/).length > 0
      execute_commands = true
      current_command = ''
    elsif current_command.scan(/(mul)\((\d{1,3})\,(\d{1,3})\)/).length > 0 && execute_commands
      instructions = current_command.scan(/(mul)\((\d{1,3})\,(\d{1,3})\)/)

      instructions.each do |instruction|
        total += instruction[1].to_i * instruction[2].to_i
      end

      current_command = ''      
    end
  end

  current_command = ''
end

puts total