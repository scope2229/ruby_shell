# frozen_string_literal: true

require 'readline'

module Core
  ##
  # AutoComplete works as mentioned it auto completes a command given
  class AutoComplete
    def initialize(args)
      @input = args
    end

    def execute
      comp = proc { |s| Readline::HISTORY.grep(/^#{Regexp.escape(s)}/) }
      Readline.completion_append_character = ' '
      Readline.completion_proc = comp
    end
  end
end
