# frozen_string_literal: true

require_relative 'command'
require_relative 'pipeline'

module Core
  ##
  # Core::Transform
  class Transform < Parslet::Transform
    # rule(left: subtree(:left), pipe: '|', right: subtree(:right)) { Pipeline.new(left, right) }
    rule(command: sequence(:args)) { Command.new(args) }
    rule(arg: simple(:arg)) { arg }
  end
end
