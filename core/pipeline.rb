# frozen_string_literal: true

module Core
  ##
  # Core::Pipeline allows for commands to be piped to one another
  # Example:
  # ls -a | sort
  # example output
  # .
  # ..
  # .git
  # src
  # README.md
  class Pipeline
    def initialize(left, right)
      @left = left
      @right = right
    end

    def execute(stdin, stdout)
      reader, writer = IO.pipe
      pids = @left.execute(stdin, writer.fileno) + @right.execute(reader.fileno, stdout)
      reader.close
      writer.close
      pids
    end
  end
end
