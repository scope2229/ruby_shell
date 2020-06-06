# frozen_string_literal: true

module Core
  ##
  # Core::Help.new 
  # displays the help menu in terminal
  class Help
    def initialize
      puts ''
      puts 'Ruby shell terminal'
      puts ''
      puts 'Standard unix commands can be entered here including ability to pipe commands'
      puts ''
      puts 'Built in commands:'
      puts ''
      puts 'hist - Returns commands used in the current session.'
      puts 'help - Displays the help info'
      puts 'exit, quit, q - Exits the terminal'
      puts ''
    end
  end
end
