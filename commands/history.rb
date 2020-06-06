# frozen_string_literal: true

module Commands
  ##
  # Commands::History displays the previoulsy used commands from the current shell
  # History is not preserved between sessions.
  class History
    # Read the shell input history
    attr_reader :hist
    def initialize
      @hist = Readline::HISTORY.to_a
    end

    # Commands::History.clear_history clears all previous entries into Readline
    # Example:
    # hist = Commands::Hostory.new
    # hist.clear_history
    def clear_history
      Readline::HISTORY.clear
    end
  end
end
