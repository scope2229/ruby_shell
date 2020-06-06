# frozen_string_literal: true

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
