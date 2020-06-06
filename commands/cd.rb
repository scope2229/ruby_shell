# frozen_string_literal: true

require 'shell'

module Commands
  ##
  # Cd used to navigate through directories on the device
  class Cd
    def initialize(path)
      @path = path
    end

    def execute
      # puts "HELLO"
      # shdir = Shell.cd(@path)
      # shdir
    end
  end
end
