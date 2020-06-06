# frozen_string_literal: true

module Core
  ##
  # Core::Command
  # handles executing of commands given via Readline.readline
  class Command
    def initialize(args)
      @args = args
    end

    def execute(stdin, stdout)
      # if the command is a shell command it is executed using spawn
      # which returns an array of pids
      [spawn(*@args, 0 => stdin, 1 => stdout)]
    end
  end
end
