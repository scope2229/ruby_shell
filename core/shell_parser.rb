# frozen_string_literal: true

require 'parslet'

module Core
  ##
  # ShellParser class used to parse cmds and args from the shell input
  class ShellParser < Parslet::Parser
    root :cmdline

    rule(:cmdline) { pipeline | command }
    rule(:pipeline) { command.as(:left) >> pipe.as(:pipe) >> cmdline.as(:right) }
    rule(:command) { arg.as(:arg).repeat(1).as(:command) }
    rule(:arg) { unquoted_arg | single_quoted_arg }
    rule(:unquoted_arg) { match[%q(^\s'|)].repeat(1) >> space? }
    rule(:single_quoted_arg) { str("'").ignore >> match[%q(^\\\')].repeat(0) >> str("'").ignore >> space? }
    rule(:pipe) { str('|') >> space? }
    rule(:space?) { space.maybe }
    rule(:space) { match[%q(\s)].repeat(1).ignore }
  end
end
