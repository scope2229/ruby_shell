# frozen_string_literal: true

module Core
  ##
  # Core::Help.new 
  # displays the help menu in terminal
  class Help
    def initialize
      title
      description
      commands
    end

    def title
      puts '',
           ' Ruby Shell Terminal'
    end

    def description
      puts '',
           ' Standard unix commands can be entered here including ability to pipe commands',
           ''
    end

    def commands
      puts ' Built in commands:',
           '',
           '  hist - Returns commands used in the current session.',
           '  help - Displays the help info',
           '  exit, quit, q - Exits the terminal',
           ''
    end
  end
end
